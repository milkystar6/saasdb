#!/bin/python3
"""
author: milkystar
function: 用于实现mysql数据库的巡检任务，生成巡检报告，并发送邮件给对应的组
"""

from query_db.xunjian_tables import xunjian_mysql


def xunjian():
    db_config = {
        'host': '127.0.0.1',
        'user': 'root',
        'password': 'letsg0',
        'port': 3307,
        'database': 'information_schema'
    }

    testfile = 'query_result1.md'
    a = xunjian_mysql(db_config)
    a.xunjian_begin(testfile)
    a.connections_and_thread(testfile)
    a.get_user_info(testfile)
    a.get_table_info(testfile)
    a.get_table_engine_not_innodb(testfile)
    a.get_duplicate_index(testfile)
    a.get_no_pk_table(testfile)
    a.get_mysql_summary(testfile)
    ## 复制信息
    a.get_repl_summary(testfile)


    a.close_conn()

    # todo 数据量变化曲线图


if __name__ == "__main__":
    print("hello, world")
    xunjian()
