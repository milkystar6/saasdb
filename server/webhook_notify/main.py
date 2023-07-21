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
from logging.handlers import TimedRotatingFileHandler
from datetime import datetime
import smtplib
from email.mime.text import MIMEText
from email.header import Header

import pymysql
import pytz
import requests
from flask import Flask, request, jsonify
from loguru import logger

# 定义日志文件名称及路径
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

## 定义推送抑制时间 s
suppress_duration_interval = 900


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
                # "notify_url": "https://oapi.dingtalk.com/robot/send?access_token=1d0e07ee4d2cc3a0a8fdf62feb0e32cbe3a966f9b8ab7173ee72950d42b46fa4",
                "notify_url": "https://oapi.dingtalk.com/robot/send?access_token=b75a841f64c2618fe9e2b6a1c831ff7e667b8236add4faf6912e50e8d9de2c61"
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
    a = cmdb()
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
        logger.info(payload)
        logger.info(response.content)  # Print Response
    except Exception as e:
        logger.info(payload)
        logger.error(str(response.content), e)
    return jsonify({"success": True})  # 返回值不重要，QCP以得到状态码200的返回为成功标志


class cmdb:
    def __init__(self):
        self.host = "172.19.206.66"
        self.port = 3306
        self.user = "root"
        self.password = "jh3gHjf6drsn@fJi"
        self.database = "webserver"

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
        # logger.info(sql)
        try:
            cursor.execute(sql)
            for rows in cursor.fetchone():
                # logger.info(rows)
                return rows
        except Exception as e:
            logging.error("can not find cluster alias from table which name is cluster,get error{}".format(e))


class conn_saasdb():
    def __init__(self):
        self.host = "127.0.0.1"
        self.port = 3307
        self.user = "root"
        self.password = "letsg0"
        self.database = "saasdb"

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
    logger.info(payload)
    sendmsg2dingtalk_notify_url(payload)
    # sendmsg2dingtalk_724_url(payload)
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
    def __init__(self):
        # 发件人和收件人的邮箱地址
        self.sender = 'it@haiercash.com'
        self.recipient = 'chenhao@haiercash.com,xiepeng@haiercash.com'
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
    def __init__(self, suppress_duration=suppress_duration_interval, suppress_only=False, suppress_msg=None):
        self.groups = {}  # 字典用于存储消息分组的时间戳
        self.suppress_duration = suppress_duration
        self.suppress_only = suppress_only
        self.suppress_msg = suppress_msg

    def process_message(self, message) -> bool:
        group_key = self.get_group_key(message)
        current_time = time.time()

        last_time = self.groups.get(group_key, 0)

        print(current_time, last_time, self.groups)
        time_difference = current_time - last_time

        if time_difference > self.suppress_duration:
            print("a")
            # 没有触发抑制，输出消息并更新分组时间戳
            logger.info(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] {message}")
            self.groups[group_key] = current_time
            print(self.groups)
            return True
        else:
            # 触发了抑制，根据 suppress_only 开关选择是否打印到日志
            if self.suppress_only:
                print("b1")
                logging.warning(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] {self.suppress_msg}: {message}")
                return False
            else:
                print("b2")
                logger.info(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] {self.suppress_msg}: {message}")
                return True

    def get_group_key(self, message):
        # 默认分组规则：以 message_topic, ins_ip, ins_port 为例
        return f"{message.get('message_topic', '')}-{message.get('ins_ip', '')}-{message.get('ins_port', '')}"


@app.route('/api/reset', methods=['POST'])
def reset():
    data = request.get_json()
    info = data.get('info')
    ins_ip = data.get('ins_ip')
    ins_port = data.get('ins_port')
    message_topic = data.get('message_topic')
    # 测试消息1
    message1 = {
        "message_topic": message_topic,
        "ins_ip": ins_ip,
        "ins_port": "3307",
        "info": info
    }

    ## 确定是否需要过滤重复的消息
    suppress_msg = "Message suppressed for 10 seconds"  # 定义推送消息抑制时间描述

    suppressor = MessageSuppressor(suppress_duration=suppress_duration_interval, suppress_only=True,
                                   suppress_msg=suppress_msg)

    if suppressor.process_message(message1):
        #
        # # 设置分组规则并发送消息2
        # group_key = "custom_group_key"  # 你可以根据需要设置分组规则
        # suppressor.set_group_key(message1, group_key)
        # suppressor.process_message(message1)
        #
        # # 测试消息3
        # message3 = {"message_topic": "ogg_db_binlog_dump", "ins_ip": "192.168.0.1", "ins_port": "3306", "info": "Message 3"}
        # suppressor.process_message(message3)

        ## 根据instance id 访问saasdb，去查找群的webhook

        saasdb = conn_saasdb()
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
                    "content": f"{time.strftime('%Y-%m-%d %H:%M:%S')} {message_topic} Column1: {column1}, Column2: {column2},Column3: {column3},{info}"
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

    response = {'message': 'Reset successful'}
    return jsonify(response)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=21000)
