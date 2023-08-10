"""
# author: milky
# create_time: 0809
# function: 实现调用pt工具集统一方法
"""


class PerconaToolkit:
    def __init__(self, mysql_info: dict):
        self.mysql_host = mysql_info.get('host')
        self.mysql_user = mysql_info.get('user')
        self.mysql_password = mysql_info.get('password')
        self.mysql_port = mysql_info.get('port')

    def run_tool(self, tool_name, args):
        command = ['pt-' + tool_name]
        command.extend(['--host', self.mysql_host, '--user', self.mysql_user,
                        '--password', self.mysql_password,
                        '--port', self.mysql_port,
                        ])
        command.extend(args)
        print(command)
