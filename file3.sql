use sakila;

CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50),
    Category VARCHAR(20) CHECK (Category IN ('Electronics', 'Home', 'Apparel')),
    OrderDate DATE,
    OrderValue DECIMAL(10, 2)
);

INSERT INTO sales_data (OrderID, CustomerID, Category, OrderDate, OrderValue)
VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

select * from sales_data;

-- Level - 1 {EASY}
-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select sum(ordervalue), category
from sales_data
group by category;

-- Q2. Count the total number of orders placed in each Category.
select category, count(orderid)
from sales_data
group by category;

-- Q3. Find the highest (maximum) single OrderValue within each Category.
select category, max(ordervalue)
from sales_data
group by category;

-- Level - 2 {EASY}
-- Q1. List all unique product Categories that appear in the Sales_Data table.
select distinct(category)
from sales_data;

-- Q2. List all unique CustomerIDs who have placed at least one order.
select distinct(customerid)
from sales_data;

-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct customerid, category
from sales_data
order by customerid;

-- LEVEL 3 — {MEDIUM}
-- Q1. Revenue by CustomerID and Category
select customerid, category, sum(ordervalue) as total_revenue
from sales_data
group by customerid, category;

-- Q2. Order Count by CustomerID and Category
select customerid, category, count(orderid)
from sales_data
group by customerid, category;

-- Q3. Revenue by Category and Month
select category, month(orderdate), sum(ordervalue) as total_revenue
from sales_data
group by category, month(orderdate);

-- Level - 4 {MEDIUM}
-- Q1. Categories with Revenue > $20,000
select category, sum(ordervalue) as total_revenue
from sales_data
group by category
having total_revenue > 20000;

-- Q2. Customers with More Than 1 Order
select customerid, count(OrderID)
from sales_data
group by customerid
having count(OrderID) > 1;

-- Q3. Customer + Category Combinations Spending > $10,000
select CustomerID, category, sum(ordervalue)
from sales_data
group by customerid, category
having sum(OrderValue);

-- level - 5 {HARD}
-- Q1. Category Summary (Avg Order Value > $5,000, sorted by Revenue)
select category, count(orderid), sum(ordervalue) as total_revenue, avg(ordervalue)
from sales_data
group by category
having avg(ordervalue) > 5000;

-- Q2. High-Value Repeat Customers (>1 order, Avg OrderValue > $6,000)
select customerid, count(orderid), avg(ordervalue)
from sales_data
group by customerid
having count(orderid) > 1 and avg(ordervalue) > 6000;

-- Q3. Category-Month Summary (Min 2 Orders, Sorted by Month then Revenue)
select count(orderid), category, month(orderdate), sum(ordervalue) as total_revenue
from sales_data
group by category, month(orderdate)
having count(orderid) >= 2
order by month(orderdate), total_revenue;






-- Easy Question
-- Q1. How many orders were placed in each city? (Sort by city A–Z)
select city, count(order_id)
from orders
group by city
order by city;

-- Q2. What is the total revenue (price × quantity) earned from each category? (Sort by total_revenue DESC)
select category, sum(price * quantity) as total_revenue
from orders
group by category
order by total_revenue desc;

-- Q3. How many orders belong to each category? (Sort by category A–Z)
select category, count(order_id)
from orders
group by category
order by category;

-- Q4. What is the average price of orders in each city? Round to 2 decimal places. (Sort by city A–Z)
select city, round(avg(price), 2)
from orders
group by city
order by city;

-- Q5. What is the maximum price of a product in each category? (Sort by category A–Z)
select category, max(price)
from orders
group by category
order by category;

-- Q6. What is the minimum price of a product ordered in each city? (Sort by city A–Z)
select city, min(price)
from orders
group by city
order by city;

-- Q7. What is the total quantity of items sold per category? (Sort by total_quantity DESC)
select category, sum(quantity) as total_quantity
from orders
group by category
order by total_quantity desc;

-- Q8. List each city along with the total number of items ordered (sum of quantity). (Sort by total_items DESC)
select city, sum(quantity) as total_items
from orders
group by city
order by total_items desc;

-- Intermediate Questions
-- Q9. Find cities that have more than 3 orders. Show city and order count. (Sort by order_count DESC)
select city, count(order_id) as order_count
from orders
group by city
having order_count > 3
order by order_count desc;

-- Q10. Find categories where the total revenue (price × quantity) is more than 50000. (Sort by total_revenue DESC)
select category, sum(price*quantity) as total_revenue
from orders
group by category
having total_revenue > 50000
order by total_revenue desc;

-- Q11. Which cities have an average order price greater than 10000? Show city and avg_price. (Sort by avg_price DESC)
select city, round(avg(price), 2) as avg_price
from orders
group by city
having avg_price > 10000
order by avg_price desc;

-- Q12. Find the total revenue per city, but only include orders from the 'Electronics' category. (Sort by total_revenue DESC)
select city, category, round(sum(quantity * price)) as total_revenue
from orders
where category = 'Electronics'
group by city
order by total_revenue desc;

-- Q13. Find categories where the total quantity sold is greater than 8. (Sort by total_qty DESC)
select category, sum(quantity) as total_quantity
from orders
group by category
having total_quantity > 8
order by total_quantity desc;

-- Q14. Find the number of distinct cities from which each category received orders. (Sort by category A–Z)
select category, count(distinct city)
from orders
group by category
order by category asc;

-- Q15. List cities where the minimum order price is less than 2000. Show city and min_price. (Sort by min_price ASC)
select city, min(price) as min_price
from orders
group by city
having min_price < 2000
order by min_price asc;

-- Q16. Find each city's total revenue (price × quantity). Show only cities where total revenue is between 30000 and 100000. (Sort by total_revenue DESC)
select city, sum(price * quantity) as total_revenue
from orders
group by city
having total_revenue between 30000 and 100000
order by total_revenue desc;

-- Hard Questions
-- Q17. For each combination of city and category, find the total revenue. Show only combinations where total revenue > 20000. (Sort by total_revenue DESC)
select city, category, round(sum(quantity * price)) as total_revenue
from orders
group by city, category
having total_revenue > 20000
order by total_revenue desc;