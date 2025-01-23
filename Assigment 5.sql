use country;
create table countrry(
ID  int primary key,
Country_Name varchar(30),
Population int,
Area int);

create table personss (
Id int primary key,
Fname varchar(20),
Lname varchar(20),
Population int ,
Rating decimal (10,2),
Country_Id int,
Country_name varchar(20));

insert into countrry values
(6000,'India','70','3287263'),
(6001,'America','50','3809525'),
(6002,'China','40','9597'),
(6003,'Pakistan', '30','88913'),
(6004,'Qatar','49','11571'),
(6005,'France','21','551695'),
(6006,'Angola','47','10027'),
(6007,'IceLand','23','103000'),
(6008,'Nepal','36','147181'),
(6009,'Armenia','10','29743');

insert into personss values
(200,'Ali','Muhammed','70','1.2','6000','india'),
(201,'Avni','Ayesha','50','2.1','6001','america'),
(202,'Anusha','Ibrahim','40','1.9', '6002','china'),
(203,'Arun','Sujada','30','2.1','6003','pakistan'),
(204,'Arnav','Singh','49','2.4','6004','qatar'),
(205,'Sruthi','Singh','21','3.3','6005','france'),
(206,'Ayisha','Fathima','47','4.1','6006','angola'),
(207,'Summaya','Razak','23','3.8','6007','iceland'),
(208,'Sana','Fathima','36','4.3','6008','nepal'),
(209,'Diya','Fathima','10','2.4','6009','armenia');

#1. Write an SQL query to print the first three characters of Country_name from the Countrry table.
select * from countrry order by country_name limit 3;

#2. Write an SQL query to concatenate first name and last name from Personss table.
select fname,lname,concat(fname,' ',lname) as full_name from personss ;

#3. Write an SQL query to count the number of unique country names from Persons table.
select  count(distinct country_name) as unique_countryname_count from personss;

# 4. Write a query to print the maximum population from the Country table.
select max(population) as maximum_population from countrry;

#5. Write a query to print the minimum population from Personss table.
select min(population) as miminum_population from personss;

#6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
insert into personss (id,fname,population,rating,country_id,country_name) values
(210,'Izza','30','2.2','6010','Argentina'),
(211,'Fathima','20','1.6','6011','Andorra');
select * from personss;
select count(lname) as last_name from personss;

# 7. Write a query to find the number of rows in the Persons table.
select count(*) as total_rows from personss;

#8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)
select * from countrry order by (population) desc limit 3;

#9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 10. List all persons ordered by their rating in descending order.
select * from countrry order by rand() limit 3;

#10. List all persons ordered by their rating in descending order.
select * from personss order by (rating) desc;

# 11. Find the total population for each country in the Persons table. 
select  country_name,sum(population) as total_population from personss group by(country_name); 

#12. Find countries in the Persons table with a total population greater than 50
select country_name, sum(population) as total_polulation from personss group by(country_name) having sum(population)>50;

 #13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
 select  count(*) as total_persons, avg(rating) as average_rating from personss group by country_name having count(*)>2 order by average_rating;
 insert into personss values(212,'Diya','Fathima','10','2.4','6012','armenia'),(213,'Diya','Fathima','10','2.4','6013','armenia');