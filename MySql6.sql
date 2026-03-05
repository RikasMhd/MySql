MariaDB [(none)]> create database Question;
Query OK, 1 row affected (0.036 sec)

MariaDB [(none)]> use Question
Database changed
MariaDB [Question]> create table Person(P_ID int primary key,Name varchar(50),Adddress Varchar(50),Email varchar(50),Age int);
Query OK, 0 rows affected (0.661 sec)

MariaDB [Question]> insert into Person values(101,"Alice","America","Alice@gmail.com",32),(102,"Bob","India","Bob@gmail.com",29),(103,"Maria","Brazil","Maria@gmail.com",41),(104,"Mohammed","SriLanka","mhd@gmail.com",25),(105,"Sneka","Dubai","Sneka@gmail.com",54);
Query OK, 5 rows affected (0.182 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Question]> select * from person;
+------+----------+----------+-----------------+------+
| P_ID | Name     | Adddress | Email           | Age  |
+------+----------+----------+-----------------+------+
|  101 | Alice    | America  | Alice@gmail.com |   32 |
|  102 | Bob      | India    | Bob@gmail.com   |   29 |
|  103 | Maria    | Brazil   | Maria@gmail.com |   41 |
|  104 | Mohammed | SriLanka | mhd@gmail.com   |   25 |
|  105 | Sneka    | Dubai    | Sneka@gmail.com |   54 |
+------+----------+----------+-----------------+------+
5 rows in set (0.001 sec)

MariaDB [Question]>  create table Student(Roll_No int not null primary key,F_Name varchar(50),L_Name varchar(50),City Varchar(50),Street_No varchar(50),House_No varchar(50));
Query OK, 0 rows affected (0.102 sec)

