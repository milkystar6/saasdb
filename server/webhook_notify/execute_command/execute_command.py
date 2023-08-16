import subprocess
import socket
import time
import logging


class CommandExecutor:
    def __init__(self):
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")

        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)
        console_handler.setFormatter(formatter)

        self.logger.addHandler(console_handler)

    def _set_non_blocking(self, fd):
        """
        Set the file description of the given file descriptor to non-blocking.
        """
        import fcntl, os
        flags = fcntl.fcntl(fd, fcntl.F_GETFL)
        flags = flags | os.O_NONBLOCK
        fcntl.fcntl(fd, fcntl.F_SETFL, flags)

    def _execute_command(self, command, timeout=3, block=False):
        var_list = []
        err_list = []
        try:
            if not block:
                # Non-blocking local command
                p = subprocess.Popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                     stderr=subprocess.PIPE, shell=True)

                p.wait()
                # Return value of _execute_command
                exit_code = p.returncode
                var_list = p.stdout.readlines()
                err_list = p.stderr.readlines()
            else:
                p = subprocess.Popen(command, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                     stderr=subprocess.PIPE, shell=True, bufsize=1)
                self._set_non_blocking(p.stdout)
                self._set_non_blocking(p.stderr)

                while True:
                    try:
                        time.sleep(1)
                        out_line = p.stdout.read()
                        if out_line:
                            var_list.append(out_line)
                            sys.stdout.write(out_line)

                        err_line = p.stderr.read()
                        if err_line:
                            err_list.append(err_line)
                            sys.stderr.write(err_line)

                        if p.poll() is not None:
                            break
                    except IOError:
                        continue
                exit_code = p.returncode

        except (socket.timeout, socket.error) as e:
            # Connect timeout exception or no route to host
            exit_code = 254
            err_list = ['']
            err_mesg = "%(error)s " % {'error': e}
            err_list.append(err_mesg)

        except Exception as e:
            # Exception, change backup option exception
            exit_code = 255
            err_list = ['']
            err_mesg = "%(error)s when run %(command)s " % {'error': e, 'command': command}
            err_list.append(err_mesg)

        return exit_code, var_list, err_list

    def local_execute(self, command, timeout=3, block=False):
        # self.logger.info(f"Executing command locally: {command}")
        return self._execute_command(command, timeout, block)

    def remote_execute(self, command, server, password=None, timeout=3, block=False):
        self.logger.info(f"Executing command remotely on {server['user']}@{server['ip']}:{server['port']}: {command}")
        if password:
            sshpass_command = f"sshpass -p '{password}' /usr/bin/ssh"
            command = [sshpass_command, "-o", "StrictHostKeyChecking=no", "-o", "ConnectTimeout=3",
                       "-p", f"{server['port']}", f"{server['user']}@{server['ip']}", f"{command}"]
        else:
            command = ["/usr/bin/ssh", "-o", "StrictHostKeyChecking=no", "-o", "ConnectTimeout=3",
                       "-p", f"{server['port']}", f"{server['user']}@{server['ip']}", f"{command}"]

        return self._execute_command(command, timeout, block)

