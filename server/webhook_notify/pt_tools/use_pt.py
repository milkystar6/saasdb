"""
# author: milky
# create_time: 0809
# function: 实现调用pt工具集统一方法
"""
import logging

from execute_command.execute_command import CommandExecutor


class PerconaToolkit:
    def __init__(self, mysql_info: dict):
        # self.logger = logging.getLogger(__name__)
        # self.logger.setLevel(logging.INFO)
        # formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
        # console_handler = logging.StreamHandler()
        # console_handler.setLevel(logging.INFO)
        # console_handler.setFormatter(formatter)
        # self.logger.addHandler(console_handler)

        self.mysql_host = mysql_info.get('host')
        self.mysql_user = mysql_info.get('user')
        self.mysql_password = mysql_info.get('password')
        self.mysql_port = mysql_info.get('port')

    def run_tool(self, tool_name, args):
        command = ['pt-' + tool_name]
        command.extend(['--host', self.mysql_host, '--user', self.mysql_user,
                        '--password', self.mysql_password,
                        '--port', str(self.mysql_port),
                        ])
        command.extend(args)
        local_command = ''
        for i in command:
            local_command = local_command + ' ' + i
        executor = CommandExecutor()
        # self.logger.info(f"Executing command locally: {local_command}")
        exit_code, var_list, err_list = executor.local_execute(local_command)
        return exit_code, var_list, err_list
