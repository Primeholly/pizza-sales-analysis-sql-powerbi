-- Impoeting table

CREATE TABLE pizza_data (
			 pizza_id int primary key,
			 order_id int,
			 pizza_name_id varchar,
			 quantity int,
			 order_date date,
			 order_time time,
			 unit_price float,
			 total_price float,
			 pizza_size varchar,
			 pizza_category varchar,
			 pizza_ingredients text,
			 pizza_name varchar
) 

SELECT * FROM pizza_data

-- QUESTION 1 Toatal Revenue

SELECT sum(total_price) AS Total_Revenue
From pizza_data

--- QUESTION 2 Average order value
SELECT sum(total_price) / COUNT (DISTINCT order_id) AS Avg_order_value
FROM pizza_data

---QUESTION 3 Total Pizza Sold:

SELECT sum(quantity) AS Total_Pizza_Sold
FROM pizza_data

---QUESTION 4 Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_data

---QUESTION 5 Average Pizza per Order
SELECT CAST(CAST(sum(quantity) AS DECIMAL(10,2))/ CAST(COUNT (DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_pizza_per_value
FROM pizza_data

SELECT * FROM pizza_data
-- Charts Requirement
SELECT order_date AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_data
Group by order_date

SELECT DATENAME(MONTH, order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_data

-- Percentage of sales by pizza Category
SELECT pizza_category, Sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_data) as PCT
FROM pizza_data 
Group by pizza_category

-- Percentage of sales by pizza Size
SELECT pizza_size, CAST(Sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_data) AS DECIMAL (10,2)) as PCT
FROM pizza_data 
Group by pizza_size
Order by pct DESC

Top 5 Pizza By Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_data
Group by pizza_name
Order by Total_Revenue DESC
Limit 5

 Bottom 5 Pizza by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_data
Group by pizza_name
Order by Total_Revenue ASC
Limit 5

Top 5 pizza by Quantity
SELECT pizza_name, SUM(quantity) AS Total_quantity FROM pizza_data
Group by pizza_name
Order by Total_quantity DESC
Limit 5

Bottom 5 pizza by Quantity
SELECT pizza_name, SUM(quantity) AS Total_quantity FROM pizza_data
Group by pizza_name
Order by Total_quantity ASC
Limit 5

Top
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_data
Group by pizza_name
Order by Total_Orders DESC
Limit 5

BOTTOM
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_data
Group by pizza_name
Order by Total_Orders ASC
Limit 5
