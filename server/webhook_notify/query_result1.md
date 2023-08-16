
# 数据库巡检报告
- 巡检时间

**2023-08-14 14:40:59.350694**

- 归属业务

**Unknown**


- 目录
[TOC]



## 一、数据库版本和配置
- MySQL版本号：
| 数据库版本 |
| --- |
| 8.0.30 |

- 数据库信息        
| 数据库名称 | 默认字符集 | 默认字符序列 |
| --- | --- | --- |
| mysql | utf8mb4 | utf8mb4_0900_ai_ci |
| information_schema | utf8mb3 | utf8mb3_general_ci |
| performance_schema | utf8mb4 | utf8mb4_0900_ai_ci |
| sys | utf8mb4 | utf8mb4_0900_ai_ci |
| saasdb | utf8mb4 | utf8mb4_0900_ai_ci |
| test | utf8mb4 | utf8mb4_0900_ai_ci |
| sworddb | utf8mb4 | utf8mb4_0900_ai_ci |
| test1 | utf8mb4 | utf8mb4_0900_ai_ci |   
     
        


## 二、连接和线程
- 当前连接数：

| Variable_name | Value |
| --- | --- |
| Threads_connected | 1 |
- 当前线程数：

| Variable_name | Value |
| --- | --- |
| max_connections | 151 |




## 三、用户信息

**说明: 输出用户信息**
| user | Host | Super_priv | password_expired | password_last_changed | password_lifetime | account_locked |
| --- | --- | --- | --- | --- | --- | --- |
| root | % | Y | N | 2023-07-18 01:22:17 | None | N |
| mysql.infoschema | localhost | N | N | 2023-07-18 01:22:12 | None | Y |
| mysql.session | localhost | Y | N | 2023-07-18 01:22:12 | None | Y |
| mysql.sys | localhost | N | N | 2023-07-18 01:22:12 | None | Y |
| root | localhost | Y | N | 2023-07-18 01:22:17 | None | N |


## 四、表和索引
### 表大小、行数、碎片率和存储引擎
           
