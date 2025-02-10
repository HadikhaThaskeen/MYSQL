create database pp;
use pp;
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

insert into persons values (310,'manaa','fathi','50%','3.2','6010','america','2000-06-13');
insert into persons values (311,'loo','yusuf','30%','3.2','6011','nepal','1999-01-12');
-- 1. Find the number of persons in each country. 
select c.country_name,count(p.ID) as number_of_persons from country c left join persons p on c.id =p.country_id group by c.country_name;

-- 2. Find the number of persons in each country sorted from high to low.
SELECT c.Country_name, (SELECT COUNT(*) FROM Persons p WHERE p.Country_Id = c.Id) as number_of_persons
FROM Country c
ORDER BY (SELECT COUNT(*) FROM Persons p WHERE p.Country_Id = c.Id) desc;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select country_name,avg_rating from(select country_name,avg(rating)as avg_rating from persons group by country_name) as country_ratings 
where avg_rating >3.0;

-- 4)Find the countries with the same rating as the america. (Use Subqueries)
select distinct country_name,rating from persons where rating in(select rating from persons where country_name = 'america');

-- 5. Select all countries whose population is greater than the average population of all nations. 
select country_name,population from persons where population >(select avg(population) from persons);

# view assignment 
create database product;
use product;
create table customer(
customer_id int primary key,
first_name varchar(20),
last_name varchar(20),
email varchar(20) unique,
phone_no varchar(10) unique,
address varchar(30),
city varchar(20),
state varchar(20),
zip_code varchar(10) default '0000',
country varchar(20));

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view.
create  view customer_info as select concat(first_name,' ',last_name) as full_name,email from customer;
select * from customer_info;


-- 2. Create a view named US_Customers that displays customers located in the US.
create view US_Customer as select * from customer where country = 'USA'; 
SELECT * FROM US_Customer;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
create view Customer_Details as select concat(first_name,' ',last_name) as full_name,email,phone_no,state from customer;

-- 4. Update phone numbers of customers who live in California for Customer_details view. 
update customer set phone_no ='9988772211' where state = 'California' order by customer_id limit 100; 
select * from customer_details where state= 'california';

-- 5. Count the number of customers in each state and show only states with more than 2 customers. 
select state,count(*) as customer_id from customer group by state having count(*)>2;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
select state, count(*) as costomer_count from customer_details group by state;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state asc;


INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)  
VALUES  
(1, 'John', 'Doe', 'john.doe@email.com', '1234567890', '123 Main St', 'Los Angeles', 'California', '90001', 'USA'),  
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2345678901', '456 Oak St', 'San Diego', 'California', '92101', 'USA'),  
(3, 'Michael', 'Johnson', 'michael.j@email.com', '3456789012', '789 Pine St', 'San Francisco', 'California', '94101', 'USA'),  
(4, 'Emily', 'Davis', 'emily.d@email.com', '4567890123', '101 Maple St', 'New York', 'New York', '10001', 'USA'),  
(5, 'Chris', 'Brown', 'chris.b@email.com', '5678901234', '202 Birch St', 'Chicago', 'Illinois', '60601', 'USA'),  
(6, 'Amanda', 'Wilson', 'amanda.w@email.com', '6789012345', '303 Cedar St', 'Miami', 'Florida', '33101', 'USA'),  
(7, 'David', 'Martinez', 'david.m@email.com', '7890123456', '404 Walnut St', 'Dallas', 'Texas', '75201', 'USA'),  
(8, 'Sarah', 'Taylor', 'sarah.t@email.com', '8901234567', '505 Spruce St', 'Seattle', 'Washington', '98101', 'USA'),  
(9, 'Brian', 'Anderson', 'brian.a@email.com', '9012345678', '606 Redwood St', 'Boston', 'Massachusetts', '02101', 'USA');

