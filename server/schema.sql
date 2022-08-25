-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: saasdb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Current Database: `saasdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS */ `saasdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `saasdb`;

--
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casbin_rule`
(
    `id`    bigint unsigned NOT NULL AUTO_INCREMENT,
    `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `v0`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `v1`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `v2`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `v3`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `v4`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `v5`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `v6`    varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL,
    `v7`    varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_casbin_rule` (`ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`, `v6`, `v7`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1412
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule`
    DISABLE KEYS */;
INSERT INTO `casbin_rule`
VALUES (1244, 'p', '888', '/api/createApi', 'POST', '', '', '', '', ''),
       (1245, 'p', '888', '/api/deleteApi', 'POST', '', '', '', '', ''),
       (1250, 'p', '888', '/api/deleteApisByIds', 'DELETE', '', '', '', '', ''),
       (1248, 'p', '888', '/api/getAllApis', 'POST', '', '', '', '', ''),
       (1249, 'p', '888', '/api/getApiById', 'POST', '', '', '', '', ''),
       (1247, 'p', '888', '/api/getApiList', 'POST', '', '', '', '', ''),
       (1246, 'p', '888', '/api/updateApi', 'POST', '', '', '', '', ''),
       (1251, 'p', '888', '/authority/copyAuthority', 'POST', '', '', '', '', ''),
       (1252, 'p', '888', '/authority/createAuthority', 'POST', '', '', '', '', ''),
       (1253, 'p', '888', '/authority/deleteAuthority', 'POST', '', '', '', '', ''),
       (1255, 'p', '888', '/authority/getAuthorityList', 'POST', '', '', '', '', ''),
       (1256, 'p', '888', '/authority/setDataAuthority', 'POST', '', '', '', '', ''),
       (1254, 'p', '888', '/authority/updateAuthority', 'PUT', '', '', '', '', ''),
       (1323, 'p', '888', '/authorityBtn/canRemoveAuthorityBtn', 'POST', '', '', '', '', ''),
       (1322, 'p', '888', '/authorityBtn/getAuthorityBtn', 'POST', '', '', '', '', ''),
       (1321, 'p', '888', '/authorityBtn/setAuthorityBtn', 'POST', '', '', '', '', ''),
       (1291, 'p', '888', '/autoCode/createPackage', 'POST', '', '', '', '', ''),
       (1289, 'p', '888', '/autoCode/createPlug', 'POST', '', '', '', '', ''),
       (1286, 'p', '888', '/autoCode/createTemp', 'POST', '', '', '', '', ''),
       (1293, 'p', '888', '/autoCode/delPackage', 'POST', '', '', '', '', ''),
       (1297, 'p', '888', '/autoCode/delSysHistory', 'POST', '', '', '', '', ''),
       (1288, 'p', '888', '/autoCode/getColumn', 'GET', '', '', '', '', ''),
       (1284, 'p', '888', '/autoCode/getDB', 'GET', '', '', '', '', ''),
       (1294, 'p', '888', '/autoCode/getMeta', 'POST', '', '', '', '', ''),
       (1292, 'p', '888', '/autoCode/getPackage', 'POST', '', '', '', '', ''),
       (1296, 'p', '888', '/autoCode/getSysHistory', 'POST', '', '', '', '', ''),
       (1285, 'p', '888', '/autoCode/getTables', 'GET', '', '', '', '', ''),
       (1290, 'p', '888', '/autoCode/installPlugin', 'POST', '', '', '', '', ''),
       (1287, 'p', '888', '/autoCode/preview', 'POST', '', '', '', '', ''),
       (1295, 'p', '888', '/autoCode/rollback', 'POST', '', '', '', '', ''),
       (1348, 'p', '888', '/BackupLog/createBackLog', 'POST', '', '', '', '', ''),
       (1349, 'p', '888', '/BackupLog/deleteBackLog', 'DELETE', '', '', '', '', ''),
       (1350, 'p', '888', '/BackupLog/deleteBackLogByIds', 'DELETE', '', '', '', '', ''),
       (1352, 'p', '888', '/BackupLog/findBackLog', 'GET', '', '', '', '', ''),
       (1353, 'p', '888', '/BackupLog/getBackLogList', 'GET', '', '', '', '', ''),
       (1351, 'p', '888', '/BackupLog/updateBackLog', 'PUT', '', '', '', '', ''),
       (1232, 'p', '888', '/base/login', 'POST', '', '', '', '', ''),
       (1258, 'p', '888', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '', '', ''),
       (1257, 'p', '888', '/casbin/updateCasbin', 'POST', '', '', '', '', ''),
       (1281, 'p', '888', '/customer/customer', 'DELETE', '', '', '', '', ''),
       (1282, 'p', '888', '/customer/customer', 'GET', '', '', '', '', ''),
       (1280, 'p', '888', '/customer/customer', 'POST', '', '', '', '', ''),
       (1279, 'p', '888', '/customer/customer', 'PUT', '', '', '', '', ''),
       (1283, 'p', '888', '/customer/customerList', 'GET', '', '', '', '', ''),
       (1336, 'p', '888', '/domain/createDomain', 'POST', '', '', '', '', ''),
       (1337, 'p', '888', '/domain/deleteDomain', 'DELETE', '', '', '', '', ''),
       (1338, 'p', '888', '/domain/deleteDomainByIds', 'DELETE', '', '', '', '', ''),
       (1340, 'p', '888', '/domain/findDomain', 'GET', '', '', '', '', ''),
       (1341, 'p', '888', '/domain/getDomainList', 'GET', '', '', '', '', ''),
       (1339, 'p', '888', '/domain/updateDomain', 'PUT', '', '', '', '', ''),
       (1316, 'p', '888', '/email/emailTest', 'POST', '', '', '', '', ''),
       (1320, 'p', '888', '/excel/downloadTemplate', 'GET', '', '', '', '', ''),
       (1319, 'p', '888', '/excel/exportExcel', 'POST', '', '', '', '', ''),
       (1317, 'p', '888', '/excel/importExcel', 'POST', '', '', '', '', ''),
       (1318, 'p', '888', '/excel/loadExcel', 'GET', '', '', '', '', ''),
       (1269, 'p', '888', '/fileUploadAndDownload/breakpointContinue', 'POST', '', '', '', '', ''),
       (1270, 'p', '888', '/fileUploadAndDownload/breakpointContinueFinish', 'POST', '', '', '', '', ''),
       (1273, 'p', '888', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '', '', ''),
       (1274, 'p', '888', '/fileUploadAndDownload/editFileName', 'POST', '', '', '', '', ''),
       (1268, 'p', '888', '/fileUploadAndDownload/findFile', 'GET', '', '', '', '', ''),
       (1275, 'p', '888', '/fileUploadAndDownload/getFileList', 'POST', '', '', '', '', ''),
       (1271, 'p', '888', '/fileUploadAndDownload/removeChunk', 'POST', '', '', '', '', ''),
       (1272, 'p', '888', '/fileUploadAndDownload/upload', 'POST', '', '', '', '', ''),
       (1330, 'p', '888', '/host/createHost', 'POST', '', '', '', '', ''),
       (1331, 'p', '888', '/host/deleteHost', 'DELETE', '', '', '', '', ''),
       (1332, 'p', '888', '/host/deleteHostByIds', 'DELETE', '', '', '', '', ''),
       (1334, 'p', '888', '/host/findHost', 'GET', '', '', '', '', ''),
       (1335, 'p', '888', '/host/getHostList', 'GET', '', '', '', '', ''),
       (1333, 'p', '888', '/host/updateHost', 'PUT', '', '', '', '', ''),
       (1354, 'p', '888', '/insprocesslist/showinsprocesslist', 'POST', '', '', '', '', ''),
       (1233, 'p', '888', '/jwt/jsonInBlacklist', 'POST', '', '', '', '', ''),
       (1259, 'p', '888', '/menu/addBaseMenu', 'POST', '', '', '', '', ''),
       (1267, 'p', '888', '/menu/addMenuAuthority', 'POST', '', '', '', '', ''),
       (1261, 'p', '888', '/menu/deleteBaseMenu', 'POST', '', '', '', '', ''),
       (1263, 'p', '888', '/menu/getBaseMenuById', 'POST', '', '', '', '', ''),
       (1265, 'p', '888', '/menu/getBaseMenuTree', 'POST', '', '', '', '', ''),
       (1260, 'p', '888', '/menu/getMenu', 'POST', '', '', '', '', ''),
       (1266, 'p', '888', '/menu/getMenuAuthority', 'POST', '', '', '', '', ''),
       (1264, 'p', '888', '/menu/getMenuList', 'POST', '', '', '', '', ''),
       (1262, 'p', '888', '/menu/updateBaseMenu', 'POST', '', '', '', '', ''),
       (1342, 'p', '888', '/priject/createProject', 'POST', '', '', '', '', ''),
       (1343, 'p', '888', '/priject/deleteProject', 'DELETE', '', '', '', '', ''),
       (1344, 'p', '888', '/priject/deleteProjectByIds', 'DELETE', '', '', '', '', ''),
       (1346, 'p', '888', '/priject/findProject', 'GET', '', '', '', '', ''),
       (1347, 'p', '888', '/priject/getProjectList', 'GET', '', '', '', '', ''),
       (1345, 'p', '888', '/priject/updateProject', 'PUT', '', '', '', '', ''),
       (1324, 'p', '888', '/saas_instance/createInstance', 'POST', '', '', '', '', ''),
       (1325, 'p', '888', '/saas_instance/deleteInstance', 'DELETE', '', '', '', '', ''),
       (1326, 'p', '888', '/saas_instance/deleteInstanceByIds', 'DELETE', '', '', '', '', ''),
       (1328, 'p', '888', '/saas_instance/findInstance', 'GET', '', '', '', '', ''),
       (1329, 'p', '888', '/saas_instance/getInstanceList', 'GET', '', '', '', '', ''),
       (1327, 'p', '888', '/saas_instance/updateInstance', 'PUT', '', '', '', '', ''),
       (1314, 'p', '888', '/simpleUploader/checkFileMd5', 'GET', '', '', '', '', ''),
       (1315, 'p', '888', '/simpleUploader/mergeFileMd5', 'GET', '', '', '', '', ''),
       (1313, 'p', '888', '/simpleUploader/upload', 'POST', '', '', '', '', ''),
       (1303, 'p', '888', '/sysDictionary/createSysDictionary', 'POST', '', '', '', '', ''),
       (1304, 'p', '888', '/sysDictionary/deleteSysDictionary', 'DELETE', '', '', '', '', ''),
       (1306, 'p', '888', '/sysDictionary/findSysDictionary', 'GET', '', '', '', '', ''),
       (1307, 'p', '888', '/sysDictionary/getSysDictionaryList', 'GET', '', '', '', '', ''),
       (1305, 'p', '888', '/sysDictionary/updateSysDictionary', 'PUT', '', '', '', '', ''),
       (1299, 'p', '888', '/sysDictionaryDetail/createSysDictionaryDetail', 'POST', '', '', '', '', ''),
       (1300, 'p', '888', '/sysDictionaryDetail/deleteSysDictionaryDetail', 'DELETE', '', '', '', '', ''),
       (1301, 'p', '888', '/sysDictionaryDetail/findSysDictionaryDetail', 'GET', '', '', '', '', ''),
       (1302, 'p', '888', '/sysDictionaryDetail/getSysDictionaryDetailList', 'GET', '', '', '', '', ''),
       (1298, 'p', '888', '/sysDictionaryDetail/updateSysDictionaryDetail', 'PUT', '', '', '', '', ''),
       (1308, 'p', '888', '/sysOperationRecord/createSysOperationRecord', 'POST', '', '', '', '', ''),
       (1311, 'p', '888', '/sysOperationRecord/deleteSysOperationRecord', 'DELETE', '', '', '', '', ''),
       (1312, 'p', '888', '/sysOperationRecord/deleteSysOperationRecordByIds', 'DELETE', '', '', '', '', ''),
       (1309, 'p', '888', '/sysOperationRecord/findSysOperationRecord', 'GET', '', '', '', '', ''),
       (1310, 'p', '888', '/sysOperationRecord/getSysOperationRecordList', 'GET', '', '', '', '', ''),
       (1276, 'p', '888', '/system/getServerInfo', 'POST', '', '', '', '', ''),
       (1277, 'p', '888', '/system/getSystemConfig', 'POST', '', '', '', '', ''),
       (1278, 'p', '888', '/system/setSystemConfig', 'POST', '', '', '', '', ''),
       (1235, 'p', '888', '/user/admin_register', 'POST', '', '', '', '', ''),
       (1241, 'p', '888', '/user/changePassword', 'POST', '', '', '', '', ''),
       (1234, 'p', '888', '/user/deleteUser', 'DELETE', '', '', '', '', ''),
       (1239, 'p', '888', '/user/getUserInfo', 'GET', '', '', '', '', ''),
       (1236, 'p', '888', '/user/getUserList', 'POST', '', '', '', '', ''),
       (1243, 'p', '888', '/user/resetPassword', 'POST', '', '', '', '', ''),
       (1238, 'p', '888', '/user/setSelfInfo', 'PUT', '', '', '', '', ''),
       (1240, 'p', '888', '/user/setUserAuthorities', 'POST', '', '', '', '', ''),
       (1242, 'p', '888', '/user/setUserAuthority', 'POST', '', '', '', '', ''),
       (1237, 'p', '888', '/user/setUserInfo', 'PUT', '', '', '', '', ''),
       (1405, 'p', '8881', '/BackupLog/createBackLog', 'POST', '', '', '', '', ''),
       (1406, 'p', '8881', '/BackupLog/deleteBackLog', 'DELETE', '', '', '', '', ''),
       (1407, 'p', '8881', '/BackupLog/deleteBackLogByIds', 'DELETE', '', '', '', '', ''),
       (1409, 'p', '8881', '/BackupLog/findBackLog', 'GET', '', '', '', '', ''),
       (1410, 'p', '8881', '/BackupLog/getBackLogList', 'GET', '', '', '', '', ''),
       (1408, 'p', '8881', '/BackupLog/updateBackLog', 'PUT', '', '', '', '', ''),
       (1355, 'p', '8881', '/base/login', 'POST', '', '', '', '', ''),
       (1363, 'p', '8881', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '', '', ''),
       (1362, 'p', '8881', '/casbin/updateCasbin', 'POST', '', '', '', '', ''),
       (1378, 'p', '8881', '/customer/customer', 'DELETE', '', '', '', '', ''),
       (1379, 'p', '8881', '/customer/customer', 'GET', '', '', '', '', ''),
       (1377, 'p', '8881', '/customer/customer', 'POST', '', '', '', '', ''),
       (1376, 'p', '8881', '/customer/customer', 'PUT', '', '', '', '', ''),
       (1380, 'p', '8881', '/customer/customerList', 'GET', '', '', '', '', ''),
       (1393, 'p', '8881', '/domain/createDomain', 'POST', '', '', '', '', ''),
       (1394, 'p', '8881', '/domain/deleteDomain', 'DELETE', '', '', '', '', ''),
       (1395, 'p', '8881', '/domain/deleteDomainByIds', 'DELETE', '', '', '', '', ''),
       (1397, 'p', '8881', '/domain/findDomain', 'GET', '', '', '', '', ''),
       (1398, 'p', '8881', '/domain/getDomainList', 'GET', '', '', '', '', ''),
       (1396, 'p', '8881', '/domain/updateDomain', 'PUT', '', '', '', '', ''),
       (1387, 'p', '8881', '/host/createHost', 'POST', '', '', '', '', ''),
       (1388, 'p', '8881', '/host/deleteHost', 'DELETE', '', '', '', '', ''),
       (1389, 'p', '8881', '/host/deleteHostByIds', 'DELETE', '', '', '', '', ''),
       (1391, 'p', '8881', '/host/findHost', 'GET', '', '', '', '', ''),
       (1392, 'p', '8881', '/host/getHostList', 'GET', '', '', '', '', ''),
       (1390, 'p', '8881', '/host/updateHost', 'PUT', '', '', '', '', ''),
       (1411, 'p', '8881', '/insprocesslist/showinsprocesslist', 'POST', '', '', '', '', ''),
       (1356, 'p', '8881', '/jwt/jsonInBlacklist', 'POST', '', '', '', '', ''),
       (1364, 'p', '8881', '/menu/addBaseMenu', 'POST', '', '', '', '', ''),
       (1372, 'p', '8881', '/menu/addMenuAuthority', 'POST', '', '', '', '', ''),
       (1366, 'p', '8881', '/menu/deleteBaseMenu', 'POST', '', '', '', '', ''),
       (1368, 'p', '8881', '/menu/getBaseMenuById', 'POST', '', '', '', '', ''),
       (1370, 'p', '8881', '/menu/getBaseMenuTree', 'POST', '', '', '', '', ''),
       (1365, 'p', '8881', '/menu/getMenu', 'POST', '', '', '', '', ''),
       (1371, 'p', '8881', '/menu/getMenuAuthority', 'POST', '', '', '', '', ''),
       (1369, 'p', '8881', '/menu/getMenuList', 'POST', '', '', '', '', ''),
       (1367, 'p', '8881', '/menu/updateBaseMenu', 'POST', '', '', '', '', ''),
       (1399, 'p', '8881', '/priject/createProject', 'POST', '', '', '', '', ''),
       (1400, 'p', '8881', '/priject/deleteProject', 'DELETE', '', '', '', '', ''),
       (1401, 'p', '8881', '/priject/deleteProjectByIds', 'DELETE', '', '', '', '', ''),
       (1403, 'p', '8881', '/priject/findProject', 'GET', '', '', '', '', ''),
       (1404, 'p', '8881', '/priject/getProjectList', 'GET', '', '', '', '', ''),
       (1402, 'p', '8881', '/priject/updateProject', 'PUT', '', '', '', '', ''),
       (1381, 'p', '8881', '/saas_instance/createInstance', 'POST', '', '', '', '', ''),
       (1382, 'p', '8881', '/saas_instance/deleteInstance', 'DELETE', '', '', '', '', ''),
       (1383, 'p', '8881', '/saas_instance/deleteInstanceByIds', 'DELETE', '', '', '', '', ''),
       (1385, 'p', '8881', '/saas_instance/findInstance', 'GET', '', '', '', '', ''),
       (1386, 'p', '8881', '/saas_instance/getInstanceList', 'GET', '', '', '', '', ''),
       (1384, 'p', '8881', '/saas_instance/updateInstance', 'PUT', '', '', '', '', ''),
       (1373, 'p', '8881', '/system/getServerInfo', 'POST', '', '', '', '', ''),
       (1374, 'p', '8881', '/system/getSystemConfig', 'POST', '', '', '', '', ''),
       (1375, 'p', '8881', '/system/setSystemConfig', 'POST', '', '', '', '', ''),
       (1357, 'p', '8881', '/user/admin_register', 'POST', '', '', '', '', ''),
       (1360, 'p', '8881', '/user/changePassword', 'POST', '', '', '', '', ''),
       (1359, 'p', '8881', '/user/getUserInfo', 'GET', '', '', '', '', ''),
       (1358, 'p', '8881', '/user/getUserList', 'POST', '', '', '', '', ''),
       (1361, 'p', '8881', '/user/setUserAuthority', 'POST', '', '', '', '', ''),
       (135, 'p', '9528', '/api/createApi', 'POST', '', '', '', '', ''),
       (138, 'p', '9528', '/api/deleteApi', 'POST', '', '', '', '', ''),
       (140, 'p', '9528', '/api/getAllApis', 'POST', '', '', '', '', ''),
       (137, 'p', '9528', '/api/getApiById', 'POST', '', '', '', '', ''),
       (136, 'p', '9528', '/api/getApiList', 'POST', '', '', '', '', ''),
       (139, 'p', '9528', '/api/updateApi', 'POST', '', '', '', '', ''),
       (141, 'p', '9528', '/authority/createAuthority', 'POST', '', '', '', '', ''),
       (142, 'p', '9528', '/authority/deleteAuthority', 'POST', '', '', '', '', ''),
       (143, 'p', '9528', '/authority/getAuthorityList', 'POST', '', '', '', '', ''),
       (144, 'p', '9528', '/authority/setDataAuthority', 'POST', '', '', '', '', ''),
       (171, 'p', '9528', '/autoCode/createTemp', 'POST', '', '', '', '', ''),
       (133, 'p', '9528', '/base/login', 'POST', '', '', '', '', ''),
       (162, 'p', '9528', '/casbin/getPolicyPathByAuthorityId', 'POST', '', '', '', '', ''),
       (161, 'p', '9528', '/casbin/updateCasbin', 'POST', '', '', '', '', ''),
       (169, 'p', '9528', '/customer/customer', 'DELETE', '', '', '', '', ''),
       (167, 'p', '9528', '/customer/customer', 'GET', '', '', '', '', ''),
       (168, 'p', '9528', '/customer/customer', 'POST', '', '', '', '', ''),
       (166, 'p', '9528', '/customer/customer', 'PUT', '', '', '', '', ''),
       (170, 'p', '9528', '/customer/customerList', 'GET', '', '', '', '', ''),
       (159, 'p', '9528', '/fileUploadAndDownload/deleteFile', 'POST', '', '', '', '', ''),
       (160, 'p', '9528', '/fileUploadAndDownload/editFileName', 'POST', '', '', '', '', ''),
       (158, 'p', '9528', '/fileUploadAndDownload/getFileList', 'POST', '', '', '', '', ''),
       (157, 'p', '9528', '/fileUploadAndDownload/upload', 'POST', '', '', '', '', ''),
       (163, 'p', '9528', '/jwt/jsonInBlacklist', 'POST', '', '', '', '', ''),
       (147, 'p', '9528', '/menu/addBaseMenu', 'POST', '', '', '', '', ''),
       (149, 'p', '9528', '/menu/addMenuAuthority', 'POST', '', '', '', '', ''),
       (151, 'p', '9528', '/menu/deleteBaseMenu', 'POST', '', '', '', '', ''),
       (153, 'p', '9528', '/menu/getBaseMenuById', 'POST', '', '', '', '', ''),
       (148, 'p', '9528', '/menu/getBaseMenuTree', 'POST', '', '', '', '', ''),
       (145, 'p', '9528', '/menu/getMenu', 'POST', '', '', '', '', ''),
       (150, 'p', '9528', '/menu/getMenuAuthority', 'POST', '', '', '', '', ''),
       (146, 'p', '9528', '/menu/getMenuList', 'POST', '', '', '', '', ''),
       (152, 'p', '9528', '/menu/updateBaseMenu', 'POST', '', '', '', '', ''),
       (164, 'p', '9528', '/system/getSystemConfig', 'POST', '', '', '', '', ''),
       (165, 'p', '9528', '/system/setSystemConfig', 'POST', '', '', '', '', ''),
       (134, 'p', '9528', '/user/admin_register', 'POST', '', '', '', '', ''),
       (154, 'p', '9528', '/user/changePassword', 'POST', '', '', '', '', ''),
       (172, 'p', '9528', '/user/getUserInfo', 'GET', '', '', '', '', ''),
       (155, 'p', '9528', '/user/getUserList', 'POST', '', '', '', '', ''),
       (156, 'p', '9528', '/user/setUserAuthority', 'POST', '', '', '', '', '');
