#!/usr/bin/env python3
# -*- coding:UTF-8

'''
Created on 2022-04-14
Descriptions: 调用钉钉的自定义机器人发送消息。
Ref： https://open.dingtalk.com/document/group/custom-robot-access

@author: milkystar
'''

import json
import logging
import time
from datetime import datetime
import smtplib
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.header import Header

import matplotlib
import matplotx
import pymysql
import pytz
import redis
import requests
from flask import Flask, request, jsonify
from loguru import logger

import argparse
import configparser

# 定义日志文件名称及路径
from matplotlib import pyplot as plt
from matplotlib.ticker import FuncFormatter
import matplotx.styles as mpstyle

log_file = "qfusion-webhook.log"

# 创建 TimedRotatingFileHandler
# 使用 rotation="00:00" 表示在每天午夜进行日志切分
logger.add(log_file, rotation="00:00", retention="30 days", encoding="utf-8")

app = Flask(__name__)
# webhook 7*24
notify_url724 = "https://oapi.dingtalk.com/robot/send?access_token=0e237e9d363a3d451da5ae878dddf67b8573ae90840c0c96c1af8c141f05996e"
# webhook 单独群聊
notify_url = "https://oapi.dingtalk.com/robot/send?access_token=b75a841f64c2618fe9e2b6a1c831ff7e667b8236add4faf6912e50e8d9de2c61"
headers = {
    'Content-Type': 'application/json;charset=utf-8'
}

dingtalk_keytext = "数据库私有云告警"


class ServiceGroup:
    def __init__(self):
        ## 推送到服务群
        self.service_group_dict = {
            "kuaijihesuan": {
                "group_id": 125,
                "notify_url": "https://oapi.dingtalk.com/robot/send?access_token=d09bd721db046035c9579b649164ebfeb12aedf6b5adc66401c578aa6f9e5c31",
            },
            "fengkong": {
                "group_id": 105,
                "notify_url": "https://oapi.dingtalk.com/robot/send?access_token=1d0e07ee4d2cc3a0a8fdf62feb0e32cbe3a966f9b8ab7173ee72950d42b46fa4",
                # 测试webhook地址
                # "notify_url": "https://oapi.dingtalk.com/robot/send?access_token=b75a841f64c2618fe9e2b6a1c831ff7e667b8236add4faf6912e50e8d9de2c61"
            },
            "cmis": {
                "group_id": 108,
                "notify_url": "https://oapi.dingtalk.com/robot/send?access_token=ffbe0b61ec688d7c375cf5bf6b1666ee3221009eec485e8b67a3e3b832918dec"
            }

        }

    def get_notify_url(self, group_id):
        for key, value in self.service_group_dict.items():
            if value.get("group_id") == group_id:
                return value.get("notify_url", "")
        return ""


@app.route('/healthz', methods=['GET'])
def healthz():
    return 'All ok'


