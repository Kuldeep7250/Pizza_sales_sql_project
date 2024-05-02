
--1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

--2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

--3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

--4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

--5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

--Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Hourly Trend for Orders
SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)


--% of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category


--% of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 Best Sellers by Total Pizzas Sold
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

--Bottom 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--some pratice questions

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales;

select sum(quantity) as Total_Pizza_Sold from pizza_sales;

select count(distinct order_id) as Total_Orders from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2) ) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as Avg_Pizzas_Per_Order from pizza_sales;
--Daily Trend
select DATENAME(DW, order_date) as order_day, COUNT(distinct order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(DW,order_date);

--Hourly Trend
select DATEPART(HOUR,order_time) as order_hours, 
COUNT(distinct order_id) as Total_orders from pizza_sales
GROUP BY DATEPART(HOUR,order_time) 
order by DATEPART(HOUR,order_time);

--Percentage of sales by Pizza Category
select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales WHERE MONTH(order_date)=1) as PCT from pizza_sales
WHERE MONTH(order_date)=1
group by pizza_category;

--Percentage of sales by Pizza Size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price) * 100/
(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT DESC;

--Total number of pizza sold


--Top % Best Sellers by Total Pizzas Sold
select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by sum(quantity) desc;

--Bottom 5 Worst Sellers by Total Pizzas Sold:
select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by sum(quantity) asc;


