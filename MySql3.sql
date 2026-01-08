MariaDB [Rikas]> CREATE TABLE Student_Details(
    -> ID INT NOT NULL PRIMARY KEY,
    -> Name VARCHAR(25) NOT NULL,
    -> Course VARCHAR(50) NOT NULL);
Query OK, 0 rows affected (0.096 sec)

MariaDB [Rikas]> INSERT INTO Student_Details
    -> VALUES(2041,"Tom","Java"),
    -> (2204,"John","C++"),
    -> (2043,"Alice","Python"),
    -> (2032,"Bob","Oracle");
Query OK, 4 rows affected (0.033 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [Rikas]> SELECT * FROM Student_Details;
+------+-------+--------+
| ID   | Name  | Course |
+------+-------+--------+
| 2032 | Bob   | Oracle |
| 2041 | Tom   | Java   |
| 2043 | Alice | Python |
| 2204 | John  | C++    |
+------+-------+--------+
4 rows in set (0.000 sec)

MariaDB [Rikas]> CREATE TABLE Student_Marks(
    -> ID INT NOT NULL,
    -> Marks decimal(2,1) not null,
    -> foreign key(ID) references Student_Details(ID));
Query OK, 0 rows affected (0.099 sec)

MariaDB [Rikas]> alter table Student_Marks modify column Marks int not null;
Query OK, 0 rows affected (0.359 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [Rikas]> describe Student_Details
    -> ;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| ID     | int(11)     | NO   | PRI | NULL    |       |
| Name   | varchar(25) | NO   |     | NULL    |       |
| Course | varchar(50) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.019 sec)

MariaDB [Rikas]> insert into Student_Marks
    -> values(2032,80),
    -> (2041,76),
    -> (2043,67),
    -> (2204,92);
Query OK, 4 rows affected (0.062 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [Rikas]> SELECT * FROM Student_Marks;
+------+-------+
| ID   | Marks |
+------+-------+
| 2032 |    80 |
| 2041 |    76 |
| 2043 |    67 |
| 2204 |    92 |
+------+-------+
4 rows in set (0.001 sec)

=================================================================================================================
MariaDB [pscompany]> CREATE TABLE products(
    -> product_ID INT NOT NULL AUTO_INCREMENT,
    -> productCode VARCHAR(10),
    -> Name VARCHAR(50),
    -> Quantity INT ,
    -> Price INT,
    -> PRIMARY KEY (product_ID));
Query OK, 0 rows affected (0.089 sec)

MariaDB [pscompany]> INSERT INTO productS
    -> (product_ID,productCode,Name,Quantity,Price)
    -> VALUES(1001,"Pen","Pen Red",50000,3);
Query OK, 1 row affected (0.040 sec)

MariaDB [pscompany]> SELECT * FROM products;
+------------+-------------+---------+----------+-------+
| product_ID | productCode | Name    | Quantity | Price |
+------------+-------------+---------+----------+-------+
|       1001 | Pen         | Pen Red |    50000 |     3 |
+------------+-------------+---------+----------+-------+
1 row in set (0.001 sec)

MariaDB [pscompany]> INSERT INTO products(productCode,Name,Quantity,Price)
    -> VALUES("Pen","Pen Blue",8000,3),
    -> ("Pen","Pen Black",2000,3),
    -> ("Pec","Pencil 2B",10000,1.5),
    -> ("Pec","Pencil 2H",10000,1.5),
    -> ("Pec","Pencil 3B",500,1);
Query OK, 5 rows affected (0.029 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [pscompany]> SELECT * FROM products;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1001 | Pen         | Pen Red   |    50000 |     3 |
|       1002 | Pen         | Pen Blue  |     8000 |     3 |
|       1003 | Pen         | Pen Black |     2000 |     3 |
|       1004 | Pec         | Pencil 2B |    10000 |     2 |
|       1005 | Pec         | Pencil 2H |    10000 |     2 |
|       1006 | Pec         | Pencil 3B |      500 |     1 |
+------------+-------------+-----------+----------+-------+
6 rows in set (0.000 sec)

MariaDB [pscompany]> SELECT * FROM products WHERE Quantity<200 OR Price<1.2;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1006 | Pec         | Pencil 3B |      500 |     1 |
+------------+-------------+-----------+----------+-------+
1 row in set (0.001 sec)

MariaDB [pscompany]> SELECT * FROM products WHERE NOT Quantity<200 OR Price<1.2;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1001 | Pen         | Pen Red   |    50000 |     3 |
|       1002 | Pen         | Pen Blue  |     8000 |     3 |
|       1003 | Pen         | Pen Black |     2000 |     3 |
|       1004 | Pec         | Pencil 2B |    10000 |     2 |
|       1005 | Pec         | Pencil 2H |    10000 |     2 |
|       1006 | Pec         | Pencil 3B |      500 |     1 |
+------------+-------------+-----------+----------+-------+
6 rows in set (0.001 sec)

MariaDB [pscompany]> SELECT * FROM products WHERE NOT Price>1.2;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1006 | Pec         | Pencil 3B |      500 |     1 |
+------------+-------------+-----------+----------+-------+
1 row in set (0.000 sec)

MariaDB [pscompany]> SELECT * FROM products WHERE Name IN ('Pen Red','Pen Black');
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1001 | Pen         | Pen Red   |    50000 |     3 |
|       1003 | Pen         | Pen Black |     2000 |     3 |
+------------+-------------+-----------+----------+-------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> SELECT * FROM products WHERE Price BETWEEN 1.25 AND 2;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1004 | Pec         | Pencil 2B |    10000 |     2 |
|       1005 | Pec         | Pencil 2H |    10000 |     2 |
+------------+-------------+-----------+----------+-------+
2 rows in set (0.001 sec)

MariaDB [pscompany]> SELECT Name,Price FROM products WHERE Name LIKE "Pencil%";
+-----------+-------+
| Name      | Price |
+-----------+-------+
| Pencil 2B |     2 |
| Pencil 2H |     2 |
| Pencil 3B |     1 |
+-----------+-------+
3 rows in set (0.001 sec)

MariaDB [pscompany]> SELECT MAX(Price),MIN(Price) FROM products;
+------------+------------+
| MAX(Price) | MIN(Price) |
+------------+------------+
|          3 |          1 |
+------------+------------+
1 row in set (0.001 sec)

MariaDB [pscompany]> DELETE FROM products WHERE product_ID=1005;
Query OK, 1 row affected (0.054 sec)

MariaDB [pscompany]> SELECT * FROM products;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1001 | Pen         | Pen Red   |    50000 |     3 |
|       1002 | Pen         | Pen Blue  |     8000 |     3 |
|       1003 | Pen         | Pen Black |     2000 |     3 |
|       1004 | Pec         | Pencil 2B |    10000 |     2 |
|       1006 | Pec         | Pencil 3B |      500 |     1 |
+------------+-------------+-----------+----------+-------+
5 rows in set (0.000 sec)

MariaDB [pscompany]> SELECT * FROM products;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1001 | Pen         | Pen Red   |    50000 |     3 |
|       1002 | Pen         | Pen Blue  |     8000 |     3 |
|       1003 | Pen         | Pen Black |     2000 |     3 |
|       1004 | Pec         | Pencil 2B |    10000 |     2 |
|       1006 | Pec         | Pencil 3B |      500 |     1 |
+------------+-------------+-----------+----------+-------+
5 rows in set (0.000 sec)

MariaDB [pscompany]> UPDATE products
    -> SET Name="Pen Green"
    -> WHERE product_ID=1002;
Query OK, 1 row affected (0.031 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [pscompany]> SELECT * FROM products;
+------------+-------------+-----------+----------+-------+
| product_ID | productCode | Name      | Quantity | Price |
+------------+-------------+-----------+----------+-------+
|       1001 | Pen         | Pen Red   |    50000 |     3 |
|       1002 | Pen         | Pen Green |     8000 |     3 |
|       1003 | Pen         | Pen Black |     2000 |     3 |
|       1004 | Pec         | Pencil 2B |    10000 |     2 |
|       1006 | Pec         | Pencil 3B |      500 |     1 |
+------------+-------------+-----------+----------+-------+
5 rows in set (0.000 sec)