@app.route("/api/v1/notify", methods=['POST'])
def notify():
    # 解析QCP传来的数据
    global response
    data = request.get_json()  # 使用 get_json 来接收QCP的告警数据
    # logger.info(data)
    severity = data['severity']
    cluster_name = data['cluster_name']
    alerting_target_name = data['labels']['alertingTargetName']
    a = qfusion_cmdb(args.config_path)
    alerting_target_alias_name = "未获取到"
    try:
        alerting_target_alias_name = a.get_alias_by_cluster_name(alerting_target_name)
    except Exception as e:
        logger.error(e)

    status = data['status']

    alert_name = data['alert_name']
    description = data['description']
    message = data['message']
    suggest = data['suggest']

    start_time = data['start_time']
    end_time = data['end_time']
    utc_tz = pytz.timezone('UTC')
    # 将 UTC 时间转换为北京时间
    beijing_tz = pytz.timezone('Asia/Shanghai')
    # 将字符串转换为datetime对象，并指定时区为UTC
    start_time_bg = datetime.strptime(start_time, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=utc_tz).astimezone(beijing_tz)
    end_time_bg = datetime.strptime(end_time, '%Y-%m-%dT%H:%M:%SZ').replace(tzinfo=utc_tz).astimezone(beijing_tz)
    # start_time_bg = start_time
    # end_time_bg = end_time
    # 构造发送到钉钉的数据结构

    text = f'告警集群: {alerting_target_alias_name}\n' \
           f'告警详情: {message}\n' \
           f'告警等级: {severity}\n' \
           f'告警状态: {status}\n' \
           f'操作建议: {suggest}\n' \
           f'开始时间: {start_time_bg}\n' \
           f'恢复时间: {end_time_bg}' \
           f'其他   ：{alert_name},{description}' \
        if status == "resolved" else f'告警集群: {alerting_target_alias_name}\n' \
                                     f'告警详情: {message}\n' \
                                     f'告警等级: {severity}\n' \
                                     f'告警状态: {status}\n' \
                                     f'操作建议: {suggest}\n' \
                                     f'开始时间: {start_time_bg}\n' \
                                     f'其他   ：{alert_name},{description}'

    title = f'[恢复] {dingtalk_keytext}\n' if status == "resolved" else f'[告警] {dingtalk_keytext}\n'

    payload = {
        "msgtype": "text",
        "text": {
            "content": title + text
        },
        "at": {
            "atMobiles": [
                # "13335086014",
                # "17854110959",
                # "15773410234"
            ],
            "atUserIds": [
                # "13m-w7820qwxqu"
            ]
        }
    }
    # 发送邮件
    mail = sendmail()
    try:
        mail.build_mail(str(f'{title}'), str(payload))
        logger.info("send mail success")
    except Exception as e:
        logger.error(e)

    try:
        response = requests.post(notify_url, data=json.dumps(payload), headers=headers)
        logger.info(payload)
        logger.info(response.content)  # Print Response
    except Exception as e:
        logger.info(payload)
        logger.error(str(response.content), e)

    return jsonify({"success": True})  # 返回值不重要，QCP以得到状态码200的返回为成功标志


def sendmsg2dingtalk_notify_url(payload):
    # 发送到钉钉
    global response
    try:
        response = requests.post(notify_url, data=json.dumps(payload), headers=headers)
        logger.info(payload)
        logger.info(response.content)  # Print Response
    except Exception as e:
        logger.info(payload)
        logger.error(str(response.content), e)
    return jsonify({"success": True})  # 返回值不重要，QCP以得到状态码200的返回为成功标志


def sendmsg2dingtalk_724_url(payload):
    # 发送到钉钉
    global response
    try:
        response = requests.post(notify_url724, data=json.dumps(payload), headers=headers)
        logger.info(payload)
        logger.info(response.content)  # Print Response
    except Exception as e:
        logger.info(payload)
        logger.error(str(response.content), e)
    return jsonify({"success": True})  # 返回值不重要，QCP以得到状态码200的返回为成功标志


def sendmsg2dingtalk_group(notify_url, payload):
    # 发送到钉钉
    global response
    try:

        response = requests.post(notify_url, data=json.dumps(payload), headers=headers)
        # logger.info(payload)
        # logger.info(response.content)  # Print Response
    except Exception as e:
        logger.info(payload)
        logger.error(str(response.content), e)
    return jsonify({"success": True})  # 返回值不重要，QCP以得到状态码200的返回为成功标志


class qfusion_cmdb:
    def __init__(self, config_path):
        # 创建配置解析器对象
        self.config = configparser.ConfigParser()
        self.config.read(config_path)  # 读取配置文件
        # 获取 qfusion_cmdb 相关配置
        # 获取数据库连接信息
        self.host = self.config.get('qfusion_cmdb', 'host')
        self.port = int(self.config.get('qfusion_cmdb', 'port'))
        self.user = self.config.get('qfusion_cmdb', 'user')
        self.password = self.config.get('qfusion_cmdb', 'password')
        self.database = self.config.get('qfusion_cmdb', 'database')

    def cmdb_conn(self) -> pymysql.Connection:
        db = pymysql.connect(host=self.host,
                             user=self.user,
                             password=self.password,
                             port=self.port,
                             database=self.database
                             )
        return db

    def get_alias_by_cluster_name(self, name):
        db = self.cmdb_conn()
        cursor = db.cursor()
        sql = f"""
        SELECT alias
        FROM
        cluster
        WHERE name = '{name}'
        """
        try:
            cursor.execute(sql)
            for rows in cursor.fetchone():
                db.close()
                return rows
        except Exception as e:
            db.close()
            logging.error("can not find cluster alias from table which name is cluster,get error{}".format(e))