MariaDB [Question]> insert into Student values(1001,"Mohammed","Abdul","Batticoloa","Valaichenai","125/12"),(1002,"Smritri","Mandana","Chennai","Madurai","53"),(1003,"Albert","Einstein","Newyork","Washington","147/2"),(1004,"Fathima","Shaa","Colombo","kollupitiya","239/1");
Query OK, 4 rows affected (0.046 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [Question]> select * from student;
+---------+----------+----------+------------+-------------+----------+
| Roll_No | F_Name   | L_Name   | City       | Street_No   | House_No |
+---------+----------+----------+------------+-------------+----------+
|    1001 | Mohammed | Abdul    | Batticoloa | Valaichenai | 125/12   |
|    1002 | Smritri  | Mandana  | Chennai    | Madurai     | 53       |
|    1003 | Albert   | Einstein | Newyork    | Washington  | 147/2    |
|    1004 | Fathima  | Shaa     | Colombo    | kollupitiya | 239/1    |
+---------+----------+----------+------------+-------------+----------+
4 rows in set (0.001 sec)

MariaDB [Question]>  create table Customer(Roll_No int not null primary key,Name varchar(50),Age int);
Query OK, 0 rows affected (0.086 sec)

MariaDB [Question]>  create table CustomerNo(Roll_No int not null,Tel_No int,foreign key(Roll_No) references Customer(Roll_No));
Query OK, 0 rows affected (0.145 sec)

MariaDB [Question]> insert into Customer values(1,"Alice",32),(2,"Bob",29),(3,"Maria",41),(4,"Mohammed",25),(5,"Sneka",54);
Query OK, 5 rows affected (0.024 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Question]> insert into CustomerNo values(1,765894325),(1,789654231),(2,756984563),(2,779685416),(3,743698521),(4,776985432),(5,786935642),(5,756983478);
Query OK, 8 rows affected (0.051 sec)
Records: 8  Duplicates: 0  Warnings: 0

MariaDB [Question]> select * from CustomerNo
    -> ;
+---------+-----------+
| Roll_No | Tel_No    |
+---------+-----------+
|       1 | 765894325 |
|       1 | 789654231 |
|       2 | 756984563 |
|       2 | 779685416 |
|       3 | 743698521 |
|       4 | 776985432 |
|       5 | 786935642 |
|       5 | 756983478 |
+---------+-----------+
8 rows in set (0.001 sec)

MariaDB [Question]> SELECT c.Roll_No, c.Name, c.Age, n.Tel_No
    -> FROM Customer c
    -> INNER JOIN CustomerNo n
    -> ON c.Roll_No = n.Roll_No;
+---------+----------+------+-----------+
| Roll_No | Name     | Age  | Tel_No    |
+---------+----------+------+-----------+
|       1 | Alice    |   32 | 765894325 |
|       1 | Alice    |   32 | 789654231 |
|       2 | Bob      |   29 | 756984563 |
|       2 | Bob      |   29 | 779685416 |
|       3 | Maria    |   41 | 743698521 |
|       4 | Mohammed |   25 | 776985432 |
|       5 | Sneka    |   54 | 786935642 |
|       5 | Sneka    |   54 | 756983478 |
+---------+----------+------+-----------+
8 rows in set (0.001 sec)

MariaDB [Question]> create table Employee(Emp_No int not null primary key,Emp_Name varchar(50),Salary int);
Query OK, 0 rows affected (0.094 sec)

MariaDB [Question]> create table Department(Dept_ID int not null primary key,Dept_Name varchar(50));
Query OK, 0 rows affected (0.089 sec)

MariaDB [Question]> create table Works_On(Emp_No int not null,Dept_ID int not null,Since int,foreign key(Emp_No) references Employee(Emp_No),foreign key(Dept_ID) references Department(Dept_ID));
Query OK, 0 rows affected (0.161 sec)

MariaDB [Question]> insert into Employee values(1,"Mhd",50000),(2,"Vithu",65000),(3,"Nirus",55000),(4,"Alhii",45000),(5,"Mufaah",52000);
Query OK, 5 rows affected (0.044 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Question]> insert into Department values(1,"DCS"),(2,"Physics"),(3,"Chemistry");
Query OK, 3 rows affected (0.156 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [Question]> insert into Works_On values(1,1,2020),(2,1,2022),(3,1,2021),(4,3,2023),(5,2,2019);
Query OK, 5 rows affected (0.041 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Question]> select * from Employee;
+--------+----------+--------+
| Emp_No | Emp_Name | Salary |
+--------+----------+--------+
|      1 | Mhd      |  50000 |
|      2 | Vithu    |  65000 |
|      3 | Nirus    |  55000 |
|      4 | Alhii    |  45000 |
|      5 | Mufaah   |  52000 |
+--------+----------+--------+
5 rows in set (0.000 sec)

MariaDB [Question]> select * from Department;
+---------+-----------+
| Dept_ID | Dept_Name |
+---------+-----------+
|       1 | DCS       |
|       2 | Physics   |
|       3 | Chemistry |
+---------+-----------+
3 rows in set (0.001 sec)

MariaDB [Question]> select * from works_on;
+--------+---------+-------+
| Emp_No | Dept_ID | Since |
+--------+---------+-------+
|      1 |       1 |  2020 |
|      2 |       1 |  2022 |
|      3 |       1 |  2021 |
|      4 |       3 |  2023 |
|      5 |       2 |  2019 |
+--------+---------+-------+
5 rows in set (0.000 sec)

MariaDB [Question]> SELECT e.Emp_No, e.Emp_Name, e.Salary, d.Dept_Name, w.Since
    -> FROM Employee e
    -> JOIN works_on w ON e.Emp_No = w.Emp_No
    -> JOIN Department d ON w.Dept_ID = d.Dept_ID;
+--------+----------+--------+-----------+-------+
| Emp_No | Emp_Name | Salary | Dept_Name | Since |
+--------+----------+--------+-----------+-------+
|      1 | Mhd      |  50000 | DCS       |  2020 |
|      2 | Vithu    |  65000 | DCS       |  2022 |
|      3 | Nirus    |  55000 | DCS       |  2021 |
|      5 | Mufaah   |  52000 | Physics   |  2019 |
|      4 | Alhii    |  45000 | Chemistry |  2023 |
+--------+----------+--------+-----------+-------+
5 rows in set (0.001 sec)

MariaDB [Question]>