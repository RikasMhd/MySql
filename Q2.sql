MariaDB [sample]> create database staff
    -> ;
Query OK, 1 row affected (0.016 sec)

MariaDB [sample]> use staff
Database changed
MariaDB [staff]> create table Staff(
    -> SSN int not null primary key,
    -> First_Name varchar(50),
    -> Last_Name varchar(50)
    -> ,Salary int ,
    -> DNum int );
Query OK, 0 rows affected (0.134 sec)

MariaDB [staff]> create table department(
    -> DNum int primary key,
    -> Dept_Name varchar(50) not null,Start_Date date);
Query OK, 0 rows affected (0.114 sec)

MariaDB [staff]> drop table Staff;
Query OK, 0 rows affected (0.095 sec)

MariaDB [staff]> create table Staff(
    -> SSN int not null primary key,
    -> First_Name varchar(50),
    -> Last_Name varchar(50)
    -> ,Salary decimal(10,2) ,
    -> DNum int ,foreign key(DNum) references department(DNum));
Query OK, 0 rows affected (0.152 sec)

MariaDB [staff]> load data local infile "C:/Users/DCSUser/Desktop/department.txt" into table department;
Query OK, 3 rows affected (0.049 sec)
Records: 3  Deleted: 0  Skipped: 0  Warnings: 0

MariaDB [staff]> load data local infile "C:/Users/DCSUser/Desktop/Staff.txt" into table staff;
Query OK, 6 rows affected, 5 warnings (0.047 sec)
Records: 6  Deleted: 0  Skipped: 0  Warnings: 5

MariaDB [staff]> select *from staff;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
| 53453 | Joy        | Dilan     | 25000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
| 99887 | Aila       | Shed      | 25000.00 |    4 |
+-------+------------+-----------+----------+------+
6 rows in set (0.001 sec)

MariaDB [staff]> select *from department;
+------+----------------+------------+
| DNum | Dept_Name      | Start_Date |
+------+----------------+------------+
|    1 | ELTU           | 1981-06-19 |
|    4 | Administration | 1995-01-01 |
|    5 | Research       | 1988-05-22 |
+------+----------------+------------+
3 rows in set (0.001 sec)

MariaDB [staff]> select * from staff order by Salary asc;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 53453 | Joy        | Dilan     | 25000.00 |    5 |
| 99887 | Aila       | Shed      | 25000.00 |    4 |
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
+-------+------------+-----------+----------+------+
6 rows in set (0.001 sec)

MariaDB [staff]> select * from staff order by Last_Name desc;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
| 99887 | Aila       | Shed      | 25000.00 |    4 |
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
| 53453 | Joy        | Dilan     | 25000.00 |    5 |
+-------+------------+-----------+----------+------+
6 rows in set (0.001 sec)

MariaDB [staff]> select * from staff order by
    -> DNum,Salary;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 99887 | Aila       | Shed      | 25000.00 |    4 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
| 53453 | Joy        | Dilan     | 25000.00 |    5 |
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
+-------+------------+-----------+----------+------+
6 rows in set (0.001 sec)

MariaDB [staff]> select distinct DNum from staff;
+------+
| DNum |
+------+
|    4 |
|    5 |
+------+
2 rows in set (0.001 sec)

MariaDB [staff]> select distinct Salary from staff;
+----------+
| Salary   |
+----------+
| 30000.00 |
| 40000.00 |
| 25000.00 |
| 38000.00 |
| 43000.00 |
+----------+
5 rows in set (0.001 sec)

MariaDB [staff]>  select * from staff order by
    -> DNum asc,Salary asc;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 99887 | Aila       | Shed      | 25000.00 |    4 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
| 53453 | Joy        | Dilan     | 25000.00 |    5 |
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
+-------+------------+-----------+----------+------+
6 rows in set (0.001 sec)

MariaDB [staff]> select DNum,count(*) as Staff_Count from staff group by DNum;
+------+-------------+
| DNum | Staff_Count |
+------+-------------+
|    4 |           2 |
|    5 |           4 |
+------+-------------+
2 rows in set (0.001 sec)

MariaDB [staff]> select DNum,sum(Salary) as Total_Salary from staff group by DNum;
+------+--------------+
| DNum | Total_Salary |
+------+--------------+
|    4 |     68000.00 |
|    5 |    133000.00 |
+------+--------------+
2 rows in set (0.001 sec)

MariaDB [staff]> select DNum,avg(Salary) as Avg_Salary from staff group by DNum;
+------+--------------+
| DNum | Avg_Salary   |
+------+--------------+
|    4 | 34000.000000 |
|    5 | 33250.000000 |
+------+--------------+
2 rows in set (0.001 sec)

MariaDB [staff]> select concat(First_Name,' ',Last_Name) as Full_Name from staff;
+----------------+
| Full_Name      |
+----------------+
| Jerrish Sharan |
| Dinith Wreck   |
| Joy Dilan      |
| Ramya Naresh   |
| Jennifer Mercy |
| Aila Shed      |
+----------------+
6 rows in set (0.001 sec)