class conn_saasdb():
    def __init__(self, config_path):
        # 创建配置解析器对象
        self.config = configparser.ConfigParser()
        self.config.read(config_path)  # 读取配置文件

        # 获取数据库连接信息
        self.host = self.config.get('saasdb', 'host')
        self.port = int(self.config.get('saasdb', 'port'))
        self.user = self.config.get('saasdb', 'user')
        self.password = self.config.get('saasdb', 'password')
        self.database = self.config.get('saasdb', 'database')

    def cmdb_conn(self) -> pymysql.Connection:
        db = pymysql.connect(host=self.host,
                             user=self.user,
                             password=self.password,
                             port=self.port,
                             database=self.database
                             )
        return db


@app.route('/api/v1/orch_change_ha', methods=['POST'])
def orch_change_ha():
    key_text = "mysql高可用"
    data = request.get_json()
    title = f'[Orch MySQL Ha alerts] {key_text} \n'
    payload = {
        "msgtype": "text",
        "text": {
            "content": title + f'----------------------------\n{data["message"]}'
        }
    }
    # logger.info(payload)
    # sendmsg2dingtalk_notify_url(payload)
    sendmsg2dingtalk_724_url(payload)
    return 'Success'


@app.route("/api/v1/backup_status", methods=['POST'])
def backup_status():
    key_text = "备份任务推送"
    data = request.get_json()  # 使用 get_json 来接收QCP的告警数据
    ## 集群名称
    cluster_name = data["cluster_name"]
    ## 备份状态
    backup_status = data["backup_status"]
    ## 存储节点
    storage_node = data["storage_node"]
    ## 文件路径
    file_path = data["file_path"]
    ## 数据量
    file_size = data["file_size"]
    ## 开始时间
    start_time = data["start_time"]
    ## 结束时间
    end_time = data["end_time"]
    test = f'----------------------------\n' \
           f'集群名称:      {cluster_name}\n' \
           f'备份状态:      {backup_status}\n' \
           f'存储节点:      {storage_node}\n' \
           f'文件路径:      {file_path}\n' \
           f'备份大小:      {file_size}\n' \
           f'开始时间:      {start_time}\n' \
           f'结束时间:      {end_time}'

    title = f'[Backup Task] {key_text} \n'
    payload = {
        "msgtype": "text",
        "text": {
            "content": title + test
        }
    }
    sendmsg2dingtalk_notify_url(payload)
    return 'Success'


@app.route('/')
def index():
    return """
Hello, World!
这是数据库team统一的webhook服务地址,负责发送消息到钉钉,email等
访问"/api/v1/all_apis", 获取v1版本所有api接口
"""


@app.route('/api/v1/all_apis')
def all_apis():
    return """
/api/v1/notify        :              qfusion钉钉告警推送接口
/api/v1/backup_status :              数据库集群备份状态推送接口
"""


class sendmail:
    def __init__(self, recipient=None):
        # 发件人和收件人的邮箱地址
        self.sender = 'it@haiercash.com'
        self.recipient = recipient
        self.smtp_server = '10.164.23.130'
        self.smtp_port = 25

        # 登录到SMTP服务器
        self.username = 'it@haiercash.com'
        self.password = 'Bigdata@2022'
        self.message = None

    def build_mail(self, subject, body):
        # 构造邮件
        message = MIMEText(body, 'plain', 'utf-8')
        message['From'] = Header(self.sender, 'utf-8')
        message['To'] = Header(self.recipient, 'utf-8')
        message['Subject'] = Header(subject, 'utf-8')

    def build_mail_with_image(self, subject, body, image_paths=None):
        # 构造邮件
        self.message = MIMEMultipart()
        self.message.attach(MIMEText(body, 'plain', 'utf-8'))
        self.message['From'] = Header(self.sender, 'utf-8')
        self.message['To'] = Header(self.recipient, 'utf-8')
        self.message['Subject'] = Header(subject, 'utf-8')
        if image_paths:
            for image_path in image_paths:
                with open(image_path, 'rb') as img_file:
                    img_part = MIMEImage(img_file.read())
                    img_part.add_header('Content-Disposition', 'attachment', filename=image_path)
                    self.message.attach(img_part)

    def send_mail(self):
        global server
        try:
            # 连接SMTP服务器
            server = smtplib.SMTP(self.smtp_server, self.smtp_port)
            server.starttls()  # 启用TLS加密

            server.login(self.username, self.password)

            # 发送邮件
            server.sendmail(self.sender, self.recipient, self.message.as_string())
            print('邮件发送成功')
        except Exception as e:
            print('邮件发送失败:', str(e))
        finally:
            # 关闭连接
            server.quit()


