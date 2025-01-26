create database perrson;
use perrson;
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
Country_Name varchar(90),
DOB date);

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
(300,'Ali','Muhammed','70%','2.4','6000','india','200-04-12'),
(301,'Avni','Ayesha','50%','3.2','6001','america','1999-02-10'),
(302,'Anusha','Ibrahim','40%','3.9', '6002','china','2000-12-03'),
(303,'Arun','Sujada','3.1%','2.1','6003','pakistan','1998-03-20'),
(304,'Arnav','Singh','49%','2.4','6004','qatar','2000-06-20'),
(305,'Sruthi','Singh','0.81%','3.3','6005','france','1997-02-20'),
(306,'Ayisha','Fathima','0.47%','4.1','6006','angola','1996-09-10'),
(307,'Summaya','Razak','2.3%','3.8','6007','iceland','2001-10-12'),
(308,'Sana','Fathima','0.36%','4.3','6008','nepal','2003-01-10'),
(309,'Diya','Fathima','0.04%','2.4','6009','armenia','2004-01-12');
drop table persons;
#2. Write a user-defined function to calculate age using DOB.
delimiter // 
create function CalculateAge(DOB date)
returns int
deterministic
no sql
begin
declare Age int;
set Age = timestampdiff(year,DOB,curdate());
 RETURN AGE;
 END //
 DELIMITER ;
 select id,fname,lname,DOB,CalculateAge(DOB) as age from persons;
 
# 3. Write a select query to fetch the Age of all persons using the function that has been created. 
select id,fname,lname,DOB,CalculateAge(DOB) as age from persons;

#4. Find the length of each country name in the Country table. 
select country_name,length(country_name) as length_of_countryname from country;

#5. Extract the first three characters of each country's name in the Country table.
select country_name,substr(country_name,1,3) as three_first_countryname from country;

#6. Convert all country names to uppercase and lowercase in the Country table.
select country_name, upper(country_name) as upper_name, lower(country_name) as lower_name from country;

