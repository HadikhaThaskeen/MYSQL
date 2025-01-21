use testdb;
create table Managers(
Manager_ID varchar(30) primary key ,
First_Name varchar(90),
Last_name varchar(90),
DOB date,
Age  int check (age >18),
Last_Updated varchar(90),
Gender char(1) check (Gender in ( 'M','F','O')),
Department varchar(90),
Salary int not null);

# inserting 10 rows
 insert into Managers values
 (2021,'Hiba','Fathima','2004-09-12','20','Yesterday','F','Sales Management','50000'),
 (2022,'Larry','Harry','2000-08-10','23','Yesterday','M','IT','40000'),
 (2023,'Luna','Fathima','1999-04-16','30','Today','F','Marketing','40000'),
 (2024,'Shan','Muhammed','2005-09-07','20','Two days before','M','Design', '70000'),
 (2025,'Rifa','Fathima','2000-01-10','24','Yesterday','F','IT','40000'),
 (2026,'Shana','Sherin','1999-06-09','30','Today','F','Sales Management','50000'),
 (2027,'Riya','Fathima','1998-09-08','33','Twodays before','F','Design','30000'),
 (2028,'Asha','Mehrin','1997-09-06','26','Today','F','Product Managemnet','40000'),
 (2029,'Ayisha','Fathima','1999-01-20','29','Yesterday','F','Store Department','30000'),
 (2030,'Asish','Varma','2000-10-20','23','Yesterday','M','Sales Managment','40000');
 select * from managers;
 
 # 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.
 select first_name,last_name,DOB from managers where Manager_ID = 2021 ;

# 3) Write a query to display the annual income of all managers.
select concat(first_name,' ', last_name) as Full_Name, salary from managers;
 
 #4)Write a query to display records of all managers except ‘Riya’.
 select  * from Managers where manager_id<>2027;
 
# 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month
select * from Managers where department='IT' and Salary >25000;

 #6. Write a query to display details of managers whose salary is between 20000 and 40000.
 select * from managers where salary between '20000'and '40000';