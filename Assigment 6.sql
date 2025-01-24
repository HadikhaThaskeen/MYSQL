use sys;
create table Countryy(
ID varchar(90) primary key,
Country_Name varchar (90) unique,
Population varchar(90) unique,
Area varchar(90)
);

create table Personns(
ID varchar (90) unique,
Fname varchar(90),
Lname varchar(90),
Population varchar(90),
Rating varchar(20),
Country_ID varchar(90),
Country_Name varchar(90)
);

insert into countryy values
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

insert into personns values
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

#(1)Perform inner join, Left join, and Right join on the tables. 
# a) inner join
select personns.Id as personns_id, personns.fname,personns.lname,personns.rating,countryy.country_name,countryy.population,countryy.area from personns 
inner join countryy on personns.country_id = countryy. ID;

# b) left join
select personns.Id as personns_id, personns.fname,personns.lname,personns.rating,countryy.country_name,countryy.population,countryy.area from personns 
left join countryy on personns.country_id = countryy. ID;

# c) right join
select personns.Id as personns_id, personns.fname,personns.lname,personns.rating,countryy.country_name,countryy.population,countryy.area from personns 
right join countryy on personns.country_id = countryy. ID;

#(2)List all distinct country names from both the Country and Persons tables
select distinct country_name  as country from countryy union select distinct country_name  as p_country from personns;

#(3)List all country names from both the Country and Persons tables, including duplicates. 
select country_name from Countryy union all select country_name from personns;

#(4)Round the ratings of all persons to the nearest integer in the Persons table.
select id,fname,lname,rating , round(rating) as Rounded_Rating from personns ;