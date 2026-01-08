Microsoft Windows [Version 10.0.22631.6199]
(c) Microsoft Corporation. All rights reserved.

C:\xampp\mysql\bin>mysql -u root -h localhost
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 61
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| rikas              |
| schema             |
| test               |
+--------------------+
7 rows in set (0.001 sec)

MariaDB [(none)]> USE schema;
Database changed
MariaDB [student]> SHOW TABLES;
+-------------------+
| Tables_in_student |
+-------------------+
| customers         |
+-------------------+
1 row in set (0.001 sec)

MariaDB [student]> DESCRIBE customers;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| PersonID  | varchar(10) | NO   | PRI | NULL    |       |
| FirstName | varchar(50) | NO   |     | NULL    |       |
| LastName  | varchar(50) | NO   |     | NULL    |       |
| SubDate   | date        | YES  |     | NULL    |       |
| Age       | int(11)     | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.043 sec)

MariaDB [student]> INSERT INTO customers
    -> (PersonID,FirstName,LastName,SubDate,Age)
    -> VALUES("P001","Mohammed","Rikas","2025/10/12",20);
Query OK, 1 row affected (0.006 sec)

MariaDB [student]> INSERT INTO customers
    -> (PersonID,FirstName,LastName,SubDate,Age)
    -> VALUES("P002","Fathima","Rikaza","2027/01/28",25)
    -> ,("P003","Mayiz","Ahamed","2026/05/08",22);
