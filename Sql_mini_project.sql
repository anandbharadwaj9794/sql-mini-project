create database company_records;

Use company_records; 

-- 1. Emplopyee Table
Create table employee(
emp_id int primary key,
name varchar(50) not null,
department varchar(50) not null,
salary int not null,
manager_id int,
Hire_date date,
constraint foreign key(manager_id) references employee(emp_id));

INSERT INTO employee(emp_id, name, department, salary, manager_id, Hire_date) VALUES
(1, 'Arjun', 'IT', 85000, NULL, '2020-06-15'),  -- Manager
(5, 'Vikram', 'Sales', 90000, NULL, '2019-11-01'), -- Manager
(2, 'Priya', 'IT', 72000, 1, '2021-03-10'),
(3, 'Rahul', 'Sales', 55000, 5, '2022-01-20'),
(4, 'Sneha', 'HR', 60000, 5, '2021-07-08'),
(6, 'Divya', 'IT', 68000, 1, '2023-02-14'),
(7, 'Kiran', 'HR', 58000, 4, '2022-08-30'),
(8, 'Meera', 'Sales', 62000, 5, '2023-05-12');

	-- 2. Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price INT,
    stock INT
);

-- 3. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- 4. Orders Table (Links to Customers)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total INT,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 5. Order Items Table (Links to Orders and Products)
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    qty INT,
    unit_price INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products VALUES
(1, 'iPhone 15', 'Electronics', 79999, 50),
(2, 'SQL Book', 'Books', 499, 200),
(3, 'Headphones', 'Electronics', 2999, 75),
(4, 'Notebook', 'Stationery', 99, 500),
(5, 'Laptop', 'Electronics', 65000, 20),
(6, 'Pen Set', 'Stationery', 149, 0);

INSERT INTO customers VALUES
(1, 'Ananya', 'Hyderabad', 'India'),
(2, 'Rohan', 'Bangalore', 'India'),
(3, 'Sam', 'Mumbai', 'India'),
(4, 'Lisa', 'London', 'UK'),
(5, 'Ravi', 'Delhi', 'India');

INSERT INTO orders VALUES
(1, 1, '2024-01-15', 79999, 'completed'),
(2, 2, '2024-01-20', 3498, 'completed'),
(3, 1, '2024-02-10', 65000, 'completed'),
(4, 3, '2024-02-14', 499, 'pending'),
(5, 2, '2024-03-01', 248, 'completed'),
(6, 5, '2024-03-15', 2999, 'shipped'),
(7, 1, '2024-04-05', 149, 'completed');

INSERT INTO order_items VALUES
(1, 1, 1, 1, 79999),
(2, 2, 3, 1, 2999),
(3, 2, 2, 1, 499),
(4, 3, 5, 1, 65000),
(5, 4, 2, 1, 499),
(6, 5, 4, 2, 99),
(7, 5, 6, 1, 50),
(8, 6, 3, 1, 2999);

Select * from employee;
Select * from products;
Select * from customers;
Select * from orders;
Select * from order_items;

-- 1.List all employees with their department and salary.
Select name , department,salary from employee;

-- 2. Show only the name and hire_date of every employee.
Select name,hire_date from employee;

-- 3. Find all employees in the 'Sales' department.
Select name,department from employee where department ="sales";

-- 4. List all products with price under ₹1,000.
Select name, price from products where price > 1000;

-- 5. Find all customers from India.
select name,country from customers where country = "India";

-- 6. Show employees hired after 2022-01-01.
select name,department,hire_date from employee where hire_date > "2022-01-01";

-- 7. List all distinct product categories.
select distinct(category) from products;

-- 8. Find orders with status = 'pending'.
Select order_id from orders where status = "Pending";

-- 9.  Find employees whose name starts with 'A'.
Select name,department from employee where name like "a%";

-- 10.  Find products that are out of stock (stock = 0).
Select name,category from products where stock = 0;

-- 11.List all employees sorted by salary — highest first.
Select name, department,salary from employee order by salary desc;

-- 12. Show the top 3 most expensive products.
Select name,category,price from products order by price desc limit 3;

-- 13. Find employees with salary between ₹60,000 and ₹80,000.
select name,department,salary from employee where salary between 60000 and 80000;

-- 14. List employees NOT in the 'IT' department.
Select name,department from employee where department not in("it");

-- 15. Find employees who have a manager (manager_id is not null).
SELECT 
    e.name AS Employee_Name, 
    m.name AS Manager_Name, 
    e.department
