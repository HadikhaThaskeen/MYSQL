 create database School;
 use School;
 # creating a table
 create table Student(
 Roll_no int primary key auto_increment,
 Name_Student  varchar(50) not null,
 Marks int check(Marks>0),
 Grade varchar(3) default(0)
 );
 desc student;
 
 #1)select
select * from Student;
  
#2)adding a colmn using alter command
alter table Student add column Contact int unique;

#3)removing the grade column using alter command
alter table Student drop column grade;

#4) renameing the table
rename table Student to CLASSTEN;

DESC classten;

#5) Removing all the rows using truncate command
truncate table classten;

#6) Removing the table from the database
Drop table classten;

 