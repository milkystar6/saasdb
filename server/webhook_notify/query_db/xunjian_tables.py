# 数据库连接信息
import datetime

from generate_md.generate_md_tables import generate_md_table
from query_db.conn_mysql import conn_db
from query_db.define_query import sql_get_tables_info, sql_get_tables_not_innodb, sql_get_schema, sql_get_no_pk_table, \
    sql_get_user_info
from pt_tools.use_pt import PerconaToolkit


def get_project(saasdb: dict, db_config: dict) -> str:
    """
    从saasdb数据库查询出归属业务信息
    :return:
    """
    ## todo 补充
    return "Unknown"


class xunjian_mysql:
    """
    xunjian_begin:
    巡检文件标题
    """

    def __init__(self, db_config):
        self.db_config = db_config
        self.conn_db = conn_db(db_config)
        self.query_db = self.conn_db.conn()

    def init_file(self, file: str):
        md_content1 = f"""
# 数据库巡检报告
- 巡检时间

**{datetime.datetime.today()}**

- 归属业务

**{get_project({}, {})}**


- 目录
[TOC]

"""
        with open(file, 'w+', encoding='utf-8') as file:
            file.write(md_content1)
            file.write('\n')
            file.close()

    def get_schema(self) -> str:
        """
        get_schema
        用于分析数据库schema
        :param file:
        :return:
        """

        db = self.query_db
        sql = sql_get_schema
        query_result = self.conn_db.execute_sql_query(db, sql)
        return f"""
- 数据库信息        
{generate_md_table(query_result)}   
     
        """

    def xunjian_begin(self, file: str):
        db = self.query_db

        # var = self.conn_db.execute_sql_query(db, "show variables")
        ver = self.conn_db.execute_sql_query(db, "select version() AS 数据库版本")

        self.init_file(file)
        #         md_content1 = f"""
        # ## 一、数据库版本和配置
        #
        # - MySQL版本号：
        #
        # {generate_md_table(ver)}
        #
        # {self.get_schema()}
        #
        # - 配置文件内容：
        #
        # {generate_md_table(var)}
        #
        # """

        md_content1 = f"""
## 一、数据库版本和配置
- MySQL版本号：
{generate_md_table(ver)}
{self.get_schema()}
"""
        self.write_file(file, md_content1)

    def connections_and_thread(self, file: str):
        db = self.query_db
        threads_connected = self.conn_db.execute_sql_query(db, "show global status like 'Threads_connected'")
        max_connections = self.conn_db.execute_sql_query(db, "show variables like 'max_connections'")
        mo_content1 = f"""
## 二、连接和线程
- 当前连接数：

{generate_md_table(threads_connected)}
- 当前线程数：

{generate_md_table(max_connections)}

"""
        self.write_file(file, mo_content1)

    def get_table_info(self, file: str):
        """
        get_table_info:
        用于分析数据库表的统计信息
        包含
        表大小
        索引大小
        总空间大小
        表碎片率
        存储引擎类型
        """
        db = self.query_db
        sql = sql_get_tables_info
        query_result = self.conn_db.execute_sql_query(db, sql)
        if len(query_result) > 0:
            md_content1 = f"""
## 四、表和索引
### 表大小、行数、碎片率和存储引擎
           
{generate_md_table(query_result)}
"""
            self.write_file(file, md_content1)

    def get_table_engine_not_innodb(self, file: str):
        db = self.query_db
        sql = sql_get_tables_not_innodb
        query_result = self.conn_db.execute_sql_query(db, sql)
        # print("get_table_engine_not_innodb", query_result)
        if len(query_result) > 0:
            md_content1 = f"""
\n### 非innodb引擎表\n

**说明: mysql只有innodb引擎才能实现事务，除特殊需求，默认使用innodb引擎。**

{generate_md_table(query_result)}
"""
            self.write_file(file, md_content1)

    def get_duplicate_index(self, file: str):
        p = PerconaToolkit(self.db_config)
        _, var_list, c = p.run_tool("duplicate-key-checker", '')
        res = ''
        for i in var_list:
            res = res + str(i) + '\n'
        md_content1 = f"""
\n### 重复索引
**说明: mysql索引需要维护额外的B+树，索引可以提升数据检索效率，但频繁的更新也会给数据库带来更多的维护索引的压力，非必要不要建立太多索引和清理重复索引**
**当前数据库中存在的重复索引信息如下，输出结果由[pt-duplicate-key-checker](https://docs.percona.com/percona-toolkit/pt-duplicate-key-checker.html)工具生成**
详细信息如下:

```
{res}
```
"""
        self.write_file(file, md_content1)

    def get_mysql_summary(self, file: str):
        p = PerconaToolkit(self.db_config)
        _, var_list, c = p.run_tool("mysql-summary", '')

        res = ''
        for i in var_list:
            res = res + str(i) + '\n'
        md_content = f"""
## 五、MySQL Summary
- 数据库信息汇总
```
{res}
```
        
"""
        self.write_file(file, md_content)

    def get_no_pk_table(self, file: str):
        db = self.query_db
        sql = sql_get_no_pk_table
        query_result = self.conn_db.execute_sql_query(db, sql)
        md_content1 = f"""
        \n### 无主键表\n
**说明: 无主键表会造成性能问题，延迟问题**

{generate_md_table(query_result)}

        """
        self.write_file(file, md_content1)

    def get_user_info(self, file: str):
        db = self.query_db
        sql = sql_get_user_info

        query_result = self.conn_db.execute_sql_query(db, sql)
        md_content1 = f"""
\n## 三、用户信息\n
**说明: 输出用户信息**
{generate_md_table(query_result)}
"""
        self.write_file(file, md_content1)

    def get_repl_summary(self, file: str):
        md_content1 = """
\n ## 六、复制信息统计\n        
"""
        self.write_file(file, md_content1)
        db = self.query_db
        # 复制
        sql0 = f'SHOW VARIABLES LIKE "log_slave_updates"'
        query_result0 = self.conn_db.execute_sql_query(db, sql0)
        sql1 = f'SHOW VARIABLES LIKE "sync_binlog"'
        query_result1 = self.conn_db.execute_sql_query(db, sql1)

        self.write_file(file, f"""
- 复制参数
{generate_md_table(query_result0)}

{generate_md_table(query_result1)}
""")
        # 并行复制
        sql = f'SHOW VARIABLES LIKE "slave_parallel%"'
        query_result = self.conn_db.execute_sql_query(db, sql)
        self.write_file(file, f"""
- 并行复制信息
{generate_md_table(query_result)}""")
        # 半同步复制信息
        sql_semi = f'SHOW VARIABLES LIKE "rpl_semi_sync%"'
        query_result_semi = self.conn_db.execute_sql_query(db, sql_semi)
        if len(query_result_semi) > 0:
            self.write_file(file, f"""
- 半同步复制信息
{generate_md_table(query_result_semi)}""")
        else:
            self.write_file(file, f"""
- 半同步复制信息
**未开启半同步复制模式**
""")

    def close_conn(self) -> None:
        self.query_db.close()

    def write_file(self, file: str, context: str):
        with open(file, 'a+', encoding='utf-8') as file:
            file.write(context)
            file.write('\n')
            file.close()
