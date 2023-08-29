#!/usr/bin/env python3
# -*- coding:UTF-8
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from email.mime.text import MIMEText

# 示例用法


smtp_server = "10.164.23.130"
smtp_port = 25
smtp_username = "it@haiercash.com"
smtp_password = "Bigdata@2022"

sender = "it@haiercash.com"
receiver = "zhangxiaogan@haiercash.com,xuhaoran@haiercash.com,zhanglei@haiercash.com"
cc = "chenhao@haiercash.com,xiepeng@haiercash.com,lizhao@haiercash.com,gaoguijun@haiercash.com,leicongfa@haiercash.com,wangxiaolong@haiercash.com,liangshufeng@haiercash.com"
subject = "催收数据库慢sql推送_20230619"
model = """
催收组的各位同学，大家好
  我希望能与大家讨论一下关于我们业务代码响应慢的问题。
  最近我们注意到一些查询的性能有所下降，并且经过分析发现这与部分SQL写法有关。
  作为团队的一员，我相信我们可以一起优化和改进，以提高系统的响应速度和用户体验。
  在过去的一段时间里，我仔细观察了一些查询的执行情况，并分析了相关的性能数据。
  我注意到一些SQL语句的执行时间较长，导致整个业务代码的响应时间也相应增加。
  我理解在实际开发中，我们面临着各种复杂的需求和业务场景，但是通过一些简单的优化措施，我们可以显著改善性能。
  
  以下是一些建议和最佳实践，供您参考：
  查询优化：请注意避免在查询中使用全表扫描、多次嵌套查询以及不必要的联接操作。尽量使用索引来加速查询，并考虑重构复杂查询为更简洁和高效的形式。
  数据库索引：合理设计和使用索引可以大幅提升查询性能。请确保您的SQL语句使用了适当的索引，并考虑创建新的索引来满足特定查询的需求。
  查询缓存：了解数据库的查询缓存机制，并确保合理开启和使用缓存。避免频繁的无意义查询，以减少不必要的数据库负载。
  我非常愿意与您一起深入探讨这些问题，并提供协助和支持。我们可以一起审查一些具体的查询语句，并进行优化测试。如果您需要任何数据库性能调优的资源或者培训资料，我也非常乐意提供帮助。
  感谢您的关注和配合。通过我们的合作，我相信我们能够显著提升业务代码的性能，提供更好的用户体验。
  期待与您的讨论和进一步合作。

最诚挚的问候，
[您的姓名]

"""
message = """
催收组的各位同学，大家好
  最近我们注意到一些查询的性能有所下降，并且经过分析发现这与部分SQL写法有关。
  数据库慢日志变多可能会出现如下问题：
  ```
    1、当出现慢查询，DDL 操作都会被阻塞，也就是说创建表、修改表、删除表、执行数据备份等操作都需要等待，这对实时的重要数据的系统来说是不可容忍的
    2、慢查可能会占用 mysql 的大量内存，严重的时候会导致服务器直接挂掉，整个系统直接瘫痪
    3、慢 SQL 的执行时间过长，可能会导致应用的进程因超时被 kill，无法返回结果给到客户端
    4、造成数据库幻读、不可重复读的概率更大，假设该慢 SQL 是一个更新操作但因执行时间过长未提交，而另一条 SQL 也在更新数据并且已提交，用户再次查询的时候，看到的数据可能与实际结果不符
    5、严重影响用户体验，SQL 的执行时间越长，页面加载数据耗时也就越长
  ```
  并有如下top slow sql
  1、SELECT COUNT( * ) FROM auth_message WHERE (isactive = 1 AND recipient = 1202 AND isread = 0)\G  
  该sql来自的业务地址和出现频率
  # Hosts        10.166.206.3 (32527/50%)... 1 more
  # Users        rw_sword
  # total        64942
  2、SELECT t8.id,t8.cont_no,t8.loan_no,t8.cert_no,t8.channel_no,t8.repaid_type,t8.repay_no,t8.setl_mode,t8.trade_status,t8.gen_gl_no,t8.repaid_amount,t8.repaid_principal,t8.repaid_interest,t8.repaid_penalty,t8.bank_acct_no,t8.sys_flag,t8.payment_source,t8.should_trans_time,t8.repaid_time,t8.inserttime,t8.updatetime,t8.isactive,t8.status,t8.contract_type,t8.belong_org_id,t8.belong_org_name,t8.belong_user_id,t8.belong_user_name,t8.allot_overdue_days,t8.repaid_overdue_days,t8.start_entrust_date,t8.entrust_overdue_amount,t8.in_repay_no,t8.level1_product_name,t8.level2_product_name,t8.level3_product_name,t8.product_name,t8.sub_org_id,t8.sub_org_name,t8.overdue_amount,t8.overdue_principal,t8.remain_principal,t8.is_overdue,t8.id,t8.repaid_time,t8.belong_user_name,t8.repaid_amount,t8.repaid_interest,t8.repaid_penalty,t8.repaid_principal,t8.repaid_type,t8.repay_no,t8.in_repay_no,t8.repaid_time,t8.contract_type,t8.belong_org_id,t8.trade_status,t8.belong_user_id,t8.belong_user_name,t8.entrust_overdue_amount,t8.level1_product_name,t8.level2_product_name,t8.level3_product_name,t8.product_name,t8.start_entrust_date,t8.cert_no,t8.gen_gl_no,t8.allot_overdue_days,t8.status,t8.repaid_overdue_days,t8.setl_mode,t8.cont_no AS loanNo,t2.crm_no,t2.name
  FROM main_realtime_repayment t8 LEFT JOIN main_customer t2 ON (t2.id_no = t8.cert_no) WHERE (t8.status = '1' AND t8.contract_type = 0 AND t8.belong_org_id IN (19) AND t8.repaid_time >= '2023-06-19 00:00:00' AND t8.repaid_time <= '2023-06-19 23:59:59') ORDER BY t8.repaid_time DESC LIMIT 10\G
  该sql来自的业务地址和出现频率
  # Hosts        10.166.206.9 (923/25%), 10.166.206.10 (911/25%)... 2 more
  # Users        rw_sword
  # total        3608
  
  具体请参考附件📎
  汇总整天的slow log top10数据如下
  # Profile
  # Rank Query ID                    Response time     Calls R/Call   V/M   
  # ==== =========================== ================= ===== ======== ===== 
  #    1 0x1A2A15C1788982206078D2... 103177.2004 36.8% 64942   1.5888  0.01 SELECT auth_message
  #    2 0xFE5752BA0677A767B1183F...  42649.1529 15.2%  3579  11.9165  0.04 SELECT main_realtime_repayment main_customer
  #    3 0xBDFA945980F5F2B27F3752...  36444.4464 13.0%  3608  10.1010  0.03 SELECT main_realtime_repayment
  #    4 0x775B87BD2CDAB4B1C3DC6A...  27303.3668  9.7%   942  28.9845  0.11 SELECT main_realtime_repayment
  #    5 0xD1A286A52BCBC7EB94BFF6...  12480.9060  4.4%  8906   1.4014  0.03 SELECT re_dial_record
  #    6 0xD4EB4FF48739BF26AAFA8C...  12321.1822  4.4%  8860   1.3907  0.03 SELECT re_dial_record
  #    7 0xC3AF3301BCFD2205B08AFA...  11308.0671  4.0%  4910   2.3031  0.03 SELECT ACT_HI_COMMENT
  #    8 0x9956B2F840B051DA26CB5E...   6589.3926  2.3%   941   7.0025  0.03 SELECT main_realtime_repayment
  #    9 0xB342341333CD9AB6E55034...   2622.7300  0.9%   202  12.9838  0.07 SELECT main_repay_apply_record
  #   10 0x8D23C980D346624118A2A4...   2602.5370  0.9%  1044   2.4929  0.48 SELECT main_repay_apply_record


"""
attachment_path = "/tmp/mysql-slow.txt"