MariaDB [staff]> select concat(First_Name,' ',Last_Name,'-',Salary) as Full_Name from staff;
+-------------------------+
| Full_Name               |
+-------------------------+
| Jerrish Sharan-30000.00 |
| Dinith Wreck-40000.00   |
| Joy Dilan-25000.00      |
| Ramya Naresh-38000.00   |
| Jennifer Mercy-43000.00 |
| Aila Shed-25000.00      |
+-------------------------+
6 rows in set (0.001 sec)

MariaDB [staff]> select  first_Name from staff where DNum=5;
+------------+
| first_Name |
+------------+
| Jerrish    |
| Dinith     |
| Joy        |
| Ramya      |
+------------+
4 rows in set (0.001 sec)

MariaDB [staff]> select  first_Name,Last_Name from staff where DNum=5;
+------------+-----------+
| first_Name | Last_Name |
+------------+-----------+
| Jerrish    | Sharan    |
| Dinith     | Wreck     |
| Joy        | Dilan     |
| Ramya      | Naresh    |
+------------+-----------+
4 rows in set (0.001 sec)

MariaDB [staff]> select  first_Name,Last_Name from staff where Salary>35000;
+------------+-----------+
| first_Name | Last_Name |
+------------+-----------+
| Dinith     | Wreck     |
| Ramya      | Naresh    |
| Jennifer   | Mercy     |
+------------+-----------+
3 rows in set (0.001 sec)

MariaDB [staff]> select  Last_Name from staff where Salary>35000;
+-----------+
| Last_Name |
+-----------+
| Wreck     |
| Naresh    |
| Mercy     |
+-----------+
3 rows in set (0.001 sec)

MariaDB [staff]> select  Last_Name from staff where Salary between 35000 and 40000;
+-----------+
| Last_Name |
+-----------+
| Wreck     |
| Naresh    |
+-----------+
2 rows in set (0.001 sec)

MariaDB [staff]> select * from staff where Salary between 35000 and 40000;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
+-------+------------+-----------+----------+------+
2 rows in set (0.001 sec)

MariaDB [staff]> select * from staff where First_Name like 'J%';
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 53453 | Joy        | Dilan     | 25000.00 |    5 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
+-------+------------+-----------+----------+------+
3 rows in set (0.001 sec)

MariaDB [staff]> select * from staff where First_Name like '%J';
Empty set (0.000 sec)

MariaDB [staff]> select * from staff where First_Name like '%r';
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
+-------+------------+-----------+----------+------+
1 row in set (0.001 sec)

MariaDB [staff]> select * from staff where Last_Name like '%j';
Empty set (0.001 sec)

MariaDB [staff]> select * from staff where Last_Name like '%h';
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
+-------+------------+-----------+----------+------+
1 row in set (0.001 sec)

MariaDB [staff]> select * from staff where Salary !=25000
    -> ;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
+-------+------------+-----------+----------+------+
4 rows in set (0.001 sec)

MariaDB [staff]> select * from staff where DNum=4 or 5;
+-------+------------+-----------+----------+------+
| SSN   | First_Name | Last_Name | Salary   | DNum |
+-------+------------+-----------+----------+------+
| 12345 | Jerrish    | Sharan    | 30000.00 |    5 |
| 33445 | Dinith     | Wreck     | 40000.00 |    5 |
| 53453 | Joy        | Dilan     | 25000.00 |    5 |
| 66884 | Ramya      | Naresh    | 38000.00 |    5 |
| 87654 | Jennifer   | Mercy     | 43000.00 |    4 |
| 99887 | Aila       | Shed      | 25000.00 |    4 |
+-------+------------+-----------+----------+------+
6 rows in set (0.001 sec)

MariaDB [staff]> select min(Salary) from staff;
+-------------+
| min(Salary) |
+-------------+
|    25000.00 |
+-------------+
1 row in set (0.001 sec)

MariaDB [staff]> select max(Salary) from staff;
+-------------+
| max(Salary) |
+-------------+
|    43000.00 |
+-------------+
1 row in set (0.001 sec)

MariaDB [staff]> select count(*) as StaffCount from staff where Salary>(select avg(salary) from staff);     --21st
+------------+
| StaffCount |
+------------+
|          3 |
+------------+
1 row in set (0.001 sec)

MariaDB [staff]> select DNum from staff group by DNum having count(*)>2;   --22nd
+------+
| DNum |
+------+
|    5 |
+------+
1 row in set (0.001 sec)
    
MariaDB [staff]> select DNum from staff group by DNum having sum(Salary)>70000;       --23rd
+------+
| DNum |
+------+
|    5 |
+------+
1 row in set (0.001 sec)

MariaDB [staff]> select DNum from staff group by DNum having sum(Salary)>50000;      
+------+
| DNum |
+------+
|    4 |
|    5 |
+------+
2 rows in set (0.001 sec)

MariaDB [staff]> select MAX(Salary) as Second_Salary from staff where Salary<(select max(Salary) from staff);
+---------------+
| Second_Salary |
+---------------+
|      40000.00 |
+---------------+
1 row in set (0.001 sec)