class MessageSuppressor:
    def __init__(self, config_path, suppress_duration):
        # 创建配置解析器对象
        self.config = configparser.ConfigParser()
        self.config.read(config_path)  # 读取配置文件

        self.suppress_duration = suppress_duration
        self.suppress_only = False
        self.suppress_msg = self.config.get('message_suppressor', 'suppress_msg')
        redis_host = self.config.get('redis', 'host')
        redis_port = int(self.config.get('redis', 'port'))
        redis_password = self.config.get('redis', 'password')
        redis_db = int(self.config.get('redis', 'db'))

        self.redis_client = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password,
                                              db=redis_db)  # 创建Redis客户端

    def process_message(self, message) -> bool:
        group_key = self.get_group_key(message)

        # 判断是否存在该分组的key，如果存在则不发送消息
        if self.redis_client.exists(group_key):
            if self.suppress_only:
                logging.warning(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] [发送消息] {self.suppress_msg}: {message}")
                return False
            else:
                logger.info(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] [抑制消息] {self.suppress_msg}: {message}")
                return True

        # 不存在该分组的key，发送消息并设置过期时间
        logger.info(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] [发送消息] {message}")
        self.redis_client.setex(group_key, self.suppress_duration, time.time())

        return False

    def get_group_key(self, message):
        # 默认分组规则：以 message_topic, ins_ip, ins_port 为例
        return f"{message.get('message_topic', '')}-{message.get('ins_ip', '')}-{message.get('ins_port', '')}"


@app.route('/api/reset', methods=['POST'])
def reset():
    try:

        data = request.get_json()
        info = data.get('info')
        ins_ip = data.get('ins_ip')
        ins_port = data.get('ins_port')
        message_topic = data.get('message_topic')
        suppress_duration = data.get('suppress_duration')

        ## 定义推送抑制时间, 单位: s 消息抑制间隔 - 数据采集间隔
        if suppress_duration == 0:
            suppress_duration = 3600 - 5
            # 测试消息1
        message1 = {
            "message_topic": message_topic,
            "ins_ip": ins_ip,
            "ins_port": ins_port,
            "info": info
        }

        suppressor = MessageSuppressor(args.config_path, suppress_duration)
        if not suppressor.process_message(message1):
            ## 根据instance id 访问saasdb，去查找群的webhook
            # 使用解析后的参数创建 conn_saasdb 实例
            saasdb = conn_saasdb(args.config_path)
            db = saasdb.cmdb_conn()
            query = f"""
            SELECT concat(si.ip,'_',si.port), sp.id, sd.domain_name
            FROM saas_instance si
            JOIN saas_domain sd ON si.domain_id = sd.id
            JOIN saas_project sp ON sd.proj_id = sp.id
            WHERE si.ip='{ins_ip}'
            AND si.port={ins_port}
            """

            cursor = db.cursor()
            cursor.execute(query)

            # 获取查询结果
            row = cursor.fetchone()  # 使用 fetchone() 获取单行结果

            # 处理查询结果
            if row is not None:
                # 根据表的列索引访问数据
                column1 = row[0]
                column2 = row[1]
                column3 = row[2]
                # 或者根据列名访问数据
                # column1 = row['column1']
                # column2 = row['column2']

                # 在这里进行处理或打印数据

                message = {
                    "msgtype": "text",
                    "text": {
                        "content": f"【消息推送】:  {time.strftime('%Y-%m-%d %H:%M:%S')}\n【消息主题】:  {message_topic}\n【实例名称】:  {column1}\n【集群名称】:  {column3}\n【推送说明】:  {info}"
                    }

                }

            # 关闭游标和连接
            cursor.close()
            db.close()

            # 执行重置逻辑
            # ...
            # 创建 ServiceGroup 实例
            service_group = ServiceGroup()

            # 调用 get_notify_url 方法获取 notify_url
            group_id = column2
            notify_url = service_group.get_notify_url(group_id)
            sendmsg2dingtalk_group(notify_url, message)
        else:
            pass
        response = {'message': 'Reset successful'}
        return jsonify(response)
    except Exception as e:
        response = {'message': f'Reset failed,err:{e}'}
        return jsonify(response)