class EmailSender:
    def __init__(self, smtp_server, smtp_port, smtp_username, smtp_password):
        self.smtp_server = smtp_server
        self.smtp_port = smtp_port
        self.smtp_username = smtp_username
        self.smtp_password = smtp_password

    def send_email_with_attachment(self, sender, receiver, cc, subject, message, attachment_path):
        msg = MIMEMultipart()
        msg["From"] = sender
        msg["To"] = receiver
        msg["Subject"] = subject

        msg.attach(MIMEText(message, "plain"))

        with open(attachment_path, "rb") as attachment:
            part = MIMEBase("application", "octet-stream")
            part.set_payload(attachment.read())
            encoders.encode_base64(part)
            part.add_header("Content-Disposition", f"attachment; filename= {attachment_path}")
            msg.attach(part)

        try:
            with smtplib.SMTP(self.smtp_server, self.smtp_port) as server:
                server.starttls()
                server.login(self.smtp_username, self.smtp_password)
                recipients = [receiver] + cc.split(",")
                server.send_message(msg, sender, recipients)
                print("邮件发送成功")
        except Exception as e:
            print("邮件发送失败:", str(e))


if __name__ == "__main__":
    email_sender = EmailSender(smtp_server, smtp_port, smtp_username, smtp_password)
    email_sender.send_email_with_attachment(sender, receiver, cc, subject, message, attachment_path)
