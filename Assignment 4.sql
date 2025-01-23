create database persons;
use persons;
create table Country(
ID varchar(90) primary key,
Country_Name varchar (90) unique,
Population varchar(90) unique,
Area varchar(90)
);

create table Persons(
ID varchar (90) unique,
Fname varchar(90),
Lname varchar(90),
Population varchar(90),
Rating varchar(20),
Country_ID varchar(90),
Country_Name varchar(90)
);

insert into country values
(6000,'India','70%','32,87,263'),
(6001,'America','50%','3,809,525'),
(6002,'China','40%','9.597'),
(6003,'Pakistan', '3.1%','88,913'),
(6004,'Qatar','49%','11,571'),
(6005,'France','0.81%','551,695'),
(6006,'Angola','0.47%','1.27'),
(6007,'IceLand','2.3%','103,000'),
(6008,'Nepal','0.36%','147,181'),
(6009,'Armenia','0.04%','29,743');

insert into persons values
(100,'Ali','Muhammed','70%','2.4','6000','india'),
(101,'Avni','Ayesha','50%','3.2','6001','america'),
(102,'Anusha','Ibrahim','40%','3.9', '6002','china'),
(103,'Arun','Sujada','3.1%','2.1','6003','pakistan'),
(104,'Arnav','Singh','49%','2.4','6004','qatar'),
(105,'Sruthi','Singh','0.81%','3.3','6005','france'),
(106,'Ayisha','Fathima','0.47%','4.1','6006','angola'),
(107,'Summaya','Razak','2.3%','3.8','6007','iceland'),
(108,'Sana','Fathima','0.36%','4.3','6008','nepal'),
(109,'Diya','Fathima','0.04%','2.4','6009','armenia');
select * from persons;

#(1)List the distinct country names from the Persons table
select distinct country_name from persons;

#(2)Select first names and last names from the Persons table with aliases. 
select (fname) as First_name,(lname)as last_name from persons;

#(3)Find all persons with a rating greater than 4.0.
select *  from persons where rating>4.0;


#(4)Find countries with a population greater than 32,87,263.
select country_name,population from country  where population>'32,87,263';

#(5)Find persons who are from 'pakistan' or have a rating greater than 4.0.
select country_name,rating  from persons where country_name='pakistan'or rating>4.0 ;

#(6)Find all persons where the country name is NULL.
 select * from persons where country_name is null;
 
 #(7)Find all persons from the countries 'Pakistan', 'China', and 'america'.
select  * from persons where country_name in ('Pakistan', 'China', 'america') ;

#(8)Find all persons not from the countries 'Ice land' and 'nepal'.
select *from persons where country_name not in ('iceland','nepal');

#(9)Find all countries with a population between 40% and 60%
select * from country where population between '40%' and '60%';

#(10)Find all countries whose names do not start with 'C'.
select *from persons where country_name not like 'C%';