| 数据库 | 表名 | 行数 | 数据大小 | 索引大小 | 未使用空间 | 总大小(GB) | 碎片率(%) | 存储引擎 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| saasdb | sys_operation_records | 368 | 1.22 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | casbin_rule | 253 | 0.05 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | exa_customers | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | exa_file_chunks | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | exa_file_upload_and_downloads | 2 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | exa_files | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | jwt_blacklists | 5 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_alert_webhook | 3 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_back_log | 34 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_back_log1 | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_backup_center | 2 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_cluster | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_db_hub | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_dir_usage | 2 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_domain | 38 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_host | 159 | 0.06 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_idc_info | 2 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_instance | 73 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_ogg_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_orch_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_project | 15 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saas_schedule_backup | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | saasdb_slow_log_query_history | 105 | 0.31 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_apis | 141 | 0.05 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_authorities | 4 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_authority_btns | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_authority_menus | 57 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_auto_code_histories | 7 | 0.05 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_auto_codes | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_base_menu_btns | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_base_menu_parameters | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_base_menus | 43 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_data_authority_id | 5 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_dictionaries | 7 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_dictionary_details | 34 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_user_authority | 6 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| saasdb | sys_users | 4 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | _main_realtime_repayment_20230214181508_del | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | _main_realtime_repayment_20230214190906_del | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | _main_realtime_repayment_20230214193807_del | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | _main_realtime_repayment_20230214200217_del | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | _main_realtime_repayment_del_2 | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | _main_repayment_20230227180242_del | 0 | 0.02 MB | 0.16 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | _pre_main_contract_del | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_appdef | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_category | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_databasechangelog | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_databasechangeloglock | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_deployment | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_deployment_resource | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_dynamic_db_data | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_dynamic_http_data | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_tenant_dynamic_data_management | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_tenant_management | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_app_term_management | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_casedef | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_databasechangelog | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_databasechangeloglock | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_deployment | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_deployment_resource | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_hi_case_inst | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_hi_mil_inst | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_hi_plan_item_inst | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_ru_case_inst | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_ru_mil_inst | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_ru_plan_item_inst | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_cmmn_ru_sentry_part_inst | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_co_content_item | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_co_databasechangelog | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_co_databasechangeloglock | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_de_databasechangelog | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_de_databasechangeloglock | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_de_model | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_de_model_history | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_de_model_relation | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_dmn_databasechangelog | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_dmn_databasechangeloglock | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_dmn_decision_table | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_dmn_deployment | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_dmn_deployment_resource | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_dmn_hi_decision_execution | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_evt_log | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_fo_databasechangelog | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_fo_databasechangeloglock | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_fo_form_definition | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_fo_form_deployment | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_fo_form_instance | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_fo_form_resource | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ge_bytearray | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ge_property | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_actinst | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_attachment | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_comment | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_detail | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_entitylink | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_identitylink | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_procinst | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_taskinst | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_tsk_log | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_hi_varinst | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_bytearray | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_group | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_info | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_membership | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_priv | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_priv_mapping | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_property | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_token | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_id_user | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_procdef_info | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_re_deployment | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_re_model | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_re_procdef | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_actinst | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_deadletter_job | 0 | 0.02 MB | 0.13 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_entitylink | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_event_subscr | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_execution | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_history_job | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_identitylink | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_job | 0 | 0.02 MB | 0.13 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_suspended_job | 0 | 0.02 MB | 0.13 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | act_ru_task | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_org | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_resource | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_role | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_role_resource | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_url_resource | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_user | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_user_data_permission | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | auth_user_role | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | batch_allot_record | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | batch_charge_record | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | batch_entry_file_record | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | batch_reduction_file | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_app_config | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_copy_task | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_approve_group_manage | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_approve_group_relation | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_business_category | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_cmdb_application | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_cmdb_business | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_flow_entrust_info | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_limit | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_matrix_detail_info | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_matrix_info | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_organization_info | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_role_limit | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_roles | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_user_role | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_idm_users | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_matrix_relation_fields_info | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_timing_task | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | bpm_urge_task | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | cfg_operation_log | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | commission_case_rule | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | commission_case_rule_base_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | commission_case_rule_base_info_cache | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | commission_case_rule_cache | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | company_stop_call_record | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | config_org_suffix | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | config_product | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | config_project | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | config_ykphone | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | cont_file_mapping | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | cust_image_ocr_info | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | cust_sms_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | dial_prefix_org_rel | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | dict_extend | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | dt_record_info1228 | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | entry_batch_query_record | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | exception_monitor_contract | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | file_upload_order_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | flow_config | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | flow_object | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | flow_task | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_01 | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_02 | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_03 | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_04 | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_05 | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_07 | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_08 | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_contact_01 | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_contact_02 | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_id_01 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_id_02 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_id_03 | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_id_04 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_id_05 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_id_07 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | haier_test_id_08 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | his_origin_loan | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | image_contract_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | image_user_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | jobtws | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_bankcard | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_case | 0 | 0.02 MB | 0.14 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_case_track | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_complaint_order | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_complaint_order_detail | 0 | 0.02 MB | 0.17 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_complaint_order_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_contact | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_contact_230718_back | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_customer | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_customer_err | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_customer_tag | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_entry_apply_record | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_lawsuit | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_loan | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_monitor_case_contract | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_monitor_case_product | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_monitor_import_contract | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_monitor_import_contract_record | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_pl_case_link | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_re_case_link | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_realtime_repayment | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_repay_apply_record | 0 | 0.02 MB | 0.16 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_repayment | 0 | 0.02 MB | 0.17 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_repayment_0817 | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_stop_regain_rule | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_tag_record | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | main_task_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | old_0823 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_ai_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_bankcard | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_case | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_case_230228 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_contact | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_customer | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_customer_230228 | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_customer_230627_back | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_image_contract_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_image_user_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_lawsuit_fee_info | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_loan | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_loan_backup_0214 | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_loan_backup_0920 | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_pre_case | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_pre_contract | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_pre_contract_backup_0214 | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_product | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | origin_repay | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | oss_file_upload_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_back_record | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_blaze_entrust_result | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_bot | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_bot_error_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_bot_export_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_bot_record | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_case_info | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_case_lock | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_complain_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_cust_stop_regain | 0 | 0.02 MB | 0.14 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_end_record | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_entrust_record | 0 | 0.02 MB | 0.13 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_extend_record | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_intelligent_strategy | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_intelligent_strategy_record | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_intelligent_strategy_record_detail | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_intelligent_strategy_sms | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_rule | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_rule_config | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_stop_call_record | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_stop_regain_record | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_strategy | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_strategy_log | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pl_task_accept_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_allot_record | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_case_record | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_main_case | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_main_contract | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_prediction_call_batch | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_prediction_call_status_notify | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_prediction_list_info | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_prediction_regain_user | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_re_dial_record | 0 | 0.02 MB | 0.13 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_re_record | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_repayment_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_revoke_record | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | pre_skill_group | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | push_task_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_ai_record | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_alipay_remind_loan | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_allot_error_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_call_missed_phone | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_derate_apply_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_derate_apply_record_detail | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_dial_record | 0 | 0.02 MB | 0.16 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_file_upload_appeal_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_file_upload_record | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_file_upload_repay_batch_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_lawsuit_fee_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_lawsuit_fee_trans_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_lawsuit_fee_trans_record_detail | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_lawsuit_repay_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_lawsuit_repay_trans_info | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_dial_record | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_recold_record_csv | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_record | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_record_20220917 | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_record_tmp | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_record_tmp_20221009 | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_record_tmp_20230103 | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_old_record_tmp_20230213 | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_org_contact | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_prediction_call_batch | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_prediction_call_status_notify | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_prediction_list_info | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_prediction_regain_user | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_record_tag | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_reduction_config | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_scheduling_info | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_scheduling_plan | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_skill_group | 0 | 0.02 MB | 0.06 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_sms_send_log | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_wx_remind_loan | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_wxgh_remind_loan | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | re_yunke_call_phone_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | report_capacity | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | report_case_count | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | report_case_count_record | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | report_regain_record_cover | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sms_batch_config | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | strategy_audit | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_aging_configure | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_business_configure | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_export_log | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_extension_number | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_notice | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_operation_log | 0 | 0.02 MB | 0.05 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_outbound_configure | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_reason_configure | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_sms_template_configure | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_state_configure | 0 | 0.02 MB | 0.08 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | sys_status_mapping | 0 | 0.02 MB | 0.09 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_b_re_old_record_0216 | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_b_xincuishou_tingcui | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_complain | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_crmno_cont | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_dt_record_info | 0 | 0.02 MB | 0.11 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_ks_customer | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_loan | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_main_loan_230621 | 0 | 0.02 MB | 0.03 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_old_dertor | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_re_old_record | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_re_skill_group1008 | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_repay_fee | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_repay_fees | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_seq | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_smart_batch_case | 0 | 0.02 MB | 0.02 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | tmp_stop_call_mobile | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | user_upload_audio_video | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | yk_sync_error | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| sworddb | yk_wechat_add_record | 0 | 0.02 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | InnoDB |
| test1 | t1 | 0 | 0.00 MB | 0.00 MB | 0.00 MB | 0.00 | 0.00 | MyISAM |



