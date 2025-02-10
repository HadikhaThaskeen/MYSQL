use country;
create table worker(
Worker_Id INT,
FirstName CHAR(25), 
LastName CHAR(25), 
Salary INT,
JoiningDate DATETIME, 
Department CHAR(25));

-- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
delimiter //
create procedure addworker(in p_Worker_ID int,in p_firstname char(25),in p_lastname char(25),in p_salary int,in p_joiningdate datetime,in p_Department char(25)
)
begin
insert into worker(worker_id,firstname,lastname,salary,joiningdate,department) values
(p_worker_id,p_firstname,p_lastname,p_salary,p_joiningdate,p_department);
end //
delimiter ;

call addworker(1,'John','doe',50000,'2024-02-10 09:00:00','HR');
select * from worker;

-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call. 
delimiter //
create procedure getworkersalary(in p_worker_id int,out p_salary int)
begin
select salary into p_salary from worker where worker_id = p_worker_id;
end //
delimiter ;

# Declare a variable to store the salary
set @salary =0;
call getworkersalary(1,@salary);

# display the retrieved salary
select @salary as workersalary;

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call. 
 delimiter //
create procedure updatedepartment(in p_worker_id int,in p_department varchar(25))
begin
update worker
set department = p_department
where worker_id = p_worker_id ;
end //
delimiter ;

 -- call stored procedure
 call updatedepartment(1,'finance');
 
 select * from worker;
 
-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.

delimiter //
create procedure workercount(in p_department varchar(25),out p_worker_count int)
begin
select count(*) into p_worker_count from worker
where department = p_department;
end //
delimiter ;

# declare a variable 
set @workercount = 0 ;
call workercount('finance',@workercount);
select @workercount as finance_count;

# inserting more values
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(2, 'Jane', 'Smith', 60000, '2022-07-20 10:30:00', 'Finance'),
(3, 'Robert', 'Brown', 55000, '2021-06-18 08:45:00', 'IT'),
(4, 'Emily', 'Davis', 48000, '2020-09-25 11:15:00', 'Marketing'),
(5, 'Michael', 'Wilson', 62000, '2019-03-12 09:45:00', 'Finance'),
(6, 'Sarah', 'Taylor', 51000, '2021-11-30 10:00:00', 'HR'),
(7, 'David', 'Anderson', 53000, '2022-04-05 08:00:00', 'IT'),
(8, 'Sophia', 'Martinez', 59000, '2020-08-17 11:45:00', 'Marketing'),
(9, 'Daniel', 'Thomas', 57000, '2018-12-22 09:30:00', 'Finance'),
(10, 'Olivia', 'Harris', 49000, '2023-02-14 10:15:00', 'HR');

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.
delimiter //
create procedure average_salary(in p_department varchar(25), out p_avgSalary decimal(10,2))
begin
select avg(salary) into p_avgSalary from worker
where department = p_department;
end //
delimiter ;

# declare a variable
set @avgsalary =0;
call average_salary('finance',@avgsalary);
select @avgsalary as average_salary_of_finance;