/*!40000 ALTER TABLE `casbin_rule`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_customers`
--

DROP TABLE IF EXISTS `exa_customers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_customers`
(
    `id`                    bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`            datetime(3)                                                   DEFAULT NULL,
    `updated_at`            datetime(3)                                                   DEFAULT NULL,
    `deleted_at`            datetime(3)                                                   DEFAULT NULL,
    `customer_name`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名',
    `customer_phone_data`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户手机号',
    `sys_user_id`           bigint unsigned                                               DEFAULT NULL COMMENT '管理ID',
    `sys_user_authority_id` bigint unsigned                                               DEFAULT NULL COMMENT '管理角色ID',
    PRIMARY KEY (`id`),
    KEY `idx_exa_customers_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_customers`
--

LOCK TABLES `exa_customers` WRITE;
/*!40000 ALTER TABLE `exa_customers`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_customers`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_chunks`
--

DROP TABLE IF EXISTS `exa_file_chunks`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_chunks`
(
    `id`                bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`        datetime(3)                                                   DEFAULT NULL,
    `updated_at`        datetime(3)                                                   DEFAULT NULL,
    `deleted_at`        datetime(3)                                                   DEFAULT NULL,
    `exa_file_id`       bigint unsigned                                               DEFAULT NULL,
    `file_chunk_number` bigint                                                        DEFAULT NULL,
    `file_chunk_path`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_exa_file_chunks_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_chunks`
--

LOCK TABLES `exa_file_chunks` WRITE;
/*!40000 ALTER TABLE `exa_file_chunks`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_file_chunks`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_upload_and_downloads`
--

DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_upload_and_downloads`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` datetime(3)                                                   DEFAULT NULL,
    `updated_at` datetime(3)                                                   DEFAULT NULL,
    `deleted_at` datetime(3)                                                   DEFAULT NULL,
    `name`       varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
    `url`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件地址',
    `tag`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件标签',
    `key`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号',
    PRIMARY KEY (`id`),
    KEY `idx_exa_file_upload_and_downloads_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_upload_and_downloads`
--

LOCK TABLES `exa_file_upload_and_downloads` WRITE;
/*!40000 ALTER TABLE `exa_file_upload_and_downloads`
    DISABLE KEYS */;
INSERT INTO `exa_file_upload_and_downloads`
VALUES (1, '2022-08-08 21:02:22.289', '2022-08-08 21:02:22.289', NULL, '10.png',
        'https://qmplusimg.henrongyi.top/gvalogo.png', 'png', '158787308910.png'),
       (2, '2022-08-08 21:02:22.289', '2022-08-08 21:02:22.289', NULL, 'logo.png',
        'https://qmplusimg.henrongyi.top/1576554439myAvatar.png', 'png', '1587973709logo.png');
/*!40000 ALTER TABLE `exa_file_upload_and_downloads`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_files`
--

DROP TABLE IF EXISTS `exa_files`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_files`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`  datetime(3)                                                   DEFAULT NULL,
    `updated_at`  datetime(3)                                                   DEFAULT NULL,
    `deleted_at`  datetime(3)                                                   DEFAULT NULL,
    `file_name`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `file_md5`    varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `file_path`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `chunk_total` bigint                                                        DEFAULT NULL,
    `is_finish`   tinyint(1)                                                    DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_exa_files_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_files`
--

LOCK TABLES `exa_files` WRITE;
/*!40000 ALTER TABLE `exa_files`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_files`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_blacklists`
--

DROP TABLE IF EXISTS `jwt_blacklists`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_blacklists`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` datetime(3) DEFAULT NULL,
    `updated_at` datetime(3) DEFAULT NULL,
    `deleted_at` datetime(3) DEFAULT NULL,
    `jwt`        text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'jwt',
    PRIMARY KEY (`id`),
    KEY `idx_jwt_blacklists_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_blacklists`
--

LOCK TABLES `jwt_blacklists` WRITE;
/*!40000 ALTER TABLE `jwt_blacklists`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `jwt_blacklists`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_back_log`
--

DROP TABLE IF EXISTS `saas_back_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saas_back_log`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`      datetime(3)                                                                                   DEFAULT NULL,
    `updated_at`      datetime(3)                                                                                   DEFAULT NULL,
    `deleted_at`      datetime(3)                                                                                   DEFAULT NULL,
    `finished_at`     datetime                                                                                      DEFAULT NULL,
    `domain_id`       bigint                                                                                        DEFAULT NULL,
    `backup_type`     enum ('mysqldump','xtrafull','xtraincr','mydumper','redis','tidb') COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备份类型',
    `data_size`       bigint                                                                                        DEFAULT NULL,
    `status`          enum ('backup','success','failed') COLLATE utf8mb4_general_ci                                 DEFAULT NULL COMMENT '备份类型',
    `back_up_feature` json                                                                                          DEFAULT NULL,
    `back_up_uuid`    varchar(191) COLLATE utf8mb4_general_ci                                                       DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `back_up_uuid` (`back_up_uuid`),
    KEY `idx_saas_back_log_deleted_at` (`deleted_at`),
    KEY `idx_saas_back_log_domain_id` (`domain_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_back_log`
--

LOCK TABLES `saas_back_log` WRITE;
/*!40000 ALTER TABLE `saas_back_log`
    DISABLE KEYS */;
