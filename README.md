# SQL Mini Project – Company Records Analysis

# Project Overview
This project is a SQL-based mini database system designed to simulate real-world business scenarios including employee management, product inventory, customer data, and order transactions.

The project demonstrates strong understanding of:
- SQL fundamentals
- Joins & relationships
- Aggregations & filtering
- Subqueries & CTEs
- Business-driven analysis

---
##  Database: company_records
### Tables Created:
1. **employee**
   - emp_id (PK)
   - name
   - department
   - salary
   - manager_id (Self Join)
   - hire_date

2. **products**
   - product_id (PK)
   - name
   - category
   - price
   - stock

3. **customers**
   - customer_id (PK)
   - name
   - city
   - country

4. **orders**
   - order_id (PK)
   - customer_id (FK)
   - order_date
   - total
   - status

5. **order_items**
   - item_id (PK)
   - order_id (FK)
   - product_id (FK)
   - qty
   - unit_price
##  Key Concepts Used

- ✅ Primary & Foreign Keys
- ✅ Self Join (Employee-Manager relationship)
- ✅ Inner Join & Left Join
- ✅ Aggregate Functions (SUM, AVG, COUNT)
- ✅ GROUP BY & HAVING
- ✅ Subqueries
- ✅ Common Table Expressions (CTE)
- ✅ Window Functions (DENSE_RANK)
# Business Problems Solved
###  Employee Analysis
- List employees by department and salary
- Find employees earning above average salary
- Identify manager-employee relationships
- Department-wise salary analysis
###  Product Analysis
- Identify out-of-stock products
- List top expensive products
- Category-wise product distribution
###  Customer & Orders Analysis
- Total orders per customer
- Customers with no orders
- Monthly revenue trends
- Orders with customer details
###  Advanced Queries
- 2nd highest salary
- Employees earning above department average
- Revenue per customer
- Products never ordered
- Monthly highest revenue
##  Sample Insights
- IT department has highest average salary
- Certain products are never ordered → potential inventory waste
- Few customers contribute majority of revenue
- Some employees earn significantly above department average
## 🛠 Tools Used
- MySQL
- SQL Workbench / MySQL CLI
##  How to Run
1. Create database:
```sql
CREATE DATABASE company_records;
USE company_records;