FROM employee e
JOIN employee m ON e.manager_id = m.emp_id;


-- 16. Count how many employees are in each department.
Select count(emp_id), department from employee group by department;

-- 17. What is the average salary per department, ordered highest first?
Select avg(salary) avg_salary, department from employee group by department order by avg_salary desc;

-- 18. Which department has the highest total payroll?
Select sum(salary) total_payroll, department from employee group by department order by total_payroll desc;

-- 19. How many orders has each customer placed?
Select count(o.order_id) total_orders, c.name from orders o join customers c on c.customer_id = o.customer_id group by c.name order by total_orders desc ;

-- 20.What is the total revenue from all completed orders?
Select sum(total) total_revenue from orders where status = "completed";

-- 21. Show each employee's name and their manager's name.
Select e.name employee_name, m.name manager_name from employee e join employee m on e.manager_id = m.emp_id;

-- 22. Which customers have placed at least one order?
Select count(o.order_id) orders ,c.name  from orders o join customers c on c.customer_id = o.order_id group by c.name having orders=1;

-- 23.  Which customers have NEVER placed an order?

SELECT 
    c.name
FROM
    customers c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL;

-- 24.Show each order with the customer name.
SELECT c.name, o.order_id, o.order_date, o.total, o.status FROM orders o JOIN customers c ON o.customer_id = c.customer_id ORDER BY o.order_date;

-- 25. List each order item with customer name, product name, qty, unit price.
SELECT 
    c.name customer_name, p.name product_name, ot.qty Order_quantity, ot.unit_price Unit_price
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_items ot ON o.order_id = ot.order_id
        JOIN
    products p ON p.product_id = ot.product_id; 
    
-- 26. Find products that have been ordered at least once.

SELECT 
   distinct p.name
FROM
    products p
        JOIN
    order_items ot ON p.product_id = ot.product_id
        JOIN
    orders o ON o.order_id = ot.order_id; 
    
    
-- 27. Find products that have NEVER been ordered.
SELECT 
    p.name
FROM
    products p
       left JOIN
    order_items ot ON p.product_id = ot.product_id;
   

-- 28.Show total revenue per customer, highest first.
SELECT 
    c.name, SUM(o.total) total_revenue
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_revenue DESC;

-- 29. Which month had the highest revenue in 2024?
SELECT 
    SUM(total) highest_revenue, MONTHNAME(order_date) month_name
FROM
    orders
WHERE
    YEAR(order_date) = 2024
GROUP BY month_name
ORDER BY highest_revenue DESC;

-- 30.Find employees earning more than the overall average salary.
SELECT 
    name, salary
FROM
    employee
WHERE
    salary > (SELECT 
            AVG(salary) avg_salary
        FROM
            employee);

-- 31. Find employees earning more than their own department average.
with avg_dept_salary
as
 (SELECT 
            AVG(salary) avg_salary, department
        FROM
            employee
        GROUP BY department  
        )
SELECT 
    e.name, 
    e.department, 
    e.salary,
    d.avg_salary
FROM employee e
JOIN avg_dept_salary d ON e.department = d.department
WHERE e.salary > d.avg_salary;

-- 32. Show departments with more than 2 employees.
select count(emp_id) emp_count , department from employee  group by department having emp_count > 2;

-- 33. Get the 2nd highest salary in the company.
select salary from employee  order by salary desc limit 1 offset 1;
SELECT 
    salary 
FROM employee 
ORDER BY salary DESC 
LIMIT 1 OFFSET 1;

-- 34. List all January 2024 orders placed by Indian customers.
SELECT 
    o.order_id,c.name
FROM
    orders o
        JOIN
    customers c ON c.customer_id = o.order_id
WHERE
    YEAR(o.order_date) = '2024'
        AND MONTHNAME(o.order_date) = 'january'
        AND c.country = 'india';

-- 35. Find customers who placed orders in both January AND February 2024.
SELECT 
    c.name customer_name
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    YEAR(order_date) = '2024'
        AND MONTHNAME(order_date) IN ('janauary' , 'february');
        
        Select category, count(category) count_c from products group by category having  count_c>1;
        
        Select department, count(department) dept_c from employee group by department having dept_c>1;
        
        select max(salary) salary_m,department from employee group by department order by salary_m desc ;
        
        Select name,department, salary , dense_rank() over (partition by department order by salary) from employee;
        
select name,department,salary, salary_rank from (select name,department,salary, dense_rank() over(partition by department order by salary desc) salary_rank from employee) ranked_salry	where  salary_rank =2  ;