Query OK, 2 rows affected (0.013 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [student]> SELECT * FROM customers;
+----------+-----------+----------+------------+-----+
| PersonID | FirstName | LastName | SubDate    | Age |
+----------+-----------+----------+------------+-----+
| P001     | Mohammed  | Rikas    | 2025-10-12 |  20 |
| P002     | Fathima   | Rikaza   | 2027-01-28 |  25 |
| P003     | Mayiz     | Ahamed   | 2026-05-08 |  22 |
+----------+-----------+----------+------------+-----+
3 rows in set (0.001 sec)

MariaDB [student]> INSERT INTO customers
    -> (PersonID,FirstName,LastName,SubDate,Age)
    -> VALUES("P004","Aazik","","2027/01/28",35)
    -> ;
Query OK, 1 row affected (0.007 sec)

MariaDB [student]> SELECT * FROM customers;
+----------+-----------+----------+------------+-----+
| PersonID | FirstName | LastName | SubDate    | Age |
+----------+-----------+----------+------------+-----+
| P001     | Mohammed  | Rikas    | 2025-10-12 |  20 |
| P002     | Fathima   | Rikaza   | 2027-01-28 |  25 |
| P003     | Mayiz     | Ahamed   | 2026-05-08 |  22 |
| P004     | Aazik     |          | 2027-01-28 |  35 |
+----------+-----------+----------+------------+-----+
4 rows in set (0.001 sec)

MariaDB [student]> CREATE DATABASE Personal_db;
Query OK, 1 row affected (0.003 sec)

MariaDB [student]> use Personal_db;
Database changed
MariaDB [Personal_db]> CREATE TABLE Personal(
    -> ID INT NOT NULL AUTO_INCREMENT,
    -> Name VARCHAR(50) NOT NULL,
    -> Dept VARCHAR(50) NOT NULL,
    -> Date DATE,
    -> PRIMARY KEY(ID));
Query OK, 0 rows affected (0.016 sec)

MariaDB [Personal_db]> DESCRIBE Personal;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| ID    | int(11)     | NO   | PRI | NULL    | auto_increment |
| Name  | varchar(50) | NO   |     | NULL    |                |
| Dept  | varchar(50) | NO   |     | NULL    |                |
| Date  | date        | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
4 rows in set (0.033 sec)

MariaDB [Personal_db]> INSERT INTO Personal
    -> (ID,Name,Dept,Date)
    -> VALUES("1","Rikas","DCS",NOW());
Query OK, 1 row affected, 1 warning (0.014 sec)

MariaDB [Personal_db]> SELECT* FROM Personal;
+----+-------+------+------------+
| ID | Name  | Dept | Date       |
+----+-------+------+------------+
|  1 | Rikas | DCS  | 2026-01-08 |
+----+-------+------+------------+
1 row in set (0.001 sec)

MariaDB [Personal_db]> INSERT INTO Personal
    -> (Name,Dept,Date)
    -> VALUES("John","FoS","2025-01-20")
    -> ,("Doe","FoS","2028-12-02");
Query OK, 2 rows affected (0.005 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [Personal_db]> SELECT* FROM Personal;
+----+-------+------+------------+
| ID | Name  | Dept | Date       |
+----+-------+------+------------+
|  1 | Rikas | DCS  | 2026-01-08 |
|  2 | John  | FoS  | 2025-01-20 |
|  3 | Doe   | FoS  | 2028-12-02 |
+----+-------+------+------------+
3 rows in set (0.001 sec)

MariaDB [Personal_db]> UPDATE Personal SET Name="Rikas" WHERE ID=1;
Query OK, 0 rows affected (0.001 sec)
Rows matched: 1  Changed: 0  Warnings: 0

MariaDB [Personal_db]> SELECT* FROM Personal;
+----+-------+------+------------+
| ID | Name  | Dept | Date       |
+----+-------+------+------------+
|  1 | Rikas | DCS  | 2026-01-08 |
|  2 | John  | FoS  | 2025-01-20 |
|  3 | Doe   | FoS  | 2028-12-02 |
+----+-------+------+------------+
3 rows in set (0.001 sec)

MariaDB [Personal_db]> SELECT 1;
+---+
| 1 |
+---+
| 1 |
+---+
1 row in set (0.001 sec)

MariaDB [Personal_db]> SELECT*FROM Personal LIMIT 3 OFFSET 1;
+----+------+------+------------+
| ID | Name | Dept | Date       |
+----+------+------+------------+
|  2 | John | FoS  | 2025-01-20 |
|  3 | Doe  | FoS  | 2028-12-02 |
+----+------+------+------------+
2 rows in set (0.001 sec)

MariaDB [Personal_db]> INSERT INTO Personal
    -> (Name,Dept,Date)
    -> VALUES("Kamal","FoM","2025-08-11")
    -> ,("Vijay","DoB","2024-10-11")
    -> ,("Rajni","DoC","2026-08-24");
Query OK, 3 rows affected (0.006 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [Personal_db]> SELECT*FROM Personal;
+----+-------+------+------------+
| ID | Name  | Dept | Date       |
+----+-------+------+------------+
|  1 | Rikas | DCS  | 2026-01-08 |
|  2 | John  | FoS  | 2025-01-20 |
|  3 | Doe   | FoS  | 2028-12-02 |
|  4 | Kamal | FoM  | 2025-08-11 |
|  5 | Vijay | DoB  | 2024-10-11 |
|  6 | Rajni | DoC  | 2026-08-24 |
+----+-------+------+------------+
6 rows in set (0.001 sec)

MariaDB [Personal_db]> SELECT*FROM Personal LIMIT 4 OFFSET 2;
+----+-------+------+------------+
| ID | Name  | Dept | Date       |
+----+-------+------+------------+
|  3 | Doe   | FoS  | 2028-12-02 |
|  4 | Kamal | FoM  | 2025-08-11 |
|  5 | Vijay | DoB  | 2024-10-11 |
|  6 | Rajni | DoC  | 2026-08-24 |
+----+-------+------+------------+
4 rows in set (0.001 sec)

MariaDB [Personal_db]> SELECT*FROM Personal LIMIT 8 OFFSET 3;
+----+-------+------+------------+
| ID | Name  | Dept | Date       |
+----+-------+------+------------+
|  4 | Kamal | FoM  | 2025-08-11 |
|  5 | Vijay | DoB  | 2024-10-11 |
|  6 | Rajni | DoC  | 2026-08-24 |
+----+-------+------+------------+
3 rows in set (0.001 sec)

MariaDB [Personal_db]> SELECT COUNT(ID) FROM Personal;
+-----------+
| COUNT(ID) |
+-----------+
|         6 |
+-----------+
1 row in set (0.001 sec)

MariaDB [Personal_db]> SELECT COUNT(Name) FROM Personal;
+-------------+
| COUNT(Name) |
+-------------+
|           6 |
+-------------+

1 row in set (0.001 sec)
