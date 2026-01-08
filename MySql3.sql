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
