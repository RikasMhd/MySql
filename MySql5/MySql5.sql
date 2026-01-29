MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| anyothername       |
| customer_db        |
| details            |
| exam_invigilator   |
| information_schema |
| mysql              |
| performance_schema |
| personnel_db       |
| phpmyadmin         |
| pscompany_db       |
| sample             |
| student_marks      |
| students           |
| test               |
| world              |
+--------------------+
15 rows in set (0.114 sec)

MariaDB [sample]> show tables;
+------------------+
| Tables_in_sample |
+------------------+
| customers        |
+------------------+
1 row in set (0.001 sec)

MariaDB [sample]> Describe customers;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| customer_id  | varchar(50) | NO   | PRI | NULL    |       |
| customername | varchar(50) | NO   |     | NULL    |       |
| contactname  | varchar(50) | NO   |     | NULL    |       |
| address      | varchar(50) | NO   |     | NULL    |       |
| city         | varchar(50) | NO   |     | NULL    |       |
| postalcode   | varchar(50) | NO   |     | NULL    |       |
| country      | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
7 rows in set (0.080 sec)

MariaDB [sample]>  alter table customers change customer_id customerid int auto_increment;
Query OK, 0 rows affected (0.481 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [sample]> load data infile "C:/Users/DcsUser/Documents/customer.txt" into table customers;
Query OK, 7 rows affected, 13 warnings (0.044 sec)
Records: 7  Deleted: 0  Skipped: 0  Warnings: 13

MariaDB [sample]> select * from customers;
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
| customerid | customername             | contactname        | address                      | city       | postalcode | country  |
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
|          1 | Alfreds Futterjiste      | Maria Anders       | Obere Str. 57                | Berlin     | 12209      |  |rmany
|          2 | Ana Trujillo Emparedados | Ana Trujillo       | Avda.de la Constitucion 2222 | Mexico D.F | 05021      |   |ico
|          3 | Antonio Moreno           | Antonio Moreno     | Mataderos 2312               | Mexico D.F | 05023      |   |ico
|          4 | helados Taqueria         | Ana David          | Obere Str.48                 | Berlin     | 25364      |  |rmany
|          5 | Around the Horn          | Thomas Hardy       | 120 Hanover Sq.              | London     | 236        |       |
|          6 | Berglunds snabbkop       | Christina Berglund | Berguvsagen 8                | Lulea      | 95822      |   |den
|          7 |                          |                    |                              |            |            |          |
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
7 rows in set (0.061 sec)

MariaDB [sample]> load data infile "C:/Users/DcsUser/Documents/customer.txt" into table customers;
Query OK, 6 rows affected, 6 warnings (0.035 sec)
Records: 6  Deleted: 0  Skipped: 0  Warnings: 6

MariaDB [sample]> select * from customers;
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
| customerid | customername             | contactname        | address                      | city       | postalcode | country  |
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
 |         1 | Alfreds Futterjiste      | Maria Anders       | Obere Str. 57                | Berlin     | 12209      | Germany
  |        2 | Ana Trujillo Emparedados | Ana Trujillo       | Avda.de la Constitucion 2222 | Mexico D.F | 05021      | Mexico
  |        3 | Antonio Moreno           | Antonio Moreno     | Mataderos 2312               | Mexico D.F | 05023      | Mexico
 |         4 | helados Taqueria         | Ana David          | Obere Str.48                 | Berlin     | 25364      | Germany
      |    5 | Around the Horn          | Thomas Hardy       | 120 Hanover Sq.              | London     | 236        | UK
  |        6 | Berglunds snabbkop       | Christina Berglund | Berguvsagen 8                | Lulea      | 95822      | Sweden
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
6 rows in set (0.000 sec)

MariaDB [sample]> delete from customers where customerid>0;
Query OK, 6 rows affected (0.055 sec)

MariaDB [sample]> load data infile "C:/Users/DcsUser/Documents/customer.txt" into table customers;
Query OK, 6 rows affected, 7 warnings (0.046 sec)
Records: 6  Deleted: 0  Skipped: 0  Warnings: 7

MariaDB [sample]> alter table customers auto_increment = 1;
Query OK, 0 rows affected (0.056 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [sample]> load data infile "C:/Users/DcsUser/Documents/customer.txt" into table customers;
Query OK, 6 rows affected, 7 warnings (0.055 sec)
Records: 6  Deleted: 0  Skipped: 0  Warnings: 7

MariaDB [sample]> select * from customers;
+------------+--------------------------+----------------+------------------------------+------------+------------+----------+
| customerid | customername             | contactname    | address                      | city       | postalcode | country  |
+------------+--------------------------+----------------+------------------------------+------------+------------+----------+
 |         1 | Alfreds Futterjiste      | Maria Anders   | Obere Str. 57                | Berlin     | 12209      | Germany
  |        2 | Ana Trujillo Emparedados | Ana Trujillo   | Avda.de la Constitucion 2222 | Mexico D.F | 05021      | Mexico
  |        3 | Antonio Moreno           | Antonio Moreno | Mataderos 2312               | Mexico D.F | 05023      | Mexico
 |         4 | helados Taqueria         | Ana David      | Obere Str.48                 | Berlin     | 25364      | Germany
      |    5 | Around the Horn          | Thomas Hardy   | 120 Hanover Sq.              | London     | 236        | UK
|          6 | Christina Berglund       | Berguvsagen 8  | Lulea                        | 95822      | Sweden     |          |
+------------+--------------------------+----------------+------------------------------+------------+------------+----------+
6 rows in set (0.000 sec)

MariaDB [sample]> truncate table customers;
Query OK, 0 rows affected (0.232 sec)

MariaDB [sample]> load data infile "C:/Users/DcsUser/Documents/customer.txt" into table customers;
Query OK, 6 rows affected, 6 warnings (0.061 sec)
Records: 6  Deleted: 0  Skipped: 0  Warnings: 6

MariaDB [sample]> select * from customers;
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
| customerid | customername             | contactname        | address                      | city       | postalcode | country  |
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
 |         1 | Alfreds Futterjiste      | Maria Anders       | Obere Str. 57                | Berlin     | 12209      | Germany
  |        2 | Ana Trujillo Emparedados | Ana Trujillo       | Avda.de la Constitucion 2222 | Mexico D.F | 05021      | Mexico
  |        3 | Antonio Moreno           | Antonio Moreno     | Mataderos 2312               | Mexico D.F | 05023      | Mexico
 |         4 | helados Taqueria         | Ana David          | Obere Str.48                 | Berlin     | 25364      | Germany
      |    5 | Around the Horn          | Thomas Hardy       | 120 Hanover Sq.              | London     | 236        | UK
  |        6 | Berglunds snabbkop       | Christina Berglund | Berguvsagen 8                | Lulea      | 95822      | Sweden
+------------+--------------------------+--------------------+------------------------------+------------+------------+----------+
6 rows in set (0.000 sec)