@app.route('/api/reset_email', methods=['POST'])
def reset_email():
    try:
        data = request.get_json()
        # ---------------------- 画图 ----------------------
        binlog_image_file = 'binlog_image_file.png'
        data_image_file = 'data_image_file.png'
        mp_image_file = 'mp_image_file.png'
        top_file = 'top_file.png'

        ## todo 看看合并前两个图 更直观
        # binlog文件
        binlog_data = data["info"]["binlog_dir_usage"]
        bl_titel = f'binlog文件使用信息{binlog_data["binlog_dir_name"]}'
        generate_bar_chart(del_key_from_dict("binlog_dir_name", binlog_data), binlog_image_file, bl_titel)
        # data文件
        data_data = data["info"]["datadir_usage"]
        dt_titel = f'datadir文件使用信息: {data_data["datadir_name"]}'
        generate_bar_chart(del_key_from_dict("datadir_name", data_data), data_image_file, dt_titel)
        # mountpoint
        mp_data = data["info"]["pmd_space_usage"]["mp_info"]
        mp_titel = f'磁盘挂载点使用信息: {mp_data["mp_name"]}'
        generate_bar_chart(del_key_from_dict("mp_name", mp_data), mp_image_file, mp_titel)
        # top文件
        top_file_data = data["info"]["table_use_most_space"]
        top_titile = "数据库最大文件"
        generate_bar_chart(top_file_data, top_file, top_titile)

        # 发送邮件 todo 查询对应的组
        cc = 'chenhao@haiercash.com,xiepeng@haiercash.com'
        images = [binlog_image_file, data_image_file, mp_image_file, top_file]
        mailer = sendmail(cc)

        # 构造邮件主题


        mailer.build_mail_with_image('test邮件主题', 'test邮件正文', image_paths=images)
        mailer.send_mail()







    except Exception as e:
        print("Error while getting JSON data:", str(e))
        return "Error while getting JSON data", 400

    if data is None:
        return "No valid JSON data found in the request", 400

    # 在这里对获取到的JSON数据进行处理

    return "JSON data received and processed successfully"


def del_key_from_dict(key: str, my_dict: dict) -> dict:
    # 删除特定的键
    if key in my_dict:
        del my_dict[key]
    return my_dict


# 转换函数：将带有单位的值转换为字节（B）
def convert_to_bytes(value_with_unit):
    units = {'B': 1, 'KB': 1024, 'MB': 1024 ** 2, 'GB': 1024 ** 3, 'TB': 1024 ** 4}
    value, unit = value_with_unit.split(' ')
    return float(value) * units[unit]


def format_bytes(x, pos):
    units = ['B', 'KB', 'MB', 'GB', 'TB']
    unit_index = 0
    while x >= 1024 and unit_index < len(units) - 1:
        x /= 1024
        unit_index += 1
    return f"{x:.2f} {units[unit_index]}"


