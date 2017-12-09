**To check if the MYSQL server is running**

```bash
root@elecex-zgateway-mx6:~# /etc/init.d/mysql status
/usr/bin/mysqladmin  Ver 8.42 Distrib 5.5.47, for Linux on arm
Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Server version          5.5.47
Protocol version        10
Connection              Localhost via UNIX socket
UNIX socket             /var/run/mysqld/mysqld.sock
Uptime:                 1 min 34 sec

Threads: 1  Questions: 4  Slow queries: 0  Opens: 33  Flush tables: 1  Open tables: 26  Queries per second avg: 0.042.
```
**Create a test database**

```bash
root@elecex-zgateway-mx6:~# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.5.47 Source distribution

Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
+--------------------+
3 rows in set (0.00 sec)

mysql> create database elecex_test;
Query OK, 1 row affected (0.37 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| elecex_test        |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.00 sec)

mysql> use elecex_test;
Database changed
mysql> create table table1(field1 varchar(20), field2 varchar(20));
Query OK, 0 rows affected (0.40 sec)

mysql> show tables;
+-----------------------+
| Tables_in_elecex_test |
+-----------------------+
| table1                |
+-----------------------+
1 row in set (0.00 sec)

mysql> select * from table1;
Empty set (0.00 sec)

mysql> show columns from table1;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| field1 | varchar(20) | YES  |     | NULL    |       |
| field2 | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)


mysql> insert into table1 (field1,field2) values ("test1","test2");                                                                                                                                         
Query OK, 1 row affected (0.29 sec)

mysql> select * from table1;
+--------+--------+
| field1 | field2 |
+--------+--------+
| test1  | test2  |
+--------+--------+
1 row in set (0.00 sec)

```
