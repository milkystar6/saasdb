import time
import logging

class MessageSuppressor:
    def __init__(self, suppress_duration=10, suppress_only=False, suppress_msg=None):
        self.groups = {}  # 字典用于存储消息分组的时间戳
        self.suppress_duration = suppress_duration
        self.suppress_only = suppress_only
        self.suppress_msg = suppress_msg

    def set_group_key(self, message, group_key):
        # 用户自定义分组规则，设置分组键
        self.groups[group_key] = time.time()

    def process_message(self, message):
        group_key = self.get_group_key(message)
        current_time = time.time()
        last_time = self.groups.get(group_key, 0)


        if current_time - last_time > self.suppress_duration:
            # 没有触发抑制，输出消息并更新分组时间戳
            print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] {message}")
            self.groups[group_key] = current_time
        else:
            # 触发了抑制，根据 suppress_only 开关选择是否打印到日志
            if self.suppress_only:
                logging.warning(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] {self.suppress_msg}: {message}")
            else:
                print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] {self.suppress_msg}: {message}")

    def get_group_key(self, message):
        # 默认分组规则：以 message_topic, ins_ip, ins_port 为例
        return f"{message.get('message_topic', '')}-{message.get('ins_ip', '')}-{message.get('ins_port', '')}"

# 测试代码
if __name__ == "__main__":

    text={'message_topic': 'ogg_db_binlog_dump', 'ins_ip': '127.0.0.1', 'ins_port': '3307', 'info': '数据库存在较多Binlog Dump状态会话，counts:0'}
    while True:
        suppress_msg = "Message suppressed for 10 seconds"  # 定义推送消息抑制时间描述
        suppressor = MessageSuppressor(suppress_duration=10, suppress_only=True, suppress_msg=suppress_msg)

        # 测试消息1
        message1 = text
        suppressor.process_message(message1)

        # 设置分组规则并发送消息2
        group_key = "custom_group_key"  # 你可以根据需要设置分组规则
        suppressor.set_group_key(message1, group_key)
        suppressor.process_message(message1)

        # 测试消息3
        message3 = text
        suppressor.process_message(message3)

        # 设置分组规则并发送消息4
        group_key = "custom_group_key2"  # 你可以根据需要设置分组规则
        suppressor.set_group_key(message3, group_key)
        suppressor.process_message(message3)
        time.sleep(2)