def generate_bar_chart(data: dict, chart_image_file: str, titel: str, matplotx=None):
    # 转换数据中的值为字节
    data_bytes = {key: convert_to_bytes(value) for key, value in data.items()}

    data_dict = data_bytes
    categories = list(data_dict.keys())
    values = list(data_dict.values())

    plt.style.use('fivethirtyeight')
    matplotlib.rcParams['font.sans-serif'] = ['Arial Unicode MS']  # 或其他系统默认中文字体的名称
    matplotlib.use('Agg')
    # 设置自定义颜色
    colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd']

    plt.figure(figsize=(12, 6))  # 调整图形大小

    # 创建条形图
    bars = plt.bar(categories, values, color=colors)

    for bar in bars:
        yval = bar.get_height()
        plt.text(bar.get_x() + bar.get_width() / 2, yval, format_bytes(yval, 0),
                 ha='center', va='bottom', fontsize=10)

    plt.gca().spines['top'].set_visible(False)
    plt.gca().spines['right'].set_visible(False)

    plt.gca().set_facecolor('#f0f0f0')

    plt.xticks(rotation=45, ha='right', fontsize=12)  # 旋转并右对齐 x 轴标签
    plt.yticks(fontsize=12)

    plt.xlabel('参数', fontsize=12)
    plt.ylabel('指标', fontsize=12)
    plt.title(titel, fontsize=10)

    formatter = FuncFormatter(format_bytes)
    plt.gca().yaxis.set_major_formatter(formatter)

    plt.tight_layout()

    plt.savefig(chart_image_file)
    plt.close()


def generate_bar_chart2(data: dict, chart_image_file: str, titel: str, matplotx=None):
    # 转换数据中的值为字节
    data_bytes = {key: convert_to_bytes(value) for key, value in data.items()}
    data_dict = data_bytes
    categories = list(data_dict.keys())
    values = list(data_dict.values())

    # 创建条形图
    # 设置中文字体为系统默认中文字体

    matplotlib.rcParams['font.sans-serif'] = ['Arial Unicode MS']  # 或其他系统默认中文字体的名称
    matplotlib.use('Agg')

    plt.style.use('fivethirtyeight')

    # 设置自定义颜色
    colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd']
    plt.bar(data_bytes.keys(), data_bytes.values(), color=colors)

    # 去除上、右边框
    plt.gca().spines['top'].set_visible(False)
    plt.gca().spines['right'].set_visible(False)
    #
    # 设置背景颜色
    plt.gca().set_facecolor('#f0f0f0')
    # 设置标签字体大小和样式
    plt.xticks(rotation=45, fontsize=12)
    plt.yticks(fontsize=12)

    plt.bar(categories, values)
    # 设置标签字体大小和样式
    plt.xlabel('参数', fontsize=12)
    plt.ylabel('指标', fontsize=12)
    plt.title(titel, fontsize=10)

    plt.xticks(rotation=50)

    formatter = FuncFormatter(format_bytes)
    plt.gca().yaxis.set_major_formatter(formatter)

    plt.tight_layout()

    # 保存图像到文件
    plt.savefig(chart_image_file)
    plt.close()


def generate_bar_chart1(data: dict, chart_image_file: str, title: str):
    # 转换数据中的值为字节
    data_bytes = {key: convert_to_bytes(value) for key, value in data.items()}
    plt.style.use(matplotx.styles.dracula)

    data_dict = data_bytes
    categories = list(data_dict.keys())
    values = list(data_dict.values())
    # 创建条形图
    xpos = range(len(values))
    matplotlib.use('Agg')
    with plt.style.context(matplotx.styles.dracula):
        plt.style.use('default')  # 重置样式为默认，避免 GUI 问题
        plt.figure()
        plt.bar(xpos, values)
        plt.xticks(rotation=50)
        matplotx.show_bar_values()
        plt.title(title)

        formatter = FuncFormatter(format_bytes)
        plt.gca().yaxis.set_major_formatter(formatter)
        plt.show()
        plt.tight_layout()

    # 保存图像到文件
    plt.savefig(chart_image_file)
    plt.close()


def parse_args():
    # 创建 ArgumentParser 对象
    parser = argparse.ArgumentParser(description='Database Connection Configuration')

    # 添加配置文件路径的命令行参数
    parser.add_argument('--config_path', type=str, required=False, default='config.ini',
                        help='Path to the configuration file')

    # 解析命令行参数并返回
    return parser.parse_args()


if __name__ == "__main__":
    # 解析命令行参数
    args = parse_args()
    app.run(host="0.0.0.0", port=21000)
