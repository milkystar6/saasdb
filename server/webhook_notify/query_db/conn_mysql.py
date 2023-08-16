#!/bin/python3
import pymysql


def close_conn(db: pymysql.Connection) -> None:
    # 关闭MySQL连接
    if db is not None:
        db.close()
        print("MySQL连接已关闭")


class conn_db:
    def __init__(self, conn_dict: {}):
        """
        获取数据库连接信息
        :param host: 数据库主机
        :param user: 数据库用户名
        :param password: 数据库密码
        :param database: 数据库名称
        :param query: 要执行的SQL查询语句
        :return: 查询结果
        """

        self.host = conn_dict.get('host')
        self.port = conn_dict.get('port')
        self.user = conn_dict.get('user')
        self.password = conn_dict.get('password')
        self.database = conn_dict.get('db')

    def conn(self) -> pymysql.Connection:
        db = pymysql.connect(host=self.host,
                             user=self.user,
                             password=self.password,
                             port=self.port,
                             database=self.database
                             )
        return db

    def execute_sql_query(self, db: pymysql.Connection, query: str):
        """
        执行SQL查询
        """
        try:
            with db.cursor() as cursor:
                cursor.execute(query)
                # 获取字段名列表
                columns = [col[0] for col in cursor.description]
                # 将查询结果转换为字典格式
                result = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return result
        except Exception as e:
            print(f"Error executing SQL query: {e}")
            return []