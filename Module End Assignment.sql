create database library;
use library;

 -- TABLE 1
 create table Branch(
 Branch_no int auto_increment primary key,
 Manager_id int ,
 Branch_Addresss varchar(30),
 contact_no varchar(10) default null
 );

 -- TABLE 2
 create table Employee(
 Emp_ID int primary key,
 Emp_Name varchar(30),
 Position varchar(20),
 Salary  decimal(10,2),
 Branch_no int,
 foreign key (Branch_no) references branch(branch_no)
 );
 
 -- TABLE 3
 create table Books(
 ISBN varchar(20) primary key,
 Book_Title varchar(30),
 Category varchar(20),
 Rental_price decimal(10,2),
 Status enum('Yes','No') default 'Yes',
 author varchar(20),
 Publisher  varchar(20)
 );
 
 -- TABLE 4
 create table customer(
 Customer_ID int primary key,
 Customer_Name varchar(30),
 Customer_Address varchar(50),
 Reg_date date 
 );
 
 -- TABLE 5
 create table IssueStatus(
 Issue_ID INT primary key,
 Issued_cust int,
 Issued_book_name varchar(30),
 Issue_date date,
 ISBN_Book varchar(20),
 foreign key(Issued_cust) references customer(customer_id),
 foreign key(ISBN_Book) references books(ISBN));
 
 -- TABLE 6
 create table ReturnStatus(
 Return_id int primary key,
 Return_cust int,
 Return_Book_Name varchar(30),
 Return_date date,
 ISBN_book2 varchar(20),
 foreign key(isbn_book2) references books(isbn));  
 
 -- INSERTING VALUES 
INSERT INTO Branch (Manager_Id, Branch_Addresss, Contact_no) VALUES
(101, 'Downtown', '1234567890'),
(102, 'Uptown', '2345678901'),
(103, 'Westside', '3456789012'),
(104, 'Eastside', '4567890123'),
(105, 'Central', '5678901234');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice Johnson', 'Manager', 60000, 1),
(2, 'Bob Smith', 'Assistant', 45000, 2),
(3, 'Charlie Brown', 'Clerk', 35000, 3),
(4, 'David White', 'Librarian', 40000, 4),
(5, 'Emma Davis', 'Clerk', 30000, 5); 

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 10, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-14-017739-8', '1984', 'Dystopian', 12, 'Yes', 'George Orwell', 'Penguin'),
('978-0-7432-7356-5', 'The Da Vinci Code', 'Mystery', 15, 'No', 'Dan Brown', 'Doubleday'),
('978-0-399-15030-6', 'To Kill a Mockingbird', 'Classic', 8, 'Yes', 'Harper Lee', 'J.B. Lippincott'),
('978-0-345-39180-3', 'A Game of Thrones', 'Fantasy', 18, 'No', 'George R.R. Martin', 'Bantam');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(101, 'John Doe', '123 Elm St', '2024-01-15'),
(102, 'Jane Smith', '456 Maple St', '2024-02-01'),
(103, 'Robert Brown', '789 Oak St', '2023-12-20'),
(104, 'Emily Johnson', '321 Pine St', '2024-01-10'),
(105, 'Michael White', '654 Cedar St', '2023-11-25');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(201, 101, 'The Great Gatsby', '2024-02-10', '978-3-16-148410-0'),
(202, 102, '1984', '2024-02-05', '978-0-14-017739-8'),
(203, 103, 'To Kill a Mockingbird', '2024-01-25', '978-0-7432-7356-5'),
(204, 104, 'The Da Vinci Code', '2024-02-01', '978-0-399-15030-6'),
(205, 105, 'The Midnight Library', '2024-01-18', '978-0-345-39180-3');


INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2) VALUES
(1, 1, 'The Great Gatsby', '2024-02-15', '978-3-16-148410-0'),
(2, 2, '1984', '2024-02-10', '978-0-14-017739-8'),
(3, 3, 'To Kill a Mockingbird', '2024-01-30', '978-0-7432-7356-5'),
(4, 4, 'The Da Vinci Code', '2024-02-05', '978-0-399-15030-6'),
(5, 5, 'The Midnight Library', '2024-01-22', '978-0-345-39180-3');


# Display all the tables and Write the queries for the following :
-- 1. Retrieve the book title, category, and rental price of all available books. 
 
 show tables;
 select book_title, category, rental_price from books where status = 'Yes';
 
 -- 2. List the employee names and their respective salaries in descending order of salary.
 select Emp_name, salary from employee order by salary desc;
 
 -- 3. Retrieve the book titles and the corresponding customers who have issued those books.
 select issuestatus.issued_book_name as Book_Title, customer.customer_name as Issued_by from issuestatus 
 join
 customer on issuestatus.issued_cust = customer.customer_id;
 
 -- 4. Display the total count of books in each category.
 select  category,count(*) as total_books from books group by category;
 
 -- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
 select emp_name,position from employee where salary > 50000;
 
 -- 6. List the customer names who registered before 2024-01-01 and have not issued any books yet. 
 select customer_name from customer where reg_date <'2024-01-01' and customer_id not in(select issued_cust from issuestatus);
 
 -- 7. Display the branch numbers and the total count of employees in each branch. 
 select branch_no,count(emp_id) as total_employees from employee group by branch_no;
 
 -- 8. Display the names of customers who have issued books in the month of June 2023. 
 select c.customer_name from customer c 
 join issuestatus i on c.customer_id = i.issued_cust 
 where i.issue_date between '2023-06-01' and '2023-06-30';
 
 -- 9. Retrieve book_title from book table containing A Game of Thrones. 
 select * from books where book_title = 'A Game of Thrones';
 
 -- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
 select Branch_no,count(emp_id) as total_employees from employee group by Branch_no having count(emp_id)>5;
 
 -- 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
 select e.emp_name as Manager_name,b.branch_addresss from employee e join branch b on e.emp_id = b.manager_id;
 
 -- 12. Display the names of customers who have issued books with a rental price higher than Rs. 10.
 select c.customer_name from customer c join issuestatus i on c.customer_id = i.issued_cust
 join books b on i.isbn_book = b.isbn where b.rental_price>10;