INSERT INTO `saas_back_log`
VALUES (1, '2022-08-19 13:30:45.804', '2022-08-19 13:30:45.813', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
  \"user_name\": \"\",
  \"user_password\": \"\",
  \"back_file_name\": \"\"
}', '7f66d676-acfa-4d22-abfb-ab1352defa23'),
       (2, '2022-08-19 05:31:09.015', '2022-08-19 05:31:09.015', NULL, NULL, 100, 'mysqldump', 4268528, 'backup', NULL,
        '43fffb2b-2e3f-40fe-867e-42503ccf6850'),
       (3, '2022-08-19 13:55:14.396', '2022-08-19 13:55:14.405', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"user_name\": \"\",
         \"user_password\": \"\",
         \"back_file_name\": \"\"
       }', 'e4bc08b0-9a7c-4627-b5ed-7db4806c0b8b'),
       (4, '2022-08-19 13:57:06.840', '2022-08-19 13:57:06.854', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"user_name\": \"\",
         \"user_password\": \"\",
         \"back_file_name\": \"\"
       }', 'd7330d8e-34e1-4267-a440-2aa0b435f7c5'),
       (5, '2022-08-19 05:58:26.471', '2022-08-19 05:58:26.471', NULL, NULL, 100, 'mysqldump', 4269155, 'success', '{
         \"a\": \"aaa\",
         \"user_name\": \"\",
         \"user_password\": \"\",
         \"back_file_name\": \"2022August19-55826_full.sql\"
       }', '0acc981e-e81f-45d5-a63c-1ba0bf741db9'),
       (6, '2022-08-19 14:23:28.201', '2022-08-19 14:23:28.212', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"user_name\": \"\",
         \"user_password\": \"\",
         \"back_file_name\": \"\"
       }', '864a2d33-ef77-4bc4-a2c1-e1eb05357785'),
       (7, '2022-08-19 15:00:33.761', '2022-08-19 15:00:33.771', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', 'bfea4e2e-d7f4-43c0-975c-b187cdd4020f'),
       (8, '2022-08-19 07:01:22.472', '2022-08-19 07:01:22.472', NULL, NULL, 100, 'mysqldump', 0, 'backup', '{
         \"back_file_name\": \"\"
       }', 'cda64d84-2e24-4264-bb9e-3d24a3a2cf47'),
       (9, '2022-08-19 07:03:28.970', '2022-08-19 07:03:28.970', NULL, NULL, 100, 'mysqldump', 0, 'backup', '{
         \"back_file_name\": \"\"
       }', '476db55d-3494-4972-8432-7812cfb4b716'),
       (10, '2022-08-19 07:05:32.645', '2022-08-19 07:05:32.645', NULL, NULL, 100, 'mysqldump', 0, 'backup', '{
         \"back_file_name\": \"\"
       }', '27662dcc-6c76-4317-89e0-9fe3a49080ec'),
       (11, '2022-08-19 07:06:56.688', '2022-08-19 07:06:56.688', NULL, NULL, 100, 'mysqldump', 0, 'backup', '{
         \"back_file_name\": \"\"
       }', '2f64dbab-7481-4c50-b69a-6d1e9e0498a8'),
       (12, '2022-08-19 07:12:15.605', '2022-08-19 07:12:15.605', NULL, '2022-08-19 07:12:16', 100, 'mysqldump',
        4270382, 'success', '{
         \"back_file_name\": \"2022-08-19-71215_full.sql\"
       }', 'bcb0fc5d-44bb-4d29-b690-9d7fd1457308'),
       (13, '2022-08-19 07:13:49.646', '2022-08-19 07:13:49.646', NULL, NULL, 100, 'mysqldump', 0, 'backup', '{
         \"back_file_name\": \"\"
       }', 'e331c39b-ffd8-4a8f-afac-8aaf68179e7b'),
       (14, '2022-08-19 07:17:30.798', '2022-08-19 07:17:30.798', NULL, NULL, 100, 'mysqldump', 0, 'backup', '{
         \"back_file_name\": \"\"
       }', 'fca276e3-1be1-412e-921d-68e48dc0e659'),
       (15, '2022-08-19 07:18:22.655', '2022-08-19 07:18:22.655', NULL, '2022-08-19 07:18:23', 100, 'mysqldump',
        4270922, 'success', '{
         \"back_file_name\": \"\"
       }', '80189765-af65-47d4-9c8f-e0f65991bd61'),
       (16, '2022-08-19 07:20:40.222', '2022-08-19 07:20:40.222', NULL, '2022-08-19 07:20:40', 100, 'mysqldump', 345798,
        'success', '{
         \"back_file_name\": \"2022-08-19-72040_full.sql\"
       }', '0badd7d9-a92f-4c21-8637-62fc4c63ccbe'),
       (17, '2022-08-19 07:25:03.334', '2022-08-19 07:25:03.334', NULL, '2022-08-19 07:25:03', 100, 'mysqldump', 346008,
        'success', '{
         \"back_file_name\": \"2022-08-19-7253_full.sql\"
       }', 'ceb5e637-87ac-4e33-beef-80ba82c4f9bd'),
       (18, '2022-08-19 07:27:47.354', '2022-08-19 07:27:47.354', NULL, NULL, 100, 'mysqldump', 0, 'backup', '{
         \"back_file_name\": \"\"
       }', 'fa112c61-4e14-4528-b40c-b9b0cbaee465'),
       (19, '2022-08-19 07:29:55.005', '2022-08-19 07:29:55.005', NULL, '2022-08-19 07:29:55', 100, 'mysqldump', 346379,
        'success', '{
         \"backup_cmd\": \"mysqldump -h 127.0.0.1 -u root -pletsg0 -P 3306 --set-gtid-purged=off --databases saasdb > 2022-08-19-72955_full.sql\",
         \"back_file_name\": \"2022-08-19-72955_full.sql\"
       }', '533bdff7-fb88-4b70-a216-f76bdd84096c'),
       (20, '2022-08-19 15:57:56.688', '2022-08-19 15:57:56.698', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', 'eedd0bc7-b4bc-47d7-bcaf-0cfe53700674'),
       (21, '2022-08-19 15:58:04.194', '2022-08-19 15:58:04.203', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', '58171d46-655f-4d1b-98b2-3e372175332e'),
       (22, '2022-08-19 16:05:29.221', '2022-08-19 16:05:29.229', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', '6e3e58ff-50fe-48e5-b14e-62c3a4506369'),
       (23, '2022-08-19 16:10:30.418', '2022-08-19 16:10:30.427', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', 'a2f39fdb-b1f7-4bb5-8c8d-60f0cf7be873'),
       (24, '2022-08-19 16:10:33.419', '2022-08-19 16:10:33.427', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', '4378e43e-c354-4e61-b40d-a2b866d29994'),
       (25, '2022-08-19 16:10:40.866', '2022-08-19 16:10:40.876', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', 'a21ed4bd-648d-4283-bb0d-283f65770107'),
       (26, '2022-08-19 16:10:44.186', '2022-08-19 16:10:44.194', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', 'a9244714-e1b9-41c5-9c3c-e66e621ef05e'),
       (27, '2022-08-19 16:10:46.322', '2022-08-19 16:10:46.331', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', '9d92a580-ea87-499f-be19-f38ea1274ede'),
       (28, '2022-08-19 16:10:48.140', '2022-08-19 16:10:48.154', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', '053e1e79-2f68-4dda-b972-bd4e11d4c7dd'),
       (29, '2022-08-19 16:15:22.578', '2022-08-19 16:15:22.588', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"back_file_name\": \"\"
       }', '4de67ad8-65f1-4808-83d0-384ff8df0e18'),
       (30, '2022-08-19 16:18:41.243', '2022-08-19 16:18:41.253', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"extra\": \"\"
       }', '3be518e6-1084-47ed-8f4b-939b6a1f6173'),
       (31, '2022-08-23 19:44:31.588', '2022-08-23 19:44:31.603', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"extra\": \"\"
       }', 'cb324bd0-ca97-4a1e-b4a4-66f1fc417648'),
       (32, '2022-08-23 21:00:39.467', '2022-08-23 21:00:39.476', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"extra\": \"\"
       }', '93c6c69e-be91-40fb-b891-f512f321daa8'),
       (33, '2022-08-24 11:10:30.128', '2022-08-24 11:10:30.137', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"extra\": \"\"
       }', '956bdad0-0712-4217-8106-5afb8ee76c28'),
       (34, '2022-08-24 11:17:06.226', '2022-08-24 11:17:06.237', NULL, NULL, 100, 'mysqldump', 0, 'failed', '{
         \"extra\": \"\"
       }', '0648431d-0efa-4354-8e58-fdc2f47d0243');
/*!40000 ALTER TABLE `saas_back_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_domain`
--

DROP TABLE IF EXISTS `saas_domain`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saas_domain`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`  datetime(3)                                                   DEFAULT NULL,
    `updated_at`  datetime(3)                                                   DEFAULT NULL,
    `deleted_at`  datetime(3)                                                   DEFAULT NULL,
    `domain_id`   bigint                                                        DEFAULT NULL,
    `domain_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `proj_id`     bigint                                                        DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `domain_id` (`domain_id`),
    KEY `idx_saas_domain_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 103
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_domain`
--

LOCK TABLES `saas_domain` WRITE;
/*!40000 ALTER TABLE `saas_domain`
    DISABLE KEYS */;
INSERT INTO `saas_domain`
VALUES (100, '2022-08-12 16:13:45.427', '2022-08-12 16:13:45.427', NULL, NULL, 'test', 100),
       (101, '2022-08-12 17:29:31.456', '2022-08-12 17:29:31.456', NULL, 1, 'fortest1', 101),
       (102, '2022-08-12 17:29:31.456', '2022-08-12 17:29:31.456', NULL, 2, 'fortest2', 101);
/*!40000 ALTER TABLE `saas_domain`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_host`
--

DROP TABLE IF EXISTS `saas_host`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saas_host`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` datetime(3)                                                   DEFAULT NULL,
    `updated_at` datetime(3)                                                   DEFAULT NULL,
    `deleted_at` datetime(3)                                                   DEFAULT NULL,
    `host_id`    bigint                                                        DEFAULT NULL,
    `hostname`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `ip`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `cpu`        smallint                                                      DEFAULT NULL,
    `memory`     bigint                                                        DEFAULT NULL,
    `disksize`   bigint                                                        DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `host_id` (`host_id`),
    KEY `idx_saas_host_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_host`
--

LOCK TABLES `saas_host` WRITE;
/*!40000 ALTER TABLE `saas_host`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_host`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_instance`
--

DROP TABLE IF EXISTS `saas_instance`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saas_instance`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`  datetime(3)                                                                                                                     DEFAULT NULL,
    `updated_at`  datetime(3)                                                                                                                     DEFAULT NULL,
    `deleted_at`  datetime(3)                                                                                                                     DEFAULT NULL,
    `ins_id`      bigint                                                                                                                          DEFAULT NULL COMMENT 'insId',
    `host_id`     bigint                                                                                                                          DEFAULT NULL COMMENT 'hostId',
    `proj_id`     bigint                                                                                                                          DEFAULT NULL COMMENT '项目id',
    `domain_id`   bigint                                                                                                                          DEFAULT NULL,
    `ip`          varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci                                                                   DEFAULT NULL COMMENT 'ip',
    `port`        bigint                                                                                                                          DEFAULT NULL COMMENT 'port',
    `application` enum ('oracle','mysql','redis','mongodb','tidb') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci                               DEFAULT NULL COMMENT 'application应用类型',
    `version`     varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci                                                                   DEFAULT NULL,
    `use_type`    enum ('正式','线上测试','预发布') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci                                                       DEFAULT NULL,
    `health`      enum ('available','unavailable','restarting','starting','stoping','migrating') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `level`       enum ('1','2','3','4') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci                                                         DEFAULT NULL,
    `feature`     json                                                                                                                            DEFAULT NULL,
    `auth`        json                                                                                                                            DEFAULT NULL,
    `role`        enum ('master','slaveforha','slaveonly') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci                                       DEFAULT NULL COMMENT '数据库实例在集群中的角色，master节点只能有一个',
    PRIMARY KEY (`id`),
    UNIQUE KEY `ins_id` (`ins_id`),
    KEY `idx_saas_instance_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_instance`
--

LOCK TABLES `saas_instance` WRITE;
/*!40000 ALTER TABLE `saas_instance`
    DISABLE KEYS */;
INSERT INTO `saas_instance`
VALUES (1, '2022-08-25 19:59:20.823', '2022-08-25 19:59:20.823', NULL, NULL, NULL, 1000, NULL, '127.0.0.1', 3307,
        'mysql', '8.0.30', '正式', 'available', '1', NULL, NULL, 'master');
/*!40000 ALTER TABLE `saas_instance`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saas_project`
--

DROP TABLE IF EXISTS `saas_project`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saas_project`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`     datetime(3)                                                   DEFAULT NULL,
    `updated_at`     datetime(3)                                                   DEFAULT NULL,
    `deleted_at`     datetime(3)                                                   DEFAULT NULL,
    `proj_id`        bigint                                                        DEFAULT NULL COMMENT '项目代号',
    `proj_name`      varchar(191) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '项目名称',
    `notify_users`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '项目操作通知的用户列表，如无设置则仅通知给操作人',
    `alarm_group_id` bigint                                                        DEFAULT NULL COMMENT '关联AlarmGroup表',
    PRIMARY KEY (`id`),
    UNIQUE KEY `proj_id` (`proj_id`),
    UNIQUE KEY `proj_name` (`proj_name`),
    KEY `idx_saas_project_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 102
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saas_project`
--

LOCK TABLES `saas_project` WRITE;
/*!40000 ALTER TABLE `saas_project`
    DISABLE KEYS */;
INSERT INTO `saas_project`
VALUES (100, '2022-08-12 16:13:36.181', '2022-08-12 16:13:36.181', NULL, NULL, '100', '', 0),
       (101, '2022-08-12 17:29:31.444', '2022-08-12 17:29:31.444', NULL, NULL, 'test', '', 0);
/*!40000 ALTER TABLE `saas_project`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_apis`
--

DROP TABLE IF EXISTS `sys_apis`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_apis`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`  datetime(3)                                                   DEFAULT NULL,
    `updated_at`  datetime(3)                                                   DEFAULT NULL,
    `deleted_at`  datetime(3)                                                   DEFAULT NULL,
    `path`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api路径',
    `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api中文描述',
    `api_group`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api组',
    `method`      varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'POST' COMMENT '方法',
    PRIMARY KEY (`id`),
    KEY `idx_sys_apis_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 125
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_apis`
--

LOCK TABLES `sys_apis` WRITE;
/*!40000 ALTER TABLE `sys_apis`
    DISABLE KEYS */;
INSERT INTO `sys_apis`
VALUES (1, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/base/login', '用户登录(必选)', 'base', 'POST'),
       (2, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/jwt/jsonInBlacklist', 'jwt加入黑名单(退出，必选)', 'jwt',
        'POST'),
       (3, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/deleteUser', '删除用户', '系统用户', 'DELETE'),
       (4, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/admin_register', '用户注册', '系统用户', 'POST'),
       (5, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/getUserList', '获取用户列表', '系统用户', 'POST'),
       (6, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/setUserInfo', '设置用户信息', '系统用户', 'PUT'),
       (7, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/setSelfInfo', '设置自身信息(必选)', '系统用户',
        'PUT'),
       (8, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/getUserInfo', '获取自身信息(必选)', '系统用户',
        'GET'),
       (9, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/setUserAuthorities', '设置权限组', '系统用户',
        'POST'),
       (10, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/changePassword', '修改密码（建议选择)', '系统用户',
        'POST'),
       (11, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/setUserAuthority', '修改用户角色(必选)', '系统用户',
        'POST'),
       (12, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/user/resetPassword', '重置用户密码', '系统用户',
        'POST'),
       (13, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/api/createApi', '创建api', 'api', 'POST'),
       (14, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/api/deleteApi', '删除Api', 'api', 'POST'),
       (15, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/api/updateApi', '更新Api', 'api', 'POST'),
       (16, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/api/getApiList', '获取api列表', 'api', 'POST'),
       (17, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/api/getAllApis', '获取所有api', 'api', 'POST'),
       (18, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/api/getApiById', '获取api详细信息', 'api', 'POST'),
       (19, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/api/deleteApisByIds', '批量删除api', 'api',
        'DELETE'),
       (20, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authority/copyAuthority', '拷贝角色', '角色',
        'POST'),
       (21, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authority/createAuthority', '创建角色', '角色',
        'POST'),
       (22, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authority/deleteAuthority', '删除角色', '角色',
        'POST'),
       (23, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authority/updateAuthority', '更新角色信息', '角色',
        'PUT'),
       (24, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authority/getAuthorityList', '获取角色列表', '角色',
        'POST'),
       (25, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authority/setDataAuthority', '设置角色资源权限', '角色',
        'POST'),
       (26, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/casbin/updateCasbin', '更改角色api权限', 'casbin',
        'POST'),
       (27, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/casbin/getPolicyPathByAuthorityId', '获取权限列表',
        'casbin', 'POST'),
       (28, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/addBaseMenu', '新增菜单', '菜单', 'POST'),
       (29, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/getMenu', '获取菜单树(必选)', '菜单', 'POST'),
       (30, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/deleteBaseMenu', '删除菜单', '菜单', 'POST'),
       (31, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/updateBaseMenu', '更新菜单', '菜单', 'POST'),
       (32, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/getBaseMenuById', '根据id获取菜单', '菜单',
        'POST'),
       (33, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/getMenuList', '分页获取基础menu列表', '菜单',
        'POST'),
       (34, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/getBaseMenuTree', '获取用户动态路由', '菜单',
        'POST'),
       (35, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/getMenuAuthority', '获取指定角色menu', '菜单',
        'POST'),
       (36, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/menu/addMenuAuthority', '增加menu和角色关联关系', '菜单',
        'POST'),
       (37, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/fileUploadAndDownload/findFile', '寻找目标文件（秒传）',
        '分片上传', 'GET'),
       (38, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/fileUploadAndDownload/breakpointContinue',
        '断点续传', '分片上传', 'POST'),
       (39, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL,
        '/fileUploadAndDownload/breakpointContinueFinish', '断点续传完成', '分片上传', 'POST'),
       (40, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/fileUploadAndDownload/removeChunk',
        '上传完成移除文件', '分片上传', 'POST'),
       (41, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/fileUploadAndDownload/upload', '文件上传示例',
        '文件上传与下载', 'POST'),
       (42, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/fileUploadAndDownload/deleteFile', '删除文件',
        '文件上传与下载', 'POST'),
       (43, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/fileUploadAndDownload/editFileName',
        '文件名或者备注编辑', '文件上传与下载', 'POST'),
       (44, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/fileUploadAndDownload/getFileList',
        '获取上传文件列表', '文件上传与下载', 'POST'),
       (45, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/system/getServerInfo', '获取服务器信息', '系统服务',
        'POST'),
       (46, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/system/getSystemConfig', '获取配置文件内容', '系统服务',
        'POST'),
       (47, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/system/setSystemConfig', '设置配置文件内容', '系统服务',
        'POST'),
       (48, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/customer/customer', '更新客户', '客户', 'PUT'),
       (49, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/customer/customer', '创建客户', '客户', 'POST'),
       (50, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/customer/customer', '删除客户', '客户', 'DELETE'),
       (51, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/customer/customer', '获取单一客户', '客户', 'GET'),
       (52, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/customer/customerList', '获取客户列表', '客户',
        'GET'),
       (53, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/getDB', '获取所有数据库', '代码生成器', 'GET'),
       (54, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/getTables', '获取数据库表', '代码生成器',
        'GET'),
       (55, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/createTemp', '自动化代码', '代码生成器',
        'POST'),
       (56, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/preview', '预览自动化代码', '代码生成器',
        'POST'),
       (57, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/getColumn', '获取所选table的所有字段',
        '代码生成器', 'GET'),
       (58, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/createPlug', '自动创建插件包', '代码生成器',
        'POST'),
       (59, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/installPlugin', '安装插件', '代码生成器',
        'POST'),
       (60, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/createPackage', '生成包(package)',
        '包（pkg）生成器', 'POST'),
       (61, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/getPackage', '获取所有包(package)',
        '包（pkg）生成器', 'POST'),
       (62, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/delPackage', '删除包(package)',
        '包（pkg）生成器', 'POST'),
       (63, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/getMeta', '获取meta信息', '代码生成器历史',
        'POST'),
       (64, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/rollback', '回滚自动生成代码', '代码生成器历史',
        'POST'),
       (65, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/getSysHistory', '查询回滚记录', '代码生成器历史',
        'POST'),
       (66, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/autoCode/delSysHistory', '删除回滚记录', '代码生成器历史',
        'POST'),
       (67, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL,
        '/sysDictionaryDetail/updateSysDictionaryDetail', '更新字典内容', '系统字典详情', 'PUT'),
       (68, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL,
        '/sysDictionaryDetail/createSysDictionaryDetail', '新增字典内容', '系统字典详情', 'POST'),
       (69, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL,
        '/sysDictionaryDetail/deleteSysDictionaryDetail', '删除字典内容', '系统字典详情', 'DELETE'),
       (70, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysDictionaryDetail/findSysDictionaryDetail',
        '根据ID获取字典内容', '系统字典详情', 'GET'),
       (71, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL,
        '/sysDictionaryDetail/getSysDictionaryDetailList', '获取字典内容列表', '系统字典详情', 'GET'),
       (72, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysDictionary/createSysDictionary', '新增字典',
        '系统字典', 'POST'),
       (73, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysDictionary/deleteSysDictionary', '删除字典',
        '系统字典', 'DELETE'),
       (74, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysDictionary/updateSysDictionary', '更新字典',
        '系统字典', 'PUT'),
       (75, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysDictionary/findSysDictionary', '根据ID获取字典',
        '系统字典', 'GET'),
       (76, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysDictionary/getSysDictionaryList', '获取字典列表',
        '系统字典', 'GET'),
       (77, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysOperationRecord/createSysOperationRecord',
        '新增操作记录', '操作记录', 'POST'),
       (78, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysOperationRecord/findSysOperationRecord',
        '根据ID获取操作记录', '操作记录', 'GET'),
       (79, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysOperationRecord/getSysOperationRecordList',
        '获取操作记录列表', '操作记录', 'GET'),
       (80, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/sysOperationRecord/deleteSysOperationRecord',
        '删除操作记录', '操作记录', 'DELETE'),
       (81, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL,
        '/sysOperationRecord/deleteSysOperationRecordByIds', '批量删除操作历史', '操作记录', 'DELETE'),
       (82, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/simpleUploader/upload', '插件版分片上传',
        '断点续传(插件版)', 'POST'),
       (83, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/simpleUploader/checkFileMd5', '文件完整度验证',
        '断点续传(插件版)', 'GET'),
       (84, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/simpleUploader/mergeFileMd5', '上传完成合并文件',
        '断点续传(插件版)', 'GET'),
       (85, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/email/emailTest', '发送测试邮件', 'email', 'POST'),
       (86, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/email/emailSend', '发送邮件示例', 'email', 'POST'),
       (87, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/excel/importExcel', '导入excel', 'excel',
        'POST'),
       (88, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/excel/loadExcel', '下载excel', 'excel', 'GET'),
       (89, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/excel/exportExcel', '导出excel', 'excel',
        'POST'),
       (90, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/excel/downloadTemplate', '下载excel模板', 'excel',
        'GET'),
       (91, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authorityBtn/setAuthorityBtn', '设置按钮权限',
        '按钮权限', 'POST'),
       (92, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authorityBtn/getAuthorityBtn', '获取已有按钮权限',
        '按钮权限', 'POST'),
       (93, '2022-08-08 21:02:21.929', '2022-08-08 21:02:21.929', NULL, '/authorityBtn/canRemoveAuthorityBtn', '删除按钮',
        '按钮权限', 'POST'),
       (94, '2022-08-08 21:09:55.350', '2022-08-08 21:09:55.350', NULL, '/saas_instance/createInstance', '新增instance表',
        'saas_instance', 'POST'),
       (95, '2022-08-08 21:09:55.354', '2022-08-08 21:09:55.354', NULL, '/saas_instance/deleteInstance', '删除instance表',
        'saas_instance', 'DELETE'),
       (96, '2022-08-08 21:09:55.359', '2022-08-08 21:09:55.359', NULL, '/saas_instance/deleteInstanceByIds',
        '批量删除instance表', 'saas_instance', 'DELETE'),
       (97, '2022-08-08 21:09:55.365', '2022-08-08 21:09:55.365', NULL, '/saas_instance/updateInstance', '更新instance表',
        'saas_instance', 'PUT'),
       (98, '2022-08-08 21:09:55.371', '2022-08-08 21:09:55.371', NULL, '/saas_instance/findInstance',
        '根据ID获取instance表', 'saas_instance', 'GET'),
       (99, '2022-08-08 21:09:55.378', '2022-08-08 21:09:55.378', NULL, '/saas_instance/getInstanceList',
        '获取instance表列表', 'saas_instance', 'GET'),
       (100, '2022-08-08 21:15:09.351', '2022-08-08 21:15:09.351', NULL, '/host/createHost', '新增host', 'host', 'POST'),
       (101, '2022-08-08 21:15:09.355', '2022-08-08 21:15:09.355', NULL, '/host/deleteHost', '删除host', 'host',
        'DELETE'),
       (102, '2022-08-08 21:15:09.360', '2022-08-08 21:15:09.360', NULL, '/host/deleteHostByIds', '批量删除host', 'host',
        'DELETE'),
       (103, '2022-08-08 21:15:09.366', '2022-08-08 21:15:09.366', NULL, '/host/updateHost', '更新host', 'host', 'PUT'),
       (104, '2022-08-08 21:15:09.372', '2022-08-08 21:15:09.372', NULL, '/host/findHost', '根据ID获取host', 'host', 'GET'),
       (105, '2022-08-08 21:15:09.380', '2022-08-08 21:15:09.380', NULL, '/host/getHostList', '获取host列表', 'host',
        'GET'),
       (106, '2022-08-08 21:17:00.435', '2022-08-08 21:17:00.435', NULL, '/domain/createDomain', '新增domain', 'domain',
        'POST'),
       (107, '2022-08-08 21:17:00.440', '2022-08-08 21:17:00.440', NULL, '/domain/deleteDomain', '删除domain', 'domain',
        'DELETE'),
       (108, '2022-08-08 21:17:00.444', '2022-08-08 21:17:00.444', NULL, '/domain/deleteDomainByIds', '批量删除domain',
        'domain', 'DELETE'),
       (109, '2022-08-08 21:17:00.448', '2022-08-08 21:17:00.448', NULL, '/domain/updateDomain', '更新domain', 'domain',
        'PUT'),
       (110, '2022-08-08 21:17:00.452', '2022-08-08 21:17:00.452', NULL, '/domain/findDomain', '根据ID获取domain', 'domain',
        'GET'),
       (111, '2022-08-08 21:17:00.465', '2022-08-08 21:17:00.465', NULL, '/domain/getDomainList', '获取domain列表',
        'domain', 'GET'),
       (112, '2022-08-10 11:56:23.903', '2022-08-10 11:56:23.903', NULL, '/priject/createProject', '新增项目信息表', 'priject',
        'POST'),
       (113, '2022-08-10 11:56:23.908', '2022-08-10 11:56:23.908', NULL, '/priject/deleteProject', '删除项目信息表', 'priject',
        'DELETE'),
       (114, '2022-08-10 11:56:23.911', '2022-08-10 11:56:23.911', NULL, '/priject/deleteProjectByIds', '批量删除项目信息表',
        'priject', 'DELETE'),
       (115, '2022-08-10 11:56:23.922', '2022-08-10 11:56:23.922', NULL, '/priject/updateProject', '更新项目信息表', 'priject',
        'PUT'),
       (116, '2022-08-10 11:56:23.927', '2022-08-10 11:56:23.927', NULL, '/priject/findProject', '根据ID获取项目信息表',
        'priject', 'GET'),
       (117, '2022-08-10 11:56:23.931', '2022-08-10 11:56:23.931', NULL, '/priject/getProjectList', '获取项目信息表列表',
        'priject', 'GET'),
       (118, '2022-08-18 10:26:12.026', '2022-08-18 10:26:12.026', NULL, '/BackupLog/createBackLog', '新增备份日志表',
        'BackupLog', 'POST'),
       (119, '2022-08-18 10:26:12.031', '2022-08-18 10:26:12.031', NULL, '/BackupLog/deleteBackLog', '删除备份日志表',
        'BackupLog', 'DELETE'),
       (120, '2022-08-18 10:26:12.037', '2022-08-18 10:26:12.037', NULL, '/BackupLog/deleteBackLogByIds', '批量删除备份日志表',
        'BackupLog', 'DELETE'),
       (121, '2022-08-18 10:26:12.041', '2022-08-18 10:26:12.041', NULL, '/BackupLog/updateBackLog', '更新备份日志表',
        'BackupLog', 'PUT'),
       (122, '2022-08-18 10:26:12.047', '2022-08-18 10:26:12.047', NULL, '/BackupLog/findBackLog', '根据ID获取备份日志表',
        'BackupLog', 'GET'),
       (123, '2022-08-18 10:26:12.052', '2022-08-18 10:26:12.052', NULL, '/BackupLog/getBackLogList', '获取备份日志表列表',
        'BackupLog', 'GET'),
       (124, '2022-08-25 19:22:40.326', '2022-08-25 19:54:38.761', NULL, '/insprocesslist/showinsprocesslist',
        '对mysql实例进行show processlist操作', 'insprocesslist', 'POST');
/*!40000 ALTER TABLE `sys_apis`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authorities`
--

DROP TABLE IF EXISTS `sys_authorities`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authorities`
(
    `created_at`     datetime(3)                                                   DEFAULT NULL,
    `updated_at`     datetime(3)                                                   DEFAULT NULL,
    `deleted_at`     datetime(3)                                                   DEFAULT NULL,
    `authority_id`   bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `authority_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
    `parent_id`      bigint unsigned                                               DEFAULT NULL COMMENT '父角色ID',
    `default_router` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'dashboard' COMMENT '默认菜单',
    PRIMARY KEY (`authority_id`),
    UNIQUE KEY `authority_id` (`authority_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9529
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authorities`
--

LOCK TABLES `sys_authorities` WRITE;
/*!40000 ALTER TABLE `sys_authorities`
    DISABLE KEYS */;
INSERT INTO `sys_authorities`
VALUES ('2022-08-08 21:02:21.957', '2022-08-25 19:48:53.904', NULL, 888, '普通用户', 0, 'dashboard'),
       ('2022-08-08 21:02:21.957', '2022-08-25 19:48:58.787', NULL, 8881, '普通用户子角色', 888, 'dashboard'),
       ('2022-08-08 21:02:21.957', '2022-08-08 21:02:22.256', NULL, 9528, '测试角色', 0, 'dashboard');
/*!40000 ALTER TABLE `sys_authorities`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_btns`
--

DROP TABLE IF EXISTS `sys_authority_btns`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_btns`
(
    `authority_id`         bigint unsigned DEFAULT NULL COMMENT '角色ID',
    `sys_menu_id`          bigint unsigned DEFAULT NULL COMMENT '菜单ID',
    `sys_base_menu_btn_id` bigint unsigned DEFAULT NULL COMMENT '菜单按钮ID'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_btns`
--

LOCK TABLES `sys_authority_btns` WRITE;
/*!40000 ALTER TABLE `sys_authority_btns`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_authority_btns`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_menus`
--

DROP TABLE IF EXISTS `sys_authority_menus`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_menus`
(
    `sys_base_menu_id`           bigint unsigned NOT NULL,
    `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`sys_base_menu_id`, `sys_authority_authority_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_menus`
--

LOCK TABLES `sys_authority_menus` WRITE;
/*!40000 ALTER TABLE `sys_authority_menus`
    DISABLE KEYS */;
INSERT INTO `sys_authority_menus`
VALUES (1, 888),
       (1, 8881),
       (1, 9528),
       (2, 888),
       (2, 9528),
       (3, 888),
       (4, 888),
       (5, 888),
       (6, 888),
       (7, 888),
       (8, 888),
       (8, 9528),
       (9, 888),
       (10, 888),
       (11, 888),
       (12, 888),
       (13, 888),
       (14, 888),
       (15, 888),
       (16, 888),
       (17, 888),
       (18, 888),
       (19, 888),
       (20, 888),
       (23, 888),
       (24, 888),
       (25, 888),
       (26, 888),
       (27, 888),
       (28, 888),
       (29, 888),
       (30, 888),
       (31, 888),
       (32, 888),
       (32, 8881),
       (33, 888),
       (33, 8881),
       (34, 888),
       (34, 8881),
       (35, 888),
       (35, 8881),
       (36, 888),
       (36, 8881),
       (37, 888),
       (37, 8881),
       (38, 888),
       (38, 8881);
/*!40000 ALTER TABLE `sys_authority_menus`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auto_code_histories`
--

DROP TABLE IF EXISTS `sys_auto_code_histories`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auto_code_histories`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`     datetime(3)                                                   DEFAULT NULL,
    `updated_at`     datetime(3)                                                   DEFAULT NULL,
    `deleted_at`     datetime(3)                                                   DEFAULT NULL,
    `package`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `table_name`     varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `request_meta`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
    `auto_code_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
    `injection_meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
    `struct_name`    varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `struct_cn_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `api_ids`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `flag`           bigint                                                        DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_sys_auto_code_histories_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_code_histories`
--

LOCK TABLES `sys_auto_code_histories` WRITE;
/*!40000 ALTER TABLE `sys_auto_code_histories`
    DISABLE KEYS */;
INSERT INTO `sys_auto_code_histories`
VALUES (1, '2022-08-08 21:09:55.456', '2022-08-08 21:09:55.456', NULL, 'saasdb', 'saas_instance',
        '{\"structName\":\"Instance\",\"tableName\":\"saas_instance\",\"packageName\":\"saasInstance\",\"humpPackageName\":\"saas_instance\",\"abbreviation\":\"saas_instance\",\"description\":\"instance表\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"InsId\",\"fieldDesc\":\"insId\",\"fieldType\":\"int\",\"fieldJson\":\"insId\",\"dataTypeLong\":\"\",\"comment\":\"insId\",\"columnName\":\"ins_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"ProjId\",\"fieldDesc\":\"projId\",\"fieldType\":\"int\",\"fieldJson\":\"projId\",\"dataTypeLong\":\"\",\"comment\":\"项目id\",\"columnName\":\"proj_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Ip\",\"fieldDesc\":\"ip\",\"fieldType\":\"string\",\"fieldJson\":\"ip\",\"dataTypeLong\":\"\",\"comment\":\"ip\",\"columnName\":\"ip\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Port\",\"fieldDesc\":\"port\",\"fieldType\":\"int\",\"fieldJson\":\"port\",\"dataTypeLong\":\"\",\"comment\":\"port\",\"columnName\":\"port\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Application\",\"fieldDesc\":\"application\",\"fieldType\":\"enum\",\"fieldJson\":\"application\",\"dataTypeLong\":\"\'oracle\',\'mysql\',\'redis\',\'mongodb\',\'tidb\'\",\"comment\":\"application应用类型\",\"columnName\":\"application\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Version\",\"fieldDesc\":\"version\",\"fieldType\":\"string\",\"fieldJson\":\"version\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"version\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"UseType\",\"fieldDesc\":\"useType\",\"fieldType\":\"enum\",\"fieldJson\":\"useType\",\"dataTypeLong\":\"\'正式\',\'线上测试\',\'预发布\'\",\"comment\":\"\",\"columnName\":\"use_type\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Health\",\"fieldDesc\":\"health\",\"fieldType\":\"enum\",\"fieldJson\":\"health\",\"dataTypeLong\":\"\'available\',\'unavailable\',\'restarting\',\'starting\',\'stoping\',\'migrating\'\",\"comment\":\"\",\"columnName\":\"health\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true}],\"HasTimer\":false,\"package\":\"saasdb\"}',
        '/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/saas_instance.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/saas_instance.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/request/saas_instance.go;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/saas_instance.go;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/saas_instance.go;/Users/anderalex/go/src/gin-vue-admin/web/src/api/saasInstance.js;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasInstance/saasInstanceForm.vue;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasInstance/saasInstance.vue;',
        '/Users/anderalex/go/src/gin-vue-admin/server/initialize/gorm.go@MysqlTables@saasdb.Instance{},;/Users/anderalex/go/src/gin-vue-admin/server/initialize/router.go@Routers@saasdbRouter.InitInstanceRouter(PrivateGroup);/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/enter.go@ApiGroup@InstanceApi;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/enter.go@RouterGroup@InstanceRouter;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/enter.go@ServiceGroup@InstanceService;',
        'Instance', 'instance表', '94;95;96;97;98;99;', 0),
       (2, '2022-08-08 21:15:09.455', '2022-08-08 21:15:09.455', NULL, 'saasdb', 'saas_host',
        '{\"structName\":\"Host\",\"tableName\":\"saas_host\",\"packageName\":\"saasHost\",\"humpPackageName\":\"saas_host\",\"abbreviation\":\"host\",\"description\":\"host\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"HostId\",\"fieldDesc\":\"hostId\",\"fieldType\":\"int\",\"fieldJson\":\"hostId\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"host_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Hostname\",\"fieldDesc\":\"hostname\",\"fieldType\":\"string\",\"fieldJson\":\"hostname\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"hostname\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Ip\",\"fieldDesc\":\"ip\",\"fieldType\":\"string\",\"fieldJson\":\"ip\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"ip\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Cpu\",\"fieldDesc\":\"cpu\",\"fieldType\":\"int\",\"fieldJson\":\"cpu\",\"dataTypeLong\":\"10\",\"comment\":\"\",\"columnName\":\"cpu\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Memory\",\"fieldDesc\":\"memory\",\"fieldType\":\"int\",\"fieldJson\":\"memory\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"memory\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"Disksize\",\"fieldDesc\":\"disksize\",\"fieldType\":\"int\",\"fieldJson\":\"disksize\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"disksize\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true}],\"HasTimer\":false,\"package\":\"saasdb\"}',
        '/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/saas_host.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/saas_host.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/request/saas_host.go;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/saas_host.go;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/saas_host.go;/Users/anderalex/go/src/gin-vue-admin/web/src/api/saasHost.js;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasHost/saasHostForm.vue;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasHost/saasHost.vue;',
        '/Users/anderalex/go/src/gin-vue-admin/server/initialize/gorm.go@MysqlTables@saasdb.Host{},;/Users/anderalex/go/src/gin-vue-admin/server/initialize/router.go@Routers@saasdbRouter.InitHostRouter(PrivateGroup);/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/enter.go@ApiGroup@HostApi;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/enter.go@RouterGroup@HostRouter;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/enter.go@ServiceGroup@HostService;',
        'Host', 'host', '100;101;102;103;104;105;', 0),
       (3, '2022-08-08 21:17:00.560', '2022-08-08 21:17:00.560', NULL, 'saasdb', 'saas_domain',
        '{\"structName\":\"Domain\",\"tableName\":\"saas_domain\",\"packageName\":\"saasDomain\",\"humpPackageName\":\"saas_domain\",\"abbreviation\":\"domain\",\"description\":\"domain\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"DomainId\",\"fieldDesc\":\"domainId\",\"fieldType\":\"int\",\"fieldJson\":\"domainId\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"domain_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"InsId\",\"fieldDesc\":\"insId\",\"fieldType\":\"int\",\"fieldJson\":\"insId\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"ins_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"DomainName\",\"fieldDesc\":\"domainName\",\"fieldType\":\"string\",\"fieldJson\":\"domainName\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"domain_name\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"ProjId\",\"fieldDesc\":\"projId\",\"fieldType\":\"int\",\"fieldJson\":\"projId\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"proj_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true}],\"HasTimer\":false,\"package\":\"saasdb\"}',
        '/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/saas_domain.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/saas_domain.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/request/saas_domain.go;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/saas_domain.go;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/saas_domain.go;/Users/anderalex/go/src/gin-vue-admin/web/src/api/saasDomain.js;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasDomain/saasDomainForm.vue;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasDomain/saasDomain.vue;',
        '/Users/anderalex/go/src/gin-vue-admin/server/initialize/gorm.go@MysqlTables@saasdb.Domain{},;/Users/anderalex/go/src/gin-vue-admin/server/initialize/router.go@Routers@saasdbRouter.InitDomainRouter(PrivateGroup);/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/enter.go@ApiGroup@DomainApi;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/enter.go@RouterGroup@DomainRouter;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/enter.go@ServiceGroup@DomainService;',
        'Domain', 'domain', '106;107;108;109;110;111;', 0),
       (4, '2022-08-10 11:56:25.756', '2022-08-10 11:56:25.756', NULL, 'saasdb', 'project',
        '{\"structName\":\"Project\",\"tableName\":\"project\",\"packageName\":\"saasProject\",\"humpPackageName\":\"saas_project\",\"abbreviation\":\"priject\",\"description\":\"项目信息表\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"ProjId\",\"fieldDesc\":\"projid\",\"fieldType\":\"int\",\"fieldJson\":\"projId\",\"dataTypeLong\":\"\",\"comment\":\"项目代号\",\"columnName\":\"proj_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"ProjName\",\"fieldDesc\":\"projname\",\"fieldType\":\"string\",\"fieldJson\":\"projName\",\"dataTypeLong\":\"\",\"comment\":\"项目名称\",\"columnName\":\"proj_name\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"NotifyUsers\",\"fieldDesc\":\"notify_users\",\"fieldType\":\"string\",\"fieldJson\":\"notifyUsers\",\"dataTypeLong\":\"\",\"comment\":\"项目操作通知的用户列表，如无设置则仅通知给操作人\",\"columnName\":\"notify_users\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"AlarmGroupId\",\"fieldDesc\":\"alarm组id\",\"fieldType\":\"int\",\"fieldJson\":\"alarmGroupId\",\"dataTypeLong\":\"\",\"comment\":\"关联AlarmGroup表\",\"columnName\":\"alarm_group_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true}],\"HasTimer\":false,\"package\":\"saasdb\"}',
        '/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/saas_project.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/saas_project.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/request/saas_project.go;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/saas_project.go;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/saas_project.go;/Users/anderalex/go/src/gin-vue-admin/web/src/api/saasProject.js;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasProject/saasProjectForm.vue;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saasProject/saasProject.vue;',
        '/Users/anderalex/go/src/gin-vue-admin/server/initialize/gorm.go@MysqlTables@saasdb.Project{},;/Users/anderalex/go/src/gin-vue-admin/server/initialize/router.go@Routers@saasdbRouter.InitProjectRouter(PrivateGroup);/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/enter.go@ApiGroup@ProjectApi;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/enter.go@RouterGroup@ProjectRouter;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/enter.go@ServiceGroup@ProjectService;',
        'Project', '项目信息表', '112;113;114;115;116;117;', 0),
       (5, '2022-08-18 10:26:12.160', '2022-08-18 10:26:12.160', NULL, 'saasdb', 'back_log',
        '{\"structName\":\"BackLog\",\"tableName\":\"back_log\",\"packageName\":\"saas_backup\",\"humpPackageName\":\"saas_backup\",\"abbreviation\":\"BackupLog\",\"description\":\"备份日志表\",\"autoCreateApiToSql\":true,\"autoMoveFile\":true,\"fields\":[{\"fieldName\":\"DomainId\",\"fieldDesc\":\"集群实例id\",\"fieldType\":\"int\",\"fieldJson\":\"domainId\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"domain_id\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"BackupType\",\"fieldDesc\":\"BackupType\",\"fieldType\":\"enum\",\"fieldJson\":\"backupType\",\"dataTypeLong\":\"\'mysql\',\'redis\',\'tidb\'\",\"comment\":\"备份类型\",\"columnName\":\"backup_type\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":true,\"errorText\":\"\",\"clearable\":true},{\"fieldName\":\"DataSize\",\"fieldDesc\":\"DataSize\",\"fieldType\":\"int\",\"fieldJson\":\"dataSize\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"data_size\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true}],\"HasTimer\":false,\"package\":\"saasdb\"}',
        '/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/saas_backup.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/saas_backup.go;/Users/anderalex/go/src/gin-vue-admin/server/model/saasdb/request/saas_backup.go;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/saas_backup.go;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/saas_backup.go;/Users/anderalex/go/src/gin-vue-admin/web/src/api/saas_backup.js;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saas_backup/saas_backupForm.vue;/Users/anderalex/go/src/gin-vue-admin/web/src/view/saas_backup/saas_backup.vue;',
        '/Users/anderalex/go/src/gin-vue-admin/server/initialize/gorm.go@MysqlTables@saasdb.BackLog{},;/Users/anderalex/go/src/gin-vue-admin/server/initialize/router.go@Routers@saasdbRouter.InitBackLogRouter(PrivateGroup);/Users/anderalex/go/src/gin-vue-admin/server/api/v1/saasdb/enter.go@ApiGroup@BackLogApi;/Users/anderalex/go/src/gin-vue-admin/server/router/saasdb/enter.go@RouterGroup@BackLogRouter;/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/enter.go@ServiceGroup@BackLogService;',
        'BackLog', '备份日志表', '118;119;120;121;122;123;', 0);
/*!40000 ALTER TABLE `sys_auto_code_histories`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auto_codes`
--

DROP TABLE IF EXISTS `sys_auto_codes`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auto_codes`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`   datetime(3)                                                   DEFAULT NULL,
    `updated_at`   datetime(3)                                                   DEFAULT NULL,
    `deleted_at`   datetime(3)                                                   DEFAULT NULL,
    `package_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包名',
    `label`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示名',
    `desc`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`id`),
    KEY `idx_sys_auto_codes_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_codes`
--

LOCK TABLES `sys_auto_codes` WRITE;
/*!40000 ALTER TABLE `sys_auto_codes`
    DISABLE KEYS */;
INSERT INTO `sys_auto_codes`
VALUES (1, '2022-08-08 21:03:02.363', '2022-08-08 21:03:02.363', NULL, 'saasdb', 'saasdb', '数据库saasdb');
/*!40000 ALTER TABLE `sys_auto_codes`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_btns`
--

DROP TABLE IF EXISTS `sys_base_menu_btns`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_btns`
(
    `id`               bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`       datetime(3)                                                   DEFAULT NULL,
    `updated_at`       datetime(3)                                                   DEFAULT NULL,
    `deleted_at`       datetime(3)                                                   DEFAULT NULL,
    `name`             varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '按钮关键key',
    `desc`             varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `sys_base_menu_id` bigint unsigned                                               DEFAULT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`),
    KEY `idx_sys_base_menu_btns_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_btns`
--

LOCK TABLES `sys_base_menu_btns` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_btns`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_btns`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_parameters`
--

DROP TABLE IF EXISTS `sys_base_menu_parameters`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_parameters`
(
    `id`               bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`       datetime(3)                                                   DEFAULT NULL,
    `updated_at`       datetime(3)                                                   DEFAULT NULL,
    `deleted_at`       datetime(3)                                                   DEFAULT NULL,
    `sys_base_menu_id` bigint unsigned                                               DEFAULT NULL,
    `type`             varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
    `key`              varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的key',
    `value`            varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的值',
    PRIMARY KEY (`id`),
    KEY `idx_sys_base_menu_parameters_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_parameters`
--

LOCK TABLES `sys_base_menu_parameters` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_parameters`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_parameters`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menus`
--

DROP TABLE IF EXISTS `sys_base_menus`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menus`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`   datetime(3)                                                   DEFAULT NULL,
    `updated_at`   datetime(3)                                                   DEFAULT NULL,
    `deleted_at`   datetime(3)                                                   DEFAULT NULL,
    `menu_level`   bigint unsigned                                               DEFAULT NULL,
    `parent_id`    varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父菜单ID',
    `path`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由path',
    `name`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由name',
    `hidden`       tinyint(1)                                                    DEFAULT NULL COMMENT '是否在列表隐藏',
    `component`    varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对应前端文件路径',
    `sort`         bigint                                                        DEFAULT NULL COMMENT '排序标记',
    `keep_alive`   tinyint(1)                                                    DEFAULT NULL COMMENT '附加属性',
    `default_menu` tinyint(1)                                                    DEFAULT NULL COMMENT '附加属性',
    `title`        varchar(191) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '附加属性',
    `icon`         varchar(191) COLLATE utf8mb4_general_ci                       DEFAULT NULL COMMENT '附加属性',
    `close_tab`    tinyint(1)                                                    DEFAULT NULL COMMENT '附加属性',
    PRIMARY KEY (`id`),
    KEY `idx_sys_base_menus_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menus`
--

LOCK TABLES `sys_base_menus` WRITE;
/*!40000 ALTER TABLE `sys_base_menus`
    DISABLE KEYS */;
INSERT INTO `sys_base_menus`
VALUES (1, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'dashboard', 'dashboard', 0,
        'view/dashboard/index.vue', 1, 0, 0, '仪表盘', 'odometer', 0),
       (2, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'about', 'about', 0,
        'view/about/index.vue', 9, 0, 0, '关于我们', 'info-filled', 0),
       (3, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'admin', 'superAdmin', 0,
        'view/superAdmin/index.vue', 3, 0, 0, '超级管理员', 'user', 0),
       (4, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '3', 'authority', 'authority', 0,
        'view/superAdmin/authority/authority.vue', 1, 0, 0, '角色管理', 'avatar', 0),
       (5, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '3', 'menu', 'menu', 0,
        'view/superAdmin/menu/menu.vue', 2, 1, 0, '菜单管理', 'tickets', 0),
       (6, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '3', 'api', 'api', 0,
        'view/superAdmin/api/api.vue', 3, 1, 0, 'api管理', 'platform', 0),
       (7, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '3', 'user', 'user', 0,
        'view/superAdmin/user/user.vue', 4, 0, 0, '用户管理', 'coordinate', 0),
       (8, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'person', 'person', 1,
        'view/person/person.vue', 4, 0, 0, '个人信息', 'message', 0),
       (9, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'example', 'example', 0,
        'view/example/index.vue', 7, 0, 0, '示例文件', 'management', 0),
       (10, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '9', 'excel', 'excel', 0,
        'view/example/excel/excel.vue', 4, 0, 0, 'excel导入导出', 'takeaway-box', 0),
       (11, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '9', 'upload', 'upload', 0,
        'view/example/upload/upload.vue', 5, 0, 0, '媒体库（上传下载）', 'upload', 0),
       (12, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '9', 'breakpoint', 'breakpoint', 0,
        'view/example/breakpoint/breakpoint.vue', 6, 0, 0, '断点续传', 'upload-filled', 0),
       (13, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '9', 'customer', 'customer', 0,
        'view/example/customer/customer.vue', 7, 0, 0, '客户列表（资源示例）', 'avatar', 0),
       (14, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'systemTools', 'systemTools', 0,
        'view/systemTools/index.vue', 5, 0, 0, '系统工具', 'tools', 0),
       (15, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '14', 'autoCode', 'autoCode', 0,
        'view/systemTools/autoCode/index.vue', 1, 1, 0, '代码生成器', 'cpu', 0),
       (16, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '14', 'formCreate', 'formCreate', 0,
        'view/systemTools/formCreate/index.vue', 2, 1, 0, '表单生成器', 'magic-stick', 0),
       (17, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '14', 'system', 'system', 0,
        'view/systemTools/system/system.vue', 3, 0, 0, '系统配置', 'operation', 0),
       (18, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '3', 'dictionary', 'dictionary', 0,
        'view/superAdmin/dictionary/sysDictionary.vue', 5, 0, 0, '字典管理', 'notebook', 0),
       (19, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '3', 'dictionaryDetail/:id',
        'dictionaryDetail', 1, 'view/superAdmin/dictionary/sysDictionaryDetail.vue', 1, 0, 0, '字典详情-${id}', 'order', 0),
       (20, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '3', 'operation', 'operation', 0,
        'view/superAdmin/operation/sysOperationRecord.vue', 6, 0, 0, '操作历史', 'pie-chart', 0),
       (21, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '9', 'simpleUploader', 'simpleUploader', 0,
        'view/example/simpleUploader/simpleUploader', 6, 0, 0, '断点续传（插件版）', 'upload', 0),
       (22, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', '2022-08-09 18:18:17.348', 0, '0',
        'https://www.gin-vue-admin.com', 'https://www.gin-vue-admin.com', 0, '/', 0, 0, 0, '官方网站', 'home-filled', 0),
       (23, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'state', 'state', 0,
        'view/system/state.vue', 8, 0, 0, '服务器状态', 'cloudy', 0),
       (24, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '14', 'autoCodeAdmin', 'autoCodeAdmin', 0,
        'view/systemTools/autoCodeAdmin/index.vue', 1, 0, 0, '自动化代码管理', 'magic-stick', 0),
       (25, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '14', 'autoCodeEdit/:id', 'autoCodeEdit', 1,
        'view/systemTools/autoCode/index.vue', 0, 0, 0, '自动化代码-${id}', 'magic-stick', 0),
       (26, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '14', 'autoPkg', 'autoPkg', 0,
        'view/systemTools/autoPkg/autoPkg.vue', 0, 0, 0, '自动化package', 'folder', 0),
       (27, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '0', 'plugin', 'plugin', 0,
        'view/routerHolder.vue', 6, 0, 0, '插件系统', 'cherry', 0),
       (28, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '27', 'https://plugin.gin-vue-admin.com/',
        'https://plugin.gin-vue-admin.com/', 0, 'https://plugin.gin-vue-admin.com/', 0, 0, 0, '插件市场', 'shop', 0),
       (29, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '27', 'installPlugin', 'installPlugin', 0,
        'view/systemTools/installPlugin/index.vue', 1, 0, 0, '插件安装', 'box', 0),
       (30, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '27', 'autoPlug', 'autoPlug', 0,
        'view/systemTools/autoPlug/autoPlug.vue', 2, 0, 0, '插件模板', 'folder', 0),
       (31, '2022-08-08 21:02:22.221', '2022-08-08 21:02:22.221', NULL, 0, '27', 'plugin-email', 'plugin-email', 0,
        'plugin/email/view/index.vue', 3, 0, 0, '邮件插件', 'message', 0),
       (32, '2022-08-08 21:23:09.476', '2022-08-09 18:19:32.852', NULL, 0, '0', 'db-plartform', 'db-plartform', 0,
        'view/routerHolder.vue', 1, 1, 0, '数据库管理', 'coin', 0),
       (33, '2022-08-08 21:25:02.987', '2022-08-09 18:19:47.191', NULL, 0, '32', 'DBDomain', 'DBDomain', 0,
        'view/saasDomain/saasDomain.vue', 0, 0, 0, '数据库集群', 'coin', 0),
       (34, '2022-08-09 13:48:43.458', '2022-08-09 13:50:20.140', NULL, 0, '0', 'hostplatform', 'hostplatform', 0,
        'view/saasHost/saasHost.vue', 2, 0, 0, '宿主机管理', 'coin', 0),
       (35, '2022-08-09 16:01:07.597', '2022-08-09 16:16:23.619', NULL, 0, '0', 'taskPlatform', 'taskPlatform', 0,
        'view/saasTaskPlatform/index.vue', 3, 0, 0, '计划任务管理', 'calendar', 0),
       (36, '2022-08-09 18:17:26.248', '2022-08-09 18:20:15.841', NULL, 0, '32', 'instanceinfo', 'instanceinfo', 0,
        'view/saasInstance/saasInstance.vue', 1, 0, 0, '数据库实例', 'coin', 0),
       (37, '2022-08-10 12:03:00.785', '2022-08-10 12:03:00.785', NULL, 0, '0', 'project', 'project', 0,
        'view/saasProject/saasProject.vue', 3, 0, 0, '项目管理', 'chat-line-round', 0),
       (38, '2022-08-25 19:48:30.921', '2022-08-25 19:50:32.917', NULL, 0, '0', 'showinsprocesslist',
        'showinsprocesslist', 0, 'view/saasInsShowProcesslist/saasInsShowProcesslist.vue', 0, 0, 0, 'showprocesslist',
        'aim', 0);
/*!40000 ALTER TABLE `sys_base_menus`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_authority_id`
--

DROP TABLE IF EXISTS `sys_data_authority_id`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_authority_id`
(
    `sys_authority_authority_id`     bigint unsigned NOT NULL COMMENT '角色ID',
    `data_authority_id_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`sys_authority_authority_id`, `data_authority_id_authority_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_authority_id`
--

LOCK TABLES `sys_data_authority_id` WRITE;
/*!40000 ALTER TABLE `sys_data_authority_id`
    DISABLE KEYS */;
INSERT INTO `sys_data_authority_id`
VALUES (888, 888),
       (888, 8881),
       (888, 9528),
       (9528, 8881),
       (9528, 9528);
/*!40000 ALTER TABLE `sys_data_authority_id`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionaries`
--

DROP TABLE IF EXISTS `sys_dictionaries`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionaries`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` datetime(3)                                                   DEFAULT NULL,
    `updated_at` datetime(3)                                                   DEFAULT NULL,
    `deleted_at` datetime(3)                                                   DEFAULT NULL,
    `name`       varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（中）',
    `type`       varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（英）',
    `status`     tinyint(1)                                                    DEFAULT NULL COMMENT '状态',
    `desc`       varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`id`),
    KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionaries`
--

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries`
    DISABLE KEYS */;
INSERT INTO `sys_dictionaries`
VALUES (1, '2022-08-08 21:02:21.992', '2022-08-08 21:02:22.001', NULL, '性别', 'gender', 1, '性别字典'),
       (2, '2022-08-08 21:02:21.992', '2022-08-08 21:02:22.015', NULL, '数据库int类型', 'int', 1, 'int类型对应的数据库类型'),
       (3, '2022-08-08 21:02:21.992', '2022-08-08 21:02:22.025', NULL, '数据库时间日期类型', 'time.Time', 1, '数据库时间日期类型'),
       (4, '2022-08-08 21:02:21.992', '2022-08-08 21:02:22.034', NULL, '数据库浮点型', 'float64', 1, '数据库浮点型'),
       (5, '2022-08-08 21:02:21.992', '2022-08-08 21:02:22.044', NULL, '数据库字符串', 'string', 1, '数据库字符串'),
       (6, '2022-08-08 21:02:21.992', '2022-08-08 21:02:22.056', NULL, '数据库bool类型', 'bool', 1, '数据库bool类型');
/*!40000 ALTER TABLE `sys_dictionaries`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionary_details`
--

DROP TABLE IF EXISTS `sys_dictionary_details`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionary_details`
(
    `id`                bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`        datetime(3)                                                   DEFAULT NULL,
    `updated_at`        datetime(3)                                                   DEFAULT NULL,
    `deleted_at`        datetime(3)                                                   DEFAULT NULL,
    `label`             varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示值',
    `value`             bigint                                                        DEFAULT NULL COMMENT '字典值',
    `status`            tinyint(1)                                                    DEFAULT NULL COMMENT '启用状态',
    `sort`              bigint                                                        DEFAULT NULL COMMENT '排序标记',
    `sys_dictionary_id` bigint unsigned                                               DEFAULT NULL COMMENT '关联标记',
    PRIMARY KEY (`id`),
    KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionary_details`
--

LOCK TABLES `sys_dictionary_details` WRITE;
/*!40000 ALTER TABLE `sys_dictionary_details`
    DISABLE KEYS */;
INSERT INTO `sys_dictionary_details`
VALUES (1, '2022-08-08 21:02:22.003', '2022-08-08 21:02:22.003', NULL, '男', 1, 1, 1, 1),
       (2, '2022-08-08 21:02:22.003', '2022-08-08 21:02:22.003', NULL, '女', 2, 1, 2, 1),
       (3, '2022-08-08 21:02:22.017', '2022-08-08 21:02:22.017', NULL, 'smallint', 1, 1, 1, 2),
       (4, '2022-08-08 21:02:22.017', '2022-08-08 21:02:22.017', NULL, 'mediumint', 2, 1, 2, 2),
       (5, '2022-08-08 21:02:22.017', '2022-08-08 21:02:22.017', NULL, 'int', 3, 1, 3, 2),
       (6, '2022-08-08 21:02:22.017', '2022-08-08 21:02:22.017', NULL, 'bigint', 4, 1, 4, 2),
       (7, '2022-08-08 21:02:22.026', '2022-08-08 21:02:22.026', NULL, 'date', 0, 1, 0, 3),
       (8, '2022-08-08 21:02:22.026', '2022-08-08 21:02:22.026', NULL, 'time', 1, 1, 1, 3),
       (9, '2022-08-08 21:02:22.026', '2022-08-08 21:02:22.026', NULL, 'year', 2, 1, 2, 3),
       (10, '2022-08-08 21:02:22.026', '2022-08-08 21:02:22.026', NULL, 'datetime', 3, 1, 3, 3),
       (11, '2022-08-08 21:02:22.026', '2022-08-08 21:02:22.026', NULL, 'timestamp', 5, 1, 5, 3),
       (12, '2022-08-08 21:02:22.036', '2022-08-08 21:02:22.036', NULL, 'float', 0, 1, 0, 4),
       (13, '2022-08-08 21:02:22.036', '2022-08-08 21:02:22.036', NULL, 'double', 1, 1, 1, 4),
       (14, '2022-08-08 21:02:22.036', '2022-08-08 21:02:22.036', NULL, 'decimal', 2, 1, 2, 4),
       (15, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'char', 0, 1, 0, 5),
       (16, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'varchar', 1, 1, 1, 5),
       (17, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'tinyblob', 2, 1, 2, 5),
       (18, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'tinytext', 3, 1, 3, 5),
       (19, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'text', 4, 1, 4, 5),
       (20, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'blob', 5, 1, 5, 5),
       (21, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'mediumblob', 6, 1, 6, 5),
       (22, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'mediumtext', 7, 1, 7, 5),
       (23, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'longblob', 8, 1, 8, 5),
       (24, '2022-08-08 21:02:22.046', '2022-08-08 21:02:22.046', NULL, 'longtext', 9, 1, 9, 5),
       (25, '2022-08-08 21:02:22.058', '2022-08-08 21:02:22.058', NULL, 'tinyint', 0, 1, 0, 6);
/*!40000 ALTER TABLE `sys_dictionary_details`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operation_records`
--

DROP TABLE IF EXISTS `sys_operation_records`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_operation_records`
(
    `id`            bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`    datetime(3)                                                   DEFAULT NULL,
    `updated_at`    datetime(3)                                                   DEFAULT NULL,
    `deleted_at`    datetime(3)                                                   DEFAULT NULL,
    `ip`            varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求ip',
    `method`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
    `path`          varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
    `status`        bigint                                                        DEFAULT NULL COMMENT '请求状态',
    `latency`       bigint                                                        DEFAULT NULL COMMENT '延迟',
    `agent`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '代理',
    `error_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误信息',
    `body`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求Body',
    `resp`          text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '响应Body',
    `user_id`       bigint unsigned                                               DEFAULT NULL COMMENT '用户id',
    PRIMARY KEY (`id`),
    KEY `idx_sys_operation_records_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 126
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation_records`
--

LOCK TABLES `sys_operation_records` WRITE;
/*!40000 ALTER TABLE `sys_operation_records`
    DISABLE KEYS */;
INSERT INTO `sys_operation_records`
VALUES (1, '2022-08-08 21:23:09.483', '2022-08-08 21:23:09.483', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200,
        10098011,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":0,\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":\"\",\"parentId\":\"0\",\"component\":\"view/routerHolder.vue\",\"meta\":{\"title\":\"数据库管理\",\"icon\":\"aim\",\"defaultMenu\":false,\"closeTab\":false,\"keepAlive\":true},\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (2, '2022-08-08 21:25:02.994', '2022-08-08 21:25:02.994', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200,
        9867114,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":0,\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":\"\",\"parentId\":\"0\",\"component\":\"view/saasDomain/saasDomain.vue\",\"meta\":{\"title\":\"数据库集群管理\",\"icon\":\"coin\",\"defaultMenu\":false,\"keepAlive\":\"\"},\"sort\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (3, '2022-08-08 21:25:26.345', '2022-08-08 21:25:26.345', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 30177501,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"parentId\":\"0\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":22,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"https://www.gin-vue-admin.com\",\"name\":\"https://www.gin-vue-admin.com\",\"hidden\":false,\"component\":\"/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"官方网站\",\"icon\":\"home-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":0,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":3,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":27,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"plugin\",\"name\":\"plugin\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件系统\",\"icon\":\"cherry\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":9,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":23,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":8,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":2,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":9,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":888}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (4, '2022-08-08 21:25:33.920', '2022-08-08 21:25:33.920', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 29360162,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"parentId\":\"0\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":0,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":3,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":9,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":2,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":9,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (5, '2022-08-08 21:25:38.851', '2022-08-08 21:25:38.851', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200,
        24696632,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (6, '2022-08-08 21:25:49.073', '2022-08-08 21:25:49.073', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin', 200,
        33984592,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":888,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/setSelfInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/user/resetPassword\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/findFile\",\"method\":\"GET\"},{\"path\":\"/fileUploadAndDownload/breakpointContinue\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/breakpointContinueFinish\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/removeChunk\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/createPlug\",\"method\":\"POST\"},{\"path\":\"/autoCode/installPlugin\",\"method\":\"POST\"},{\"path\":\"/autoCode/createPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/delPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/excel/importExcel\",\"method\":\"POST\"},{\"path\":\"/excel/loadExcel\",\"method\":\"GET\"},{\"path\":\"/excel/exportExcel\",\"method\":\"POST\"},{\"path\":\"/excel/downloadTemplate\",\"method\":\"GET\"},{\"path\":\"/authorityBtn/setAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/getAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/canRemoveAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (7, '2022-08-08 21:27:44.834', '2022-08-08 21:27:44.834', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200,
        19212915,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (8, '2022-08-08 21:28:06.426', '2022-08-08 21:28:06.426', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu', 200,
        13923031,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":0,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (9, '2022-08-08 21:29:46.497', '2022-08-08 21:29:46.497', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 29347606,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"menus\":[{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-08T21:28:06.419+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":0,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (10, '2022-08-08 21:30:11.742', '2022-08-08 21:30:11.742', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 29526644,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (11, '2022-08-08 21:30:34.561', '2022-08-08 21:30:34.561', NULL, '127.0.0.1', 'POST', '/user/admin_register',
        200, 74769707,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"username\":\"\",\"password\":\"haierdba\",\"nickName\":\"DBA\",\"headerImg\":\"\",\"authorityId\":8881,\"authorityIds\":[8881],\"enable\":1,\"userName\":\"haierdba\"}',
        '{\"code\":0,\"data\":{\"user\":{\"ID\":3,\"CreatedAt\":\"2022-08-08T21:30:34.548+08:00\",\"UpdatedAt\":\"2022-08-08T21:30:34.548+08:00\",\"uuid\":\"10677605-e5b2-44e1-8295-8a6b8229210b\",\"userName\":\"haierdba\",\"nickName\":\"DBA\",\"sideMode\":\"dark\",\"headerImg\":\"https://qmplusimg.henrongyi.top/gva_header.jpg\",\"baseColor\":\"#fff\",\"activeColor\":\"#1890ff\",\"authorityId\":8881,\"authority\":{\"CreatedAt\":\"0001-01-01T00:00:00Z\",\"UpdatedAt\":\"0001-01-01T00:00:00Z\",\"DeletedAt\":null,\"authorityId\":0,\"authorityName\":\"\",\"parentId\":0,\"dataAuthorityId\":null,\"children\":null,\"menus\":null,\"defaultRouter\":\"\"},\"authorities\":[{\"CreatedAt\":\"2022-08-08T21:30:34.551+08:00\",\"UpdatedAt\":\"2022-08-08T21:30:34.551+08:00\",\"DeletedAt\":null,\"authorityId\":8881,\"authorityName\":\"\",\"parentId\":0,\"dataAuthorityId\":null,\"children\":null,\"menus\":null,\"defaultRouter\":\"dashboard\"}],\"phone\":\"\",\"email\":\"\",\"enable\":1}},\"msg\":\"注册成功\"}',
        1),
       (12, '2022-08-08 21:31:27.376', '2022-08-08 21:31:27.376', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 26467184,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (13, '2022-08-08 21:31:44.167', '2022-08-08 21:31:44.167', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 25361533,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (14, '2022-08-08 21:31:58.952', '2022-08-08 21:31:58.952', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 28609837,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (15, '2022-08-08 21:32:11.963', '2022-08-08 21:32:11.963', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 33369589,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (16, '2022-08-08 21:32:30.075', '2022-08-08 21:32:30.075', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 25389968,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (17, '2022-08-08 21:32:37.569', '2022-08-08 21:32:37.569', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 31663113,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (18, '2022-08-08 21:32:40.058', '2022-08-08 21:32:40.058', NULL, '127.0.0.1', 'PUT',
        '/authority/updateAuthority', 200, 10794225,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '', '{\"authorityId\":8881,\"AuthorityName\":\"普通用户子角色\",\"parentId\":888,\"defaultRouter\":\"dashboard\"}',
        '{\"code\":0,\"data\":{\"authority\":{\"CreatedAt\":\"0001-01-01T00:00:00Z\",\"UpdatedAt\":\"0001-01-01T00:00:00Z\",\"DeletedAt\":null,\"authorityId\":8881,\"authorityName\":\"普通用户子角色\",\"parentId\":888,\"dataAuthorityId\":null,\"children\":null,\"menus\":null,\"defaultRouter\":\"dashboard\"}},\"msg\":\"更新成功\"}',
        1),
       (19, '2022-08-08 21:32:56.098', '2022-08-08 21:32:56.098', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 31587254,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (20, '2022-08-08 21:33:16.571', '2022-08-08 21:33:16.571', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 31061441,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (21, '2022-08-08 21:33:33.755', '2022-08-08 21:33:33.755', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 31009354,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (22, '2022-08-08 21:33:42.648', '2022-08-08 21:33:42.648', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 29572752,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (23, '2022-08-08 21:33:55.872', '2022-08-08 21:33:55.872', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 38098653,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (24, '2022-08-08 21:34:36.899', '2022-08-08 21:34:36.899', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 64940676,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (25, '2022-08-08 21:34:48.272', '2022-08-08 21:34:48.272', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 30425354,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (26, '2022-08-08 21:34:51.819', '2022-08-08 21:34:51.819', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 29552142,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (27, '2022-08-09 09:52:17.847', '2022-08-09 09:52:17.847', NULL, '127.0.0.1', 'POST', '/domain/createDomain',
        200, 20159002,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"domainId\":0,\"insId\":0,\"domainName\":\"\",\"projId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (28, '2022-08-09 09:52:42.239', '2022-08-09 09:52:42.239', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        12068829,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-09T09:52:17.828+08:00\",\"UpdatedAt\":\"2022-08-09T09:52:17.828+08:00\",\"domainId\":0,\"insId\":1,\"domainName\":\"\",\"projId\":1}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (29, '2022-08-09 09:52:44.116', '2022-08-09 09:52:44.116', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 13127623,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":1}', '{\"code\":0,\"data\":{},\"msg\":\"删除成功\"}', 3),
       (30, '2022-08-09 13:48:43.479', '2022-08-09 13:48:43.479', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200,
        27236358,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":0,\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":\"\",\"parentId\":\"0\",\"component\":\"view/saasHost/saasHost.vue\",\"meta\":{\"title\":\"宿主机管理\",\"icon\":\"coin\",\"defaultMenu\":false,\"closeTab\":false,\"keepAlive\":false},\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (31, '2022-08-09 13:49:23.932', '2022-08-09 13:49:23.932', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 20935777,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (32, '2022-08-09 13:49:43.665', '2022-08-09 13:49:43.665', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 22333434,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-08T21:28:06.419+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":0,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:49:23.92+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (33, '2022-08-09 13:49:45.688', '2022-08-09 13:49:45.688', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 21547142,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-08T21:28:06.419+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":0,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:49:23.92+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (34, '2022-08-09 13:50:10.255', '2022-08-09 13:50:10.255', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 15043276,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-08T21:28:06.419+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (35, '2022-08-09 13:50:20.146', '2022-08-09 13:50:20.146', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 12855573,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:49:23.92+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (36, '2022-08-09 16:01:07.603', '2022-08-09 16:01:07.603', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200,
        9649457,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":0,\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":\"\",\"parentId\":\"0\",\"component\":\"view/routerHolder.vue\",\"meta\":{\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"defaultMenu\":false,\"closeTab\":false,\"keepAlive\":false},\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (37, '2022-08-09 16:01:15.066', '2022-08-09 16:01:15.066', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 12894473,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (38, '2022-08-09 16:01:44.544', '2022-08-09 16:01:44.544', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 27402568,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":22,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"https://www.gin-vue-admin.com\",\"name\":\"https://www.gin-vue-admin.com\",\"hidden\":false,\"component\":\"/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"官方网站\",\"icon\":\"home-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:10.247+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":3,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:01:15.059+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":27,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"plugin\",\"name\":\"plugin\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件系统\",\"icon\":\"cherry\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":9,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":23,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":8,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":2,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":9,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":888}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (39, '2022-08-09 16:01:47.178', '2022-08-09 16:01:47.178', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 32477598,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":888,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/setSelfInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/user/resetPassword\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/findFile\",\"method\":\"GET\"},{\"path\":\"/fileUploadAndDownload/breakpointContinue\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/breakpointContinueFinish\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/removeChunk\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/createPlug\",\"method\":\"POST\"},{\"path\":\"/autoCode/installPlugin\",\"method\":\"POST\"},{\"path\":\"/autoCode/createPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/delPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/excel/importExcel\",\"method\":\"POST\"},{\"path\":\"/excel/loadExcel\",\"method\":\"GET\"},{\"path\":\"/excel/exportExcel\",\"method\":\"POST\"},{\"path\":\"/excel/downloadTemplate\",\"method\":\"GET\"},{\"path\":\"/authorityBtn/setAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/getAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/canRemoveAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (40, '2022-08-09 16:16:23.627', '2022-08-09 16:16:23.627', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 14951245,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:01:15.059+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (41, '2022-08-09 16:25:32.040', '2022-08-09 16:25:32.040', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 26653003,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:10.247+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:20.14+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:16:23.619+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (42, '2022-08-09 18:17:26.254', '2022-08-09 18:17:26.254', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200,
        7866918,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":0,\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":\"\",\"parentId\":\"0\",\"component\":\"view/saasInstance/saasInstance.go\",\"meta\":{\"title\":\"数据库实例\",\"icon\":\"coin\",\"defaultMenu\":false,\"closeTab\":false,\"keepAlive\":false},\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (43, '2022-08-09 18:17:37.487', '2022-08-09 18:17:37.487', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 17878145,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.go\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (44, '2022-08-09 18:17:58.080', '2022-08-09 18:17:58.080', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 19827220,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:10.247+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:17:37.48+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.go\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:17:37.48+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.go\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:20.14+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:16:23.619+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (45, '2022-08-09 18:18:03.037', '2022-08-09 18:18:03.037', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 26552222,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":22,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"https://www.gin-vue-admin.com\",\"name\":\"https://www.gin-vue-admin.com\",\"hidden\":false,\"component\":\"/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"官方网站\",\"icon\":\"home-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:10.247+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:17:37.48+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.go\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:17:37.48+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.go\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:16:23.619+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":3,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":27,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"plugin\",\"name\":\"plugin\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件系统\",\"icon\":\"cherry\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":9,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":23,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":8,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":2,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":9,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":888}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (46, '2022-08-09 18:18:17.375', '2022-08-09 18:18:17.375', NULL, '127.0.0.1', 'POST', '/menu/deleteBaseMenu',
        200, 38864074,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '', '{\"ID\":22}', '{\"code\":0,\"data\":{},\"msg\":\"删除成功\"}', 1),
       (47, '2022-08-09 18:18:54.535', '2022-08-09 18:18:54.535', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 15797096,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:17:37.48+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.go\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (48, '2022-08-09 18:19:16.752', '2022-08-09 18:19:16.752', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 11538263,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:10.247+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库集群管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (49, '2022-08-09 18:19:32.861', '2022-08-09 18:19:32.861', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 17126017,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:16.746+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (50, '2022-08-09 18:19:39.897', '2022-08-09 18:19:39.897', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 14489934,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-08T21:27:44.825+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (51, '2022-08-09 18:19:47.197', '2022-08-09 18:19:47.197', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 11408279,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:39.89+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (52, '2022-08-09 18:20:15.849', '2022-08-09 18:20:15.849', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 16173082,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:18:54.528+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (53, '2022-08-09 18:24:06.736', '2022-08-09 18:24:06.736', NULL, '127.0.0.1', 'POST',
        '/saas_instance/createInstance', 200, 7640231,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"insId\":100,\"projId\":1000,\"ip\":\"10.166.10.1\",\"port\":3306,\"version\":\"5.7.36\",\"application\":\"mysql\",\"useType\":\"正式\",\"health\":\"available\"}',
        '{\"code\":7,\"data\":{},\"msg\":\"创建失败\"}', 3),
       (54, '2022-08-09 18:27:38.650', '2022-08-09 18:27:38.650', NULL, '127.0.0.1', 'POST',
        '/saas_instance/createInstance', 200, 7804105,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"insId\":100,\"projId\":1000,\"ip\":\"127.0.0.1\",\"port\":3306,\"version\":\"5.7.36\",\"level\":\"3\",\"application\":\"mysql\",\"useType\":\"正式\",\"health\":\"available\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (55, '2022-08-09 18:28:08.428', '2022-08-09 18:28:08.428', NULL, '127.0.0.1', 'POST',
        '/saas_instance/createInstance', 200, 7371135,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"insId\":101,\"projId\":1000,\"ip\":\"127.0.0.1\",\"port\":3307,\"version\":\"5.7.36\",\"application\":\"mysql\",\"useType\":\"正式\",\"level\":\"3\",\"health\":\"available\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (56, '2022-08-10 12:03:00.791', '2022-08-10 12:03:00.791', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200,
        8451184,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"ID\":0,\"path\":\"project\",\"name\":\"project\",\"hidden\":\"\",\"parentId\":\"0\",\"component\":\"view/saasProject/saasProject.vue\",\"meta\":{\"title\":\"项目管理\",\"icon\":\"chat-line-round\",\"defaultMenu\":false,\"keepAlive\":\"\"},\"sort\":3}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (57, '2022-08-10 12:03:11.403', '2022-08-10 12:03:11.403', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 28320865,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:32.852+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:20.14+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:16:23.619+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":37,\"CreatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"UpdatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"parentId\":\"0\",\"path\":\"project\",\"name\":\"project\",\"hidden\":false,\"component\":\"view/saasProject/saasProject.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"项目管理\",\"icon\":\"chat-line-round\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (58, '2022-08-10 12:03:17.752', '2022-08-10 12:03:17.752', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 29108964,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"},{\"path\":\"/priject/createProject\",\"method\":\"POST\"},{\"path\":\"/priject/deleteProject\",\"method\":\"DELETE\"},{\"path\":\"/priject/deleteProjectByIds\",\"method\":\"DELETE\"},{\"path\":\"/priject/updateProject\",\"method\":\"PUT\"},{\"path\":\"/priject/findProject\",\"method\":\"GET\"},{\"path\":\"/priject/getProjectList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (59, '2022-08-10 12:03:29.782', '2022-08-10 12:03:29.782', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 25119927,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:32.852+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:20.14+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:16:23.619+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":37,\"CreatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"UpdatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"parentId\":\"0\",\"path\":\"project\",\"name\":\"project\",\"hidden\":false,\"component\":\"view/saasProject/saasProject.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"项目管理\",\"icon\":\"chat-line-round\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":3,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":27,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"plugin\",\"name\":\"plugin\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件系统\",\"icon\":\"cherry\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":9,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":23,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":8,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":2,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":9,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":888}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (60, '2022-08-10 12:03:33.032', '2022-08-10 12:03:33.032', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 28290187,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":888,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/setSelfInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/user/resetPassword\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/findFile\",\"method\":\"GET\"},{\"path\":\"/fileUploadAndDownload/breakpointContinue\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/breakpointContinueFinish\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/removeChunk\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/createPlug\",\"method\":\"POST\"},{\"path\":\"/autoCode/installPlugin\",\"method\":\"POST\"},{\"path\":\"/autoCode/createPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/delPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/excel/importExcel\",\"method\":\"POST\"},{\"path\":\"/excel/loadExcel\",\"method\":\"GET\"},{\"path\":\"/excel/exportExcel\",\"method\":\"POST\"},{\"path\":\"/excel/downloadTemplate\",\"method\":\"GET\"},{\"path\":\"/authorityBtn/setAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/getAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/canRemoveAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"},{\"path\":\"/priject/createProject\",\"method\":\"POST\"},{\"path\":\"/priject/deleteProject\",\"method\":\"DELETE\"},{\"path\":\"/priject/deleteProjectByIds\",\"method\":\"DELETE\"},{\"path\":\"/priject/updateProject\",\"method\":\"PUT\"},{\"path\":\"/priject/findProject\",\"method\":\"GET\"},{\"path\":\"/priject/getProjectList\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (61, '2022-08-10 12:04:03.468', '2022-08-10 12:04:03.468', NULL, '127.0.0.1', 'POST', '/priject/createProject',
        200, 7531138,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"projId\":100,\"projName\":\"测试项目组\",\"notifyUsers\":\"\",\"alarmGroupId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (62, '2022-08-10 12:04:14.229', '2022-08-10 12:04:14.229', NULL, '127.0.0.1', 'PUT', '/priject/updateProject',
        200, 5491781,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-10T12:04:03.46+08:00\",\"UpdatedAt\":\"2022-08-10T12:04:03.46+08:00\",\"projId\":100,\"projName\":\"测试项目组\",\"notifyUsers\":\"\",\"alarmGroupId\":\"\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (63, '2022-08-10 12:05:14.876', '2022-08-10 12:05:14.876', NULL, '127.0.0.1', 'PUT', '/priject/updateProject',
        200, 8125226,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-10T12:04:03.46+08:00\",\"UpdatedAt\":\"2022-08-10T12:04:14.224+08:00\",\"projId\":1000,\"projName\":\"测试项目组\",\"notifyUsers\":\"\",\"alarmGroupId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (64, '2022-08-10 12:07:47.976', '2022-08-10 12:07:47.976', NULL, '127.0.0.1', 'POST', '/domain/createDomain',
        200, 8325349,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"domainId\":101,\"domainName\":\"testdomain\",\"projId\":1000}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (65, '2022-08-10 12:12:25.257', '2022-08-10 12:12:25.257', NULL, '127.0.0.1', 'PUT',
        '/saas_instance/updateInstance', 200, 5522911,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-09T18:27:38.643+08:00\",\"UpdatedAt\":\"2022-08-09T18:27:38.643+08:00\",\"insId\":100,\"hostId\":null,\"projId\":1000,\"domainId\":1,\"ip\":\"127.0.0.1\",\"port\":3306,\"application\":\"mysql\",\"version\":\"5.7.36\",\"useType\":\"正式\",\"health\":\"available\",\"level\":\"3\",\"feature\":null,\"auth\":null}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (66, '2022-08-10 12:12:30.235', '2022-08-10 12:12:30.235', NULL, '127.0.0.1', 'PUT',
        '/saas_instance/updateInstance', 200, 11510365,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-09T18:28:08.42+08:00\",\"UpdatedAt\":\"2022-08-09T18:28:08.42+08:00\",\"insId\":101,\"hostId\":null,\"projId\":1000,\"domainId\":1,\"ip\":\"127.0.0.1\",\"port\":3307,\"application\":\"mysql\",\"version\":\"5.7.36\",\"useType\":\"正式\",\"health\":\"available\",\"level\":\"3\",\"feature\":null,\"auth\":null}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (67, '2022-08-10 12:12:43.949', '2022-08-10 12:12:43.949', NULL, '127.0.0.1', 'PUT',
        '/saas_instance/updateInstance', 200, 8384319,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-09T18:27:38.643+08:00\",\"UpdatedAt\":\"2022-08-10T12:12:25.252+08:00\",\"insId\":100,\"hostId\":null,\"projId\":1000,\"domainId\":101,\"ip\":\"127.0.0.1\",\"port\":3306,\"application\":\"mysql\",\"version\":\"5.7.36\",\"useType\":\"正式\",\"health\":\"available\",\"level\":\"3\",\"feature\":null,\"auth\":null}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (68, '2022-08-10 12:12:54.427', '2022-08-10 12:12:54.427', NULL, '127.0.0.1', 'PUT',
        '/saas_instance/updateInstance', 200, 5834278,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-09T18:28:08.42+08:00\",\"UpdatedAt\":\"2022-08-10T12:12:30.224+08:00\",\"insId\":101,\"hostId\":null,\"projId\":1000,\"domainId\":101,\"ip\":\"127.0.0.1\",\"port\":3307,\"application\":\"mysql\",\"version\":\"5.7.36\",\"useType\":\"正式\",\"health\":\"available\",\"level\":\"3\",\"feature\":null,\"auth\":null}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (69, '2022-08-10 14:08:44.764', '2022-08-10 14:08:44.764', NULL, '127.0.0.1', 'PUT', '/priject/updateProject',
        200, 8332269,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-10T12:04:03.46+08:00\",\"UpdatedAt\":\"2022-08-10T12:05:14.868+08:00\",\"projId\":1000,\"projName\":\"测试项目组A\",\"notifyUsers\":\"\",\"alarmGroupId\":0,\"domain_list\":null}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (70, '2022-08-10 14:27:08.601', '2022-08-10 14:27:08.601', NULL, '127.0.0.1', 'PUT', '/priject/updateProject',
        200, 9541362,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-10T12:04:03.46+08:00\",\"UpdatedAt\":\"2022-08-10T14:08:44.756+08:00\",\"projId\":1000,\"projName\":\"wenwuzu\",\"notifyUsers\":\"\",\"alarmGroupId\":0,\"domain_list\":null}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (71, '2022-08-10 14:30:39.134', '2022-08-10 14:30:39.134', NULL, '127.0.0.1', 'POST', '/domain/createDomain',
        200, 7634194,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"domainId\":102,\"domainName\":\"test\",\"projId\":1000,\"projName\":\"\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (72, '2022-08-10 14:31:48.167', '2022-08-10 14:31:48.167', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 3102177,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":0}', '{\"code\":7,\"data\":{},\"msg\":\"删除失败\"}', 3),
       (73, '2022-08-10 14:45:50.185', '2022-08-10 14:45:50.185', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 2011127,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
        '', '{\"ID\":0}', '{\"code\":7,\"data\":{},\"msg\":\"删除失败\"}', 1),
       (74, '2022-08-10 14:46:31.809', '2022-08-10 14:46:31.809', NULL, '127.0.0.1', 'POST', '/priject/createProject',
        200, 6327799,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"projId\":100,\"projName\":\"test\",\"notifyUsers\":\"\",\"alarmGroupId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (75, '2022-08-10 14:53:56.017', '2022-08-10 14:53:56.017', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 2096954,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":0}', '{\"code\":7,\"data\":{},\"msg\":\"删除失败\"}', 3),
       (76, '2022-08-10 14:56:16.523', '2022-08-10 14:56:16.523', NULL, '127.0.0.1', 'PUT', '/priject/updateProject',
        200, 5492747,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-10T14:46:31.803+08:00\",\"UpdatedAt\":\"2022-08-10T14:46:31.803+08:00\",\"projId\":1000,\"projName\":\"test\",\"notifyUsers\":\"\",\"alarmGroupId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (77, '2022-08-10 14:56:30.630', '2022-08-10 14:56:30.630', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        7131149,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-10T12:07:47.968+08:00\",\"UpdatedAt\":\"2022-08-10T12:07:47.968+08:00\",\"domainId\":100,\"domainName\":\"testdomain\",\"projId\":1000,\"insId\":111}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (78, '2022-08-10 14:56:46.131', '2022-08-10 14:56:46.131', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        6096837,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-10T12:07:47.968+08:00\",\"UpdatedAt\":\"2022-08-10T14:56:30.623+08:00\",\"domainId\":101,\"domainName\":\"testdomain\",\"projId\":1000,\"insId\":100}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (79, '2022-08-10 14:57:14.052', '2022-08-10 14:57:14.052', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        6339751,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-10T12:07:47.968+08:00\",\"UpdatedAt\":\"2022-08-10T14:56:46.125+08:00\",\"domainId\":101,\"domainName\":\"testdomain\",\"projId\":1000}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (80, '2022-08-10 14:57:19.135', '2022-08-10 14:57:19.135', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        5151822,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-10T12:07:47.968+08:00\",\"UpdatedAt\":\"2022-08-10T14:57:14.046+08:00\",\"domainId\":101,\"domainName\":\"testdomain\",\"projId\":1000}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (81, '2022-08-10 14:57:22.887', '2022-08-10 14:57:22.887', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        7785112,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-10T12:07:47.968+08:00\",\"UpdatedAt\":\"2022-08-10T14:57:19.13+08:00\",\"domainId\":101,\"domainName\":\"testdomain\",\"projId\":1000}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (82, '2022-08-10 15:00:46.699', '2022-08-10 15:00:46.699', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 2558492,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":0}', '{\"code\":7,\"data\":{},\"msg\":\"删除失败\"}', 3),
       (83, '2022-08-10 15:46:38.732', '2022-08-10 15:46:38.732', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 11392364,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":3}', '{\"code\":0,\"data\":{},\"msg\":\"删除成功\"}', 3),
       (84, '2022-08-10 15:46:41.070', '2022-08-10 15:46:41.070', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 5607672,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":3}', '{\"code\":0,\"data\":{},\"msg\":\"删除成功\"}', 3),
       (85, '2022-08-10 15:46:44.742', '2022-08-10 15:46:44.742', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 5761475,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":3}', '{\"code\":0,\"data\":{},\"msg\":\"删除成功\"}', 3),
       (86, '2022-08-10 15:46:46.502', '2022-08-10 15:46:46.502', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 4576359,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":3}', '{\"code\":0,\"data\":{},\"msg\":\"删除成功\"}', 3),
       (87, '2022-08-10 15:46:48.016', '2022-08-10 15:46:48.016', NULL, '127.0.0.1', 'DELETE', '/domain/deleteDomain',
        200, 4834762,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"ID\":3}', '{\"code\":0,\"data\":{},\"msg\":\"删除成功\"}', 3),
       (88, '2022-08-10 15:50:49.798', '2022-08-10 15:50:49.798', NULL, '127.0.0.1', 'POST', '/priject/createProject',
        200, 8567312,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"projId\":1001,\"projName\":\"DBA组测试用例\",\"notifyUsers\":\"\",\"alarmGroupId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3),
       (89, '2022-08-10 15:51:04.660', '2022-08-10 15:51:04.660', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        7145441,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":2,\"CreatedAt\":\"2022-08-10T12:07:47.968+08:00\",\"UpdatedAt\":\"2022-08-10T14:57:22.88+08:00\",\"domainId\":101,\"domainName\":\"testdomain\",\"projId\":1001,\"insId\":1}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (90, '2022-08-10 15:52:50.824', '2022-08-10 15:52:50.824', NULL, '127.0.0.1', 'POST', '/domain/createDomain',
        200, 9242140,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '', '{\"domainId\":1000,\"domainName\":\"aaa\",\"projId\":1000}', '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',
        3),
       (91, '2022-08-10 15:54:14.880', '2022-08-10 15:54:14.880', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        8792990,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":4,\"CreatedAt\":\"2022-08-10T15:52:50.815+08:00\",\"UpdatedAt\":\"2022-08-10T15:52:50.815+08:00\",\"domainId\":1000,\"domainName\":\"aaa\",\"projId\":1001}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (92, '2022-08-10 15:59:17.543', '2022-08-10 15:59:17.543', NULL, '127.0.0.1', 'PUT', '/domain/updateDomain', 200,
        8019816,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":4,\"CreatedAt\":\"2022-08-10T15:52:50.815+08:00\",\"UpdatedAt\":\"2022-08-10T15:54:14.872+08:00\",\"domainId\":1000,\"domainName\":\"aaa\",\"projId\":1000}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (93, '2022-08-10 15:59:30.105', '2022-08-10 15:59:30.105', NULL, '127.0.0.1', 'PUT', '/priject/updateProject',
        200, 7390722,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"CreatedAt\":\"2022-08-10T14:46:31.803+08:00\",\"UpdatedAt\":\"2022-08-10T14:56:16.518+08:00\",\"projId\":1000,\"projName\":\"DBA\",\"notifyUsers\":\"\",\"alarmGroupId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 3),
       (94, '2022-08-12 16:13:36.188', '2022-08-12 16:13:36.188', NULL, '127.0.0.1', 'POST', '/priject/createProject',
        200, 7761632,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '{\"ID\":100,\"projName\":\"100\",\"notifyUsers\":\"\",\"alarmGroupId\":0}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 1),
       (95, '2022-08-12 16:13:45.450', '2022-08-12 16:13:45.450', NULL, '127.0.0.1', 'POST', '/domain/createDomain',
        200, 23025969,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '{\"ID\":100,\"domainName\":\"test\",\"projId\":100,\"projName\":\"\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 1),
       (96, '2022-08-18 21:53:07.373', '2022-08-18 21:53:07.373', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201018886,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[35.00000000218279,4.999999999818101,26.315789472978786,4.999999999818101,26.315789472978786,5.000000000545697,21.052631579148915,9.52380952438698],\"cores\":4},\"ram\":{\"usedMb\":11094,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115112,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (97, '2022-08-18 21:53:17.372', '2022-08-18 21:53:17.372', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 200742243,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[26.315789472978786,0,21.052631577536516,4.761904761646969,15.789473685319052,0,15.789473684613625,0],\"cores\":4},\"ram\":{\"usedMb\":11083,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115112,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (98, '2022-08-18 21:53:18.645', '2022-08-18 21:53:18.645', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 200901332,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[42.857142857142854,4.761904761863515,39.99999999854481,9.523809523510483,38.88888888709236,9.523809523953888,31.578947366808652,0],\"cores\":4},\"ram\":{\"usedMb\":11098,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (99, '2022-08-18 21:53:20.322', '2022-08-18 21:53:20.322', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201740122,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[38.09523809581555,4.999999999590727,29.999999997089617,0,28.57142857142857,0,23.809523808451388,4.761904761976944],\"cores\":4},\"ram\":{\"usedMb\":11091,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (100, '2022-08-18 21:53:21.684', '2022-08-18 21:53:21.684', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201586366,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[40.00000000145519,4.999999999954525,40.00000000145519,4.999999999590727,34.9999999996362,0,30.000000001091394,4.761904761863515],\"cores\":4},\"ram\":{\"usedMb\":11096,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (101, '2022-08-18 21:53:22.752', '2022-08-18 21:53:22.752', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201234520,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[35.0000000003638,4.999999999954525,24.99999999818101,0,27.272727271374304,5.000000000181899,25.000000000909495,0],\"cores\":4},\"ram\":{\"usedMb\":11076,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (102, '2022-08-18 21:53:23.945', '2022-08-18 21:53:23.945', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 202061061,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[25.00000000181899,4.761904761976944,19.04761904613416,0,19.999999998908606,0,19.04761904745406,0],\"cores\":4},\"ram\":{\"usedMb\":11072,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (103, '2022-08-18 21:53:24.982', '2022-08-18 21:53:24.982', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 202260696,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[26.315789472978786,5.000000000545697,21.052631577234195,0,28.57142857316094,4.76190476219349,20.000000000727596,4.761904761863515],\"cores\":4},\"ram\":{\"usedMb\":11063,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (104, '2022-08-18 21:53:26.080', '2022-08-18 21:53:26.080', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201152611,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[25.00000000181899,0,23.809523808451388,0,14.999999998544808,0,15.000000000545697,0],\"cores\":4},\"ram\":{\"usedMb\":11065,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (105, '2022-08-18 21:53:27.056', '2022-08-18 21:53:27.056', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 203295048,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[39.99999999854481,0,39.99999999854481,4.761904761863515,25,0,25,4.761904761863515],\"cores\":4},\"ram\":{\"usedMb\":11067,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (106, '2022-08-18 21:53:37.016', '2022-08-18 21:53:37.016', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 200412571,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[10.000000000363798,0,10.000000000363798,0,5.0000000014551915,0,9.52380952372703,0],\"cores\":4},\"ram\":{\"usedMb\":11033,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (107, '2022-08-18 21:53:47.014', '2022-08-18 21:53:47.014', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201080388,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[19.04761904745406,0,15.000000000363798,0,4.999999999272404,0,13.63636363658913,0],\"cores\":4},\"ram\":{\"usedMb\":11013,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (108, '2022-08-18 21:53:57.014', '2022-08-18 21:53:57.014', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201238738,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[10.526315789574458,0,4.999999998908606,0,13.636363636664296,0,5.000000000181899,0],\"cores\":4},\"ram\":{\"usedMb\":11024,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (109, '2022-08-18 21:54:07.016', '2022-08-18 21:54:07.016', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201391302,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[14.999999998544808,0,10.000000000363798,0,9.999999999636202,0,5.000000000545697,0],\"cores\":4},\"ram\":{\"usedMb\":11052,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (110, '2022-08-18 21:54:17.014', '2022-08-18 21:54:17.014', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 200973744,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[9.999999998544808,0,4.999999999636202,0,0,0,0,0],\"cores\":4},\"ram\":{\"usedMb\":11056,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (111, '2022-08-18 21:54:27.013', '2022-08-18 21:54:27.013', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201191113,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[9.999999998544808,0,9.523809525046932,0,4.999999999272404,0,0,0],\"cores\":4},\"ram\":{\"usedMb\":11057,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (112, '2022-08-18 21:54:37.013', '2022-08-18 21:54:37.013', NULL, '127.0.0.1', 'POST', '/system/getServerInfo',
        200, 201035337,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"server\":{\"os\":{\"goos\":\"darwin\",\"numCpu\":8,\"compiler\":\"gc\",\"goVersion\":\"go1.17.2\",\"numGoroutine\":11},\"cpu\":{\"cpus\":[10.526315791489186,0,5.263157895744593,0,5.000000001091394,0,5.000000000181899,0],\"cores\":4},\"ram\":{\"usedMb\":11026,\"totalMb\":16384,\"usedPercent\":67},\"disk\":{\"usedMb\":115114,\"usedGb\":112,\"totalMb\":239072,\"totalGb\":233,\"usedPercent\":48}}},\"msg\":\"获取成功\"}',
        1),
       (113, '2022-08-25 19:22:40.333', '2022-08-25 19:22:40.333', NULL, '127.0.0.1', 'POST', '/api/createApi', 200,
        11976405,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"path\":\"/insprocesslist/showinsprocesslist\",\"apiGroup\":\"/insprocesslist\",\"method\":\"GET\",\"description\":\"对mysql实例进行show processlist操作\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 1),
       (114, '2022-08-25 19:23:03.173', '2022-08-25 19:23:03.173', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 38196666,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":888,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/setSelfInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/user/resetPassword\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/findFile\",\"method\":\"GET\"},{\"path\":\"/fileUploadAndDownload/breakpointContinue\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/breakpointContinueFinish\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/removeChunk\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/createPlug\",\"method\":\"POST\"},{\"path\":\"/autoCode/installPlugin\",\"method\":\"POST\"},{\"path\":\"/autoCode/createPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/delPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/excel/importExcel\",\"method\":\"POST\"},{\"path\":\"/excel/loadExcel\",\"method\":\"GET\"},{\"path\":\"/excel/exportExcel\",\"method\":\"POST\"},{\"path\":\"/excel/downloadTemplate\",\"method\":\"GET\"},{\"path\":\"/authorityBtn/setAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/getAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/canRemoveAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"},{\"path\":\"/priject/createProject\",\"method\":\"POST\"},{\"path\":\"/priject/deleteProject\",\"method\":\"DELETE\"},{\"path\":\"/priject/deleteProjectByIds\",\"method\":\"DELETE\"},{\"path\":\"/priject/updateProject\",\"method\":\"PUT\"},{\"path\":\"/priject/findProject\",\"method\":\"GET\"},{\"path\":\"/priject/getProjectList\",\"method\":\"GET\"},{\"path\":\"/BackupLog/createBackLog\",\"method\":\"POST\"},{\"path\":\"/BackupLog/deleteBackLog\",\"method\":\"DELETE\"},{\"path\":\"/BackupLog/deleteBackLogByIds\",\"method\":\"DELETE\"},{\"path\":\"/BackupLog/updateBackLog\",\"method\":\"PUT\"},{\"path\":\"/BackupLog/findBackLog\",\"method\":\"GET\"},{\"path\":\"/BackupLog/getBackLogList\",\"method\":\"GET\"},{\"path\":\"/insprocesslist/showinsprocesslist\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (115, '2022-08-25 19:23:22.828', '2022-08-25 19:23:22.828', NULL, '127.0.0.1', 'POST', '/casbin/updateCasbin',
        200, 23893293,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"authorityId\":8881,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/saas_instance/createInstance\",\"method\":\"POST\"},{\"path\":\"/saas_instance/deleteInstance\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/deleteInstanceByIds\",\"method\":\"DELETE\"},{\"path\":\"/saas_instance/updateInstance\",\"method\":\"PUT\"},{\"path\":\"/saas_instance/findInstance\",\"method\":\"GET\"},{\"path\":\"/saas_instance/getInstanceList\",\"method\":\"GET\"},{\"path\":\"/host/createHost\",\"method\":\"POST\"},{\"path\":\"/host/deleteHost\",\"method\":\"DELETE\"},{\"path\":\"/host/deleteHostByIds\",\"method\":\"DELETE\"},{\"path\":\"/host/updateHost\",\"method\":\"PUT\"},{\"path\":\"/host/findHost\",\"method\":\"GET\"},{\"path\":\"/host/getHostList\",\"method\":\"GET\"},{\"path\":\"/domain/createDomain\",\"method\":\"POST\"},{\"path\":\"/domain/deleteDomain\",\"method\":\"DELETE\"},{\"path\":\"/domain/deleteDomainByIds\",\"method\":\"DELETE\"},{\"path\":\"/domain/updateDomain\",\"method\":\"PUT\"},{\"path\":\"/domain/findDomain\",\"method\":\"GET\"},{\"path\":\"/domain/getDomainList\",\"method\":\"GET\"},{\"path\":\"/priject/createProject\",\"method\":\"POST\"},{\"path\":\"/priject/deleteProject\",\"method\":\"DELETE\"},{\"path\":\"/priject/deleteProjectByIds\",\"method\":\"DELETE\"},{\"path\":\"/priject/updateProject\",\"method\":\"PUT\"},{\"path\":\"/priject/findProject\",\"method\":\"GET\"},{\"path\":\"/priject/getProjectList\",\"method\":\"GET\"},{\"path\":\"/BackupLog/createBackLog\",\"method\":\"POST\"},{\"path\":\"/BackupLog/deleteBackLog\",\"method\":\"DELETE\"},{\"path\":\"/BackupLog/deleteBackLogByIds\",\"method\":\"DELETE\"},{\"path\":\"/BackupLog/updateBackLog\",\"method\":\"PUT\"},{\"path\":\"/BackupLog/findBackLog\",\"method\":\"GET\"},{\"path\":\"/BackupLog/getBackLogList\",\"method\":\"GET\"},{\"path\":\"/insprocesslist/showinsprocesslist\",\"method\":\"GET\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (116, '2022-08-25 19:23:31.102', '2022-08-25 19:23:31.102', NULL, '127.0.0.1', 'POST', '/api/getApiById', 200,
        1974288,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '{\"id\":124}',
        '{\"code\":0,\"data\":{\"api\":{\"ID\":124,\"CreatedAt\":\"2022-08-25T19:22:40.326+08:00\",\"UpdatedAt\":\"2022-08-25T19:22:40.326+08:00\",\"path\":\"/insprocesslist/showinsprocesslist\",\"description\":\"对mysql实例进行show processlist操作\",\"apiGroup\":\"/insprocesslist\",\"method\":\"GET\"}},\"msg\":\"获取成功\"}',
        1),
       (117, '2022-08-25 19:23:38.630', '2022-08-25 19:23:38.630', NULL, '127.0.0.1', 'POST', '/api/updateApi', 200,
        14648111,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"ID\":124,\"CreatedAt\":\"2022-08-25T19:22:40.326+08:00\",\"UpdatedAt\":\"2022-08-25T19:22:40.326+08:00\",\"path\":\"/insprocesslist/showinsprocesslist\",\"description\":\"对mysql实例进行show processlist操作\",\"apiGroup\":\"insprocesslist\",\"method\":\"GET\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"修改成功\"}', 1),
       (118, '2022-08-25 19:45:16.047', '2022-08-25 19:45:16.047', NULL, '127.0.0.1', 'POST', '/system/getSystemConfig',
        200, 4487551,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '',
        '{\"code\":0,\"data\":{\"config\":{\"jwt\":{\"signing-key\":\"06156bc0-22cf-4ebc-90a1-e4fec27029fb\",\"expires-time\":604800,\"buffer-time\":86400,\"issuer\":\"qmPlus\"},\"zap\":{\"level\":\"info\",\"prefix\":\"[github.com/flipped-aurora/gin-vue-admin/server]\",\"format\":\"console\",\"director\":\"log\",\"encode-level\":\"LowercaseColorLevelEncoder\",\"stacktrace-key\":\"stacktrace\",\"max-age\":30,\"show-line\":true,\"log-in-console\":true},\"redis\":{\"db\":0,\"addr\":\"127.0.0.1:6379\",\"password\":\"\"},\"email\":{\"to\":\"xxx@qq.com\",\"port\":465,\"from\":\"xxx@163.com\",\"host\":\"smtp.163.com\",\"is-ssl\":true,\"secret\":\"xxx\",\"nickname\":\"test\"},\"system\":{\"env\":\"public\",\"addr\":8888,\"db-type\":\"mysql\",\"oss-type\":\"local\",\"use-multipoint\":false,\"use-redis\":false,\"iplimit-count\":15000,\"iplimit-time\":3600},\"captcha\":{\"key-long\":6,\"img-width\":240,\"img-height\":80},\"autocode\":{\"transfer-restart\":true,\"root\":\"/Users/anderalex/go/src/gin-vue-admin\",\"server\":\"/server\",\"server-api\":\"/api/v1/%s\",\"server-plug\":\"/plugin/%s\",\"server-initialize\":\"/initialize\",\"server-model\":\"/model/%s\",\"server-request\":\"/model/%s/request/\",\"server-router\":\"/router/%s\",\"server-service\":\"/service/%s\",\"web\":\"/web/src\",\"web-api\":\"/api\",\"web-form\":\"/view\",\"web-table\":\"/view\"},\"mysql\":{\"path\":\"127.0.0.1\",\"port\":\"3307\",\"config\":\"charset=utf8mb4\\u0026parseTime=True\\u0026loc=Local\",\"db-name\":\"saasdb\",\"username\":\"root\",\"password\":\"letsg0\",\"max-idle-conns\":10,\"max-open-conns\":100,\"log-mode\":\"error\",\"log-zap\":false},\"pgsql\":{\"path\":\"\",\"port\":\"\",\"config\":\"\",\"db-name\":\"\",\"username\":\"\",\"password\":\"\",\"max-idle-conns\":10,\"max-open-conns\":100,\"log-mode\":\"\",\"log-zap\":false},\"db-list\":[{\"disable\":false,\"type\":\"\",\"alias-name\":\"\",\"path\":\"\",\"port\":\"\",\"config\":\"\",\"db-name\":\"\",\"username\":\"\",\"password\":\"\",\"max-idle-conns\":10,\"max-open-conns\":100,\"log-mode\":\"\",\"log-zap\":false}],\"local\":{\"path\":\"uploads/file\",\"store-path\":\"uploads/file\"},\"qiniu\":{\"zone\":\"ZoneHuaDong\",\"bucket\":\"\",\"img-path\":\"\",\"use-https\":false,\"access-key\":\"\",\"secret-key\":\"\",\"use-cdn-domains\":false},\"aliyun-oss\":{\"endpoint\":\"yourEndpoint\",\"access-key-id\":\"yourAccessKeyId\",\"access-key-secret\":\"yourAccessKeySecret\",\"bucket-name\":\"yourBucketName\",\"bucket-url\":\"yourBucketUrl\",\"base-path\":\"yourBasePath\"},\"hua-wei-obs\":{\"path\":\"you-path\",\"bucket\":\"you-bucket\",\"endpoint\":\"you-endpoint\",\"access-key\":\"you-access-key\",\"secret-key\":\"you-secret-key\"},\"tencent-cos\":{\"bucket\":\"xxxxx-10005608\",\"region\":\"ap-shanghai\",\"secret-id\":\"xxxxxxxx\",\"secret-key\":\"xxxxxxxx\",\"base-url\":\"https://gin.vue.admin\",\"path-prefix\":\"github.com/flipped-aurora/gin-vue-admin/server\"},\"aws-s3\":{\"bucket\":\"xxxxx-10005608\",\"region\":\"ap-shanghai\",\"endpoint\":\"\",\"s3-force-path-style\":false,\"disable-ssl\":false,\"secret-id\":\"xxxxxxxx\",\"secret-key\":\"xxxxxxxx\",\"base-url\":\"https://gin.vue.admin\",\"path-prefix\":\"github.com/flipped-aurora/gin-vue-admin/server\"},\"excel\":{\"dir\":\"./resource/excel/\"},\"timer\":{\"start\":true,\"spec\":\"@daily\",\"with_seconds\":false,\"detail\":[{\"tableName\":\"sys_operation_records\",\"compareField\":\"created_at\",\"interval\":\"2160h\"},{\"tableName\":\"jwt_blacklists\",\"compareField\":\"created_at\",\"interval\":\"168h\"}]},\"cors\":{\"mode\":\"whitelist\",\"whitelist\":[{\"allow-origin\":\"example1.com\",\"allow-methods\":\"GET, POST\",\"allow-headers\":\"content-type\",\"expose-headers\":\"Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Content-Type\",\"allow-credentials\":true},{\"allow-origin\":\"example2.com\",\"allow-methods\":\"GET, POST\",\"allow-headers\":\"content-type\",\"expose-headers\":\"Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Content-Type\",\"allow-credentials\":true}]},\"grpcServer\":{\"grpcServerListenPort\":21080,\"grpcMySQLMangerUser\":\"saasmanager\",\"grpcMySQLMangerPassword\":\"saasmanager\",\"grpcCA\":\"/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/cerify/server.crt\",\"grpcKey\":\"/Users/anderalex/go/src/gin-vue-admin/server/service/saasdb/cerify/server.key\",\"grpcWebUrl\":\"example.server.com\"}}},\"msg\":\"获取成功\"}',
        1),
       (119, '2022-08-25 19:48:30.934', '2022-08-25 19:48:30.934', NULL, '127.0.0.1', 'POST', '/menu/addBaseMenu', 200,
        16936266,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"ID\":0,\"path\":\"showinsprocesslist\",\"name\":\"showinsprocesslist\",\"hidden\":\"\",\"parentId\":\"0\",\"component\":\"view/saasInsShowProcesslist/saasInsShowProcesslist.vue\",\"meta\":{\"title\":\"showprocesslist\",\"icon\":\"aim\",\"defaultMenu\":false,\"keepAlive\":\"\"},\"parameters\":[{\"type\":\"query\",\"key\":\"vm\",\"value\":\"127.0.0.1\"},{\"type\":\"query\",\"key\":\"vm_mysql_host\",\"value\":\"127.0.0.1\"},{\"type\":\"query\",\"key\":\"vm_mysql_port\",\"value\":\"3307\"}]}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (120, '2022-08-25 19:48:53.926', '2022-08-25 19:48:53.926', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 31666906,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":38,\"CreatedAt\":\"2022-08-25T19:48:30.921+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.921+08:00\",\"parentId\":\"0\",\"path\":\"showinsprocesslist\",\"name\":\"showinsprocesslist\",\"hidden\":false,\"component\":\"view/saasInsShowProcesslist/saasInsShowProcesslist.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"showprocesslist\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[{\"ID\":1,\"CreatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"SysBaseMenuID\":38,\"type\":\"query\",\"key\":\"vm\",\"value\":\"127.0.0.1\"},{\"ID\":2,\"CreatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"SysBaseMenuID\":38,\"type\":\"query\",\"key\":\"vm_mysql_host\",\"value\":\"127.0.0.1\"},{\"ID\":3,\"CreatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"SysBaseMenuID\":38,\"type\":\"query\",\"key\":\"vm_mysql_port\",\"value\":\"3307\"}],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:32.852+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:20.14+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":37,\"CreatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"UpdatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"parentId\":\"0\",\"path\":\"project\",\"name\":\"project\",\"hidden\":false,\"component\":\"view/saasProject/saasProject.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"项目管理\",\"icon\":\"chat-line-round\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":3,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"order\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:16:23.619+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"14\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":27,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"plugin\",\"name\":\"plugin\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件系统\",\"icon\":\"cherry\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":28,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"27\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":9,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"simpleUploader\",\"name\":\"simpleUploader\",\"hidden\":false,\"component\":\"view/example/simpleUploader/simpleUploader\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传（插件版）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"excel\",\"name\":\"excel\",\"hidden\":false,\"component\":\"view/example/excel/excel.vue\",\"sort\":4,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"excel导入导出\",\"icon\":\"takeaway-box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"9\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":23,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":8,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":2,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":9,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":888}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (121, '2022-08-25 19:48:58.801', '2022-08-25 19:48:58.801', NULL, '127.0.0.1', 'POST', '/menu/addMenuAuthority',
        200, 21395914,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"menus\":[{\"ID\":38,\"CreatedAt\":\"2022-08-25T19:48:30.921+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.921+08:00\",\"parentId\":\"0\",\"path\":\"showinsprocesslist\",\"name\":\"showinsprocesslist\",\"hidden\":false,\"component\":\"view/saasInsShowProcesslist/saasInsShowProcesslist.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"showprocesslist\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[{\"ID\":1,\"CreatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"SysBaseMenuID\":38,\"type\":\"query\",\"key\":\"vm\",\"value\":\"127.0.0.1\"},{\"ID\":2,\"CreatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"SysBaseMenuID\":38,\"type\":\"query\",\"key\":\"vm_mysql_host\",\"value\":\"127.0.0.1\"},{\"ID\":3,\"CreatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.926+08:00\",\"SysBaseMenuID\":38,\"type\":\"query\",\"key\":\"vm_mysql_port\",\"value\":\"3307\"}],\"menuBtn\":[]},{\"ID\":32,\"CreatedAt\":\"2022-08-08T21:23:09.476+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:32.852+08:00\",\"parentId\":\"0\",\"path\":\"db-plartform\",\"name\":\"db-plartform\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":1,\"meta\":{\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"数据库管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":33,\"CreatedAt\":\"2022-08-08T21:25:02.987+08:00\",\"UpdatedAt\":\"2022-08-09T18:19:47.191+08:00\",\"parentId\":\"32\",\"path\":\"DBDomain\",\"name\":\"DBDomain\",\"hidden\":false,\"component\":\"view/saasDomain/saasDomain.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库集群\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":36,\"CreatedAt\":\"2022-08-09T18:17:26.248+08:00\",\"UpdatedAt\":\"2022-08-09T18:20:15.841+08:00\",\"parentId\":\"32\",\"path\":\"instanceinfo\",\"name\":\"instanceinfo\",\"hidden\":false,\"component\":\"view/saasInstance/saasInstance.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"数据库实例\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"UpdatedAt\":\"2022-08-08T21:02:22.221+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":34,\"CreatedAt\":\"2022-08-09T13:48:43.458+08:00\",\"UpdatedAt\":\"2022-08-09T13:50:20.14+08:00\",\"parentId\":\"0\",\"path\":\"hostplatform\",\"name\":\"hostplatform\",\"hidden\":false,\"component\":\"view/saasHost/saasHost.vue\",\"sort\":2,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"宿主机管理\",\"icon\":\"coin\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":37,\"CreatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"UpdatedAt\":\"2022-08-10T12:03:00.785+08:00\",\"parentId\":\"0\",\"path\":\"project\",\"name\":\"project\",\"hidden\":false,\"component\":\"view/saasProject/saasProject.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"项目管理\",\"icon\":\"chat-line-round\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":35,\"CreatedAt\":\"2022-08-09T16:01:07.597+08:00\",\"UpdatedAt\":\"2022-08-09T16:16:23.619+08:00\",\"parentId\":\"0\",\"path\":\"taskPlatform\",\"name\":\"taskPlatform\",\"hidden\":false,\"component\":\"view/saasTaskPlatform/index.vue\",\"sort\":3,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"计划任务管理\",\"icon\":\"calendar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":8881}',
        '{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}', 1),
       (122, '2022-08-25 19:50:32.923', '2022-08-25 19:50:32.923', NULL, '127.0.0.1', 'POST', '/menu/updateBaseMenu',
        200, 14683907,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"ID\":38,\"CreatedAt\":\"2022-08-25T19:48:30.921+08:00\",\"UpdatedAt\":\"2022-08-25T19:48:30.921+08:00\",\"parentId\":\"0\",\"path\":\"showinsprocesslist\",\"name\":\"showinsprocesslist\",\"hidden\":false,\"component\":\"view/saasInsShowProcesslist/saasInsShowProcesslist.vue\",\"sort\":0,\"meta\":{\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"showprocesslist\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}',
        '{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}', 1),
       (123, '2022-08-25 19:54:35.679', '2022-08-25 19:54:35.679', NULL, '127.0.0.1', 'POST', '/api/getApiById', 200,
        1862974,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '', '{\"id\":124}',
        '{\"code\":0,\"data\":{\"api\":{\"ID\":124,\"CreatedAt\":\"2022-08-25T19:22:40.326+08:00\",\"UpdatedAt\":\"2022-08-25T19:23:38.623+08:00\",\"path\":\"/insprocesslist/showinsprocesslist\",\"description\":\"对mysql实例进行show processlist操作\",\"apiGroup\":\"insprocesslist\",\"method\":\"GET\"}},\"msg\":\"获取成功\"}',
        1),
       (124, '2022-08-25 19:54:38.768', '2022-08-25 19:54:38.768', NULL, '127.0.0.1', 'POST', '/api/updateApi', 200,
        18134325,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
        '',
        '{\"ID\":124,\"CreatedAt\":\"2022-08-25T19:22:40.326+08:00\",\"UpdatedAt\":\"2022-08-25T19:23:38.623+08:00\",\"path\":\"/insprocesslist/showinsprocesslist\",\"description\":\"对mysql实例进行show processlist操作\",\"apiGroup\":\"insprocesslist\",\"method\":\"POST\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"修改成功\"}', 1),
       (125, '2022-08-25 19:59:20.831', '2022-08-25 19:59:20.831', NULL, '127.0.0.1', 'POST',
        '/saas_instance/createInstance', 200, 8138958,
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15',
        '',
        '{\"ID\":1,\"projId\":1000,\"ip\":\"127.0.0.1\",\"port\":3307,\"version\":\"8.0.30\",\"level\":\"1\",\"application\":\"mysql\",\"useType\":\"正式\",\"health\":\"available\",\"role\":\"master\"}',
        '{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}', 3);
/*!40000 ALTER TABLE `sys_operation_records`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_authority`
--

DROP TABLE IF EXISTS `sys_user_authority`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_authority`
(
    `sys_user_id`                bigint unsigned NOT NULL,
    `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`sys_user_id`, `sys_authority_authority_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_authority`
--

LOCK TABLES `sys_user_authority` WRITE;
/*!40000 ALTER TABLE `sys_user_authority`
    DISABLE KEYS */;
INSERT INTO `sys_user_authority`
VALUES (1, 888),
       (1, 8881),
       (1, 9528),
       (2, 888),
       (3, 8881);
/*!40000 ALTER TABLE `sys_user_authority`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users`
--

DROP TABLE IF EXISTS `sys_users`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_users`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at`   datetime(3)                                                   DEFAULT NULL,
    `updated_at`   datetime(3)                                                   DEFAULT NULL,
    `deleted_at`   datetime(3)                                                   DEFAULT NULL,
    `uuid`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户UUID',
    `username`     varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录名',
    `password`     varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录密码',
    `nick_name`    varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '系统用户' COMMENT '用户昵称',
    `side_mode`    varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'dark' COMMENT '用户侧边主题',
    `header_img`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
    `base_color`   varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#fff' COMMENT '基础颜色',
    `active_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#1890ff' COMMENT '活跃颜色',
    `authority_id` bigint unsigned                                               DEFAULT '888' COMMENT '用户角色ID',
    `phone`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号',
    `email`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
    `enable`       bigint                                                        DEFAULT '1' COMMENT '用户是否被冻结 1正常 2冻结',
    PRIMARY KEY (`id`),
    KEY `idx_sys_users_deleted_at` (`deleted_at`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users`
--

LOCK TABLES `sys_users` WRITE;
/*!40000 ALTER TABLE `sys_users`
    DISABLE KEYS */;
INSERT INTO `sys_users`
VALUES (1, '2022-08-08 21:02:22.189', '2022-08-08 21:02:22.194', NULL, '70ad0fd2-179b-4d15-8cda-05167b5025d4', 'admin',
        '$2a$10$Mo/.LtMXCP/sHCmF2pqjguSWvIvCJK/90FB4zoVGszK7UquEuu/Xa', '超级管理员', 'dark',
        'https://qmplusimg.henrongyi.top/gva_header.jpg', '#fff', '#1890ff', 888, '17611111111', '333333333@qq.com', 1),
       (2, '2022-08-08 21:02:22.189', '2022-08-08 21:02:22.206', NULL, '03e40f8f-2d19-440b-9ed2-f3691036efd4',
        'a303176530', '$2a$10$0hoNClWt3C1EBMEYROJpPu18uxSJMyWLTZyMx7.8ktHJcgVh3AJHW', 'QMPlusUser', 'dark',
        'https:///qmplusimg.henrongyi.top/1572075907logo.png', '#fff', '#1890ff', 9528, '17611111111',
        '333333333@qq.com', 1),
       (3, '2022-08-08 21:30:34.548', '2022-08-08 21:30:34.548', NULL, '10677605-e5b2-44e1-8295-8a6b8229210b',
        'haierdba', '$2a$10$B7J2rLPSiHQSffDpnyYYOOVZyIcQKHfpwI2yFe5Z3J8lFZfEEfnry', 'DBA', 'dark',
        'https://qmplusimg.henrongyi.top/gva_header.jpg', '#fff', '#1890ff', 8881, '', '', 1);
/*!40000 ALTER TABLE `sys_users`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2022-08-25 12:49:59