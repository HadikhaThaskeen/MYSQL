use pc;

-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.
create table Teachers(
ID int auto_increment primary key,
Name varchar(20),
Subject varchar(20),
Experience int ,
salary decimal(10,2));

INSERT INTO teachers (name, subject, experience, salary) VALUES
('John Smith', 'Mathematics', 10, 55000.00),
('Emma Johnson', 'English', 8, 48000.00),
('Michael Brown', 'Science', 12, 60000.00),
('Sophia Davis', 'History', 6, 45000.00),
('William Wilson', 'Physics', 15, 70000.00),
('Olivia Martinez', 'Chemistry', 9, 52000.00),
('James Anderson', 'Computer Science', 5, 50000.00),
('Emily Thomas','Biology',11,58000.00);

-- . 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.
delimiter //
create trigger before_insert_teacher
before insert on teachers
for each row 
begin
if new.salary < 0 then
signal sqlstate '45000'
set message_text = 'Salary Cannot Be Negative';
end if;
end //
delimiter ;

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 
create table TeacherLog (
logid int auto_increment primary key,
Teacher_ID int,
actiontype varchar(20),
actiontime timestamp default current_timestamp,
foreign key (teacher_id) references teachers(id));

# after insert trigger
delimiter //
create trigger after_insert_teacher 
after insert on teachers
for each row
begin
insert into teacherlog(actiontype,teacher_id) values
('Insert',new.ID);
end //
delimiter ;

-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 
delimiter //
create trigger before_delete_trigger
before delete on teachers 
for each row
begin
if old.experience >10 then
signal sqlstate '45000'
set message_text = 'Cannot delete teacher with more then 10 years of experience';
end if;
end//
delimiter ;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
delimiter //
create trigger after_teacher_delete 
after delete on teachers 
for each row 
begin
insert into teacherlog(actiontype,teacher_id) values
('delete',old.ID);
end //
delimiter ;


