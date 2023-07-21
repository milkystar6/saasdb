# 关于用户创建

**如下内容在模版数据库中提前创建完成**

## 创建用户管理的用户

### 开启访问控制

配置文件添加如下内容

```
security:
authorization: enabled
keyFile: /var/lib/data/mongodb/mongo_key_file
##注意，副本集环境需配置一个key file，集群统一使用这一个keyfile，注意在配置文件中说明并授权
```

注意mongo key file给600权限不然报错"msg":"Read security file failed","attr":{"error":{"code":30,"codeName":"InvalidPath"
,"errmsg":"permissions on /var/lib/data/mongodb/mongo_key_file are too open"}}
此时通过mongo连接上来，只能先创建一个管理用户
Warning: unable to run listCollections, attempting to approximate collection names by parsing connectionStatus
创建管理用户

```shell
rs0:PRIMARY> use admin
switched to db admin
rs0:PRIMARY> db.createUser({ user:"mongoadmin",pwd:"letsg0",roles:[{role:"root",db:"admin"}]})
Successfully added user: {
"user" : "mongoadmin",
"roles" : [
{
"role" : "root",
"db" : "admin"
}
]
}
```

用户管理用户验证
可以在使用mongo shell登录时添加选项--authenticationDatabase或登录完后在admin数据库下进行验证。

```shell
[root@mongo-10 ~]# mongo -u mongoadmin -p letsg0 --authenticationDatabase admin
MongoDB shell version v4.4.6
connecting to: mongodb://127.0.0.1:27017/?authSource=admin&compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("d9d04d55-03f8-4e18-ad17-8eac45aa2d75") }
MongoDB server version: 4.4.6
rs0:PRIMARY>
mongo shell登录完成之后进行验证：
rs0:PRIMARY> use admin
switched to db admin
rs0:PRIMARY> db.auth("mongoadmin","letsg0")
1
```