### 非innodb引擎表


**说明: mysql只有innodb引擎才能实现事务，除特殊需求，默认使用innodb引擎。**

| 数据库 | 表名 | 存储引擎 |
| --- | --- | --- |
| test1 | t1 | MyISAM |



### 重复索引
**说明: mysql索引需要维护额外的B+树，索引可以提升数据检索效率，但频繁的更新也会给数据库带来更多的维护索引的压力，非必要不要建立太多索引和清理重复索引**
**当前数据库中存在的重复索引信息如下，输出结果由[pt-duplicate-key-checker](https://docs.percona.com/percona-toolkit/pt-duplicate-key-checker.html)工具生成**
详细信息如下:

```

```


        
### 无主键表

**说明: 无主键表会造成性能问题，延迟问题**

| 数据库名称 | 表名称 |
| --- | --- |
| saasdb | sys_authority_btns |
| sworddb | act_app_databasechangelog |
| sworddb | act_cmmn_databasechangelog |
| sworddb | act_co_databasechangelog |
| sworddb | act_de_databasechangelog |
| sworddb | act_dmn_databasechangelog |
| sworddb | act_fo_databasechangelog |
| sworddb | dt_record_info1228 |
| sworddb | jobtws |
| sworddb | old_0823 |
| sworddb | re_old_record_tmp |
| sworddb | re_old_record_tmp_20221009 |
| sworddb | re_old_record_tmp_20230103 |
| sworddb | re_old_record_tmp_20230213 |
| sworddb | tmp_b_xincuishou_tingcui |
| sworddb | tmp_ks_customer |
| sworddb | tmp_smart_batch_case |

        

## 五、MySQL Summary
- 数据库信息汇总
```

```
        



 ## 六、复制信息统计
        


- 复制参数
| Variable_name | Value |
| --- | --- |
| log_slave_updates | ON |

| Variable_name | Value |
| --- | --- |
| sync_binlog | 1 |


- 并行复制信息
| Variable_name | Value |
| --- | --- |
| slave_parallel_type | LOGICAL_CLOCK |
| slave_parallel_workers | 4 |

- 半同步复制信息
**未开启半同步复制模式**

