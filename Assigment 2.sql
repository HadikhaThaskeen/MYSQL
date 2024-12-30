create database Sales;
use Sales;
create table Orders(
Order_id int primary key ,
Customer_name varchar(30) not null,
Product_Category varchar(30),
Ordered_Items int check (ordered_items>0),
Contact_Number int unique not null);

# 1) adding a new column named "order_quantity” to the orders table
alter table Orders add column order_quantity int default(null);

# 2)  Rename the orders table to the sales_orders table. 
rename table Orders to Sales_Orders;

# 3)Insert 10 rows into the sales_orders table
insert into sales_orders values
('100','Fathima','Electronics','2','1234567','1'),
('101','Hanan','Electronics','4','908765','2'),
('102','Nisha','Books','3','786543','9'),
('103','Hanna','Toys','7','9870654','2'),
('104','Jabbar','Games','8','234567','7'),
('105','Dua','Toys','8','213456','6'),
('106','Mehr','Toothpaste','4','76589','6'),
('107','Hari','Electronics','3','87907','2'),
('108','Reena','Toys','4','34567','9'),
('109','Anna','Toys','9','926543','7');

select * from sales_orders;

# 4) Retrieve customer_name and Ordered_Item from the sales_orders table. 
Select customer_name,ordered_items from Sales_Orders;

# 5)  Use the update command to change the name of the product for any row
update sales_orders set contact_number = '7456789' where order_id = 100;

# 6) Delete the sales_orders table from the database.
drop  table sales_orders;