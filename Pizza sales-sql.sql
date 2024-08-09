
-------------PIZZA SALES SQL QUERIES----------------
use Pizza_DB;
select * from pizza_sales

-- 1. Total Revenue:
select sum(total_price) as total_revenu from pizza_sales;


--2. Average Order Value
select sum(total_price)/COUNT(distinct order_id) as avg_order_value from pizza_sales

--3. Total Pizzas Sold
select sum(quantity) as Total_pizza_sold from pizza_sales


--4. Total Orders
select count(distinct order_id) as total_order from pizza_sales

--5. Average Pizzas Per Order
select cast(cast(sum(quantity)as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2))as decimal (10,2) ) 
AS total_avg_pizz_per_order
from pizza_sales

--B. Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) As order_day, COUNT(distinct order_id) As total_order
from pizza_sales
group by DATENAME(DW, order_date)

--C. Monthly Trend for Orders
select DATENAME(MONTH,order_date) as order_month,count(distinct order_id) as total_order
from pizza_sales
group by DATENAME(Month,order_date)
order by total_order desc

--D. % of Sales by Pizza Category
select pizza_category, sum(total_price) as Total_sales,sum(total_price)*100/(select sum(total_price) 
from pizza_sales where Month(order_date) =1 ) as PCT
from pizza_sales
where Month(order_date) =1
group by pizza_category



--E. % of Sales by Pizza Size
select pizza_size, sum(total_price) as Total_sales,sum(total_price)*100/(select sum(total_price) 
from pizza_sales where Datepart(QUARTER, order_date) =1 ) as PCT
from pizza_sales
where Datepart(QUARTER, order_date) =1 
group by pizza_size
order by PCT desc


---F. Total Pizzas Sold by Pizza Category
select top 5 pizza_name,sum(total_price) as total_revenu from pizza_sales
group by pizza_name
order by total_revenu desc


--G. Top 5 Pizzas by Revenue
select top 5 pizza_name,sum(total_price) as total_revenu from pizza_sales
group by pizza_name
order by total_revenu asc

--H. Bottom 5 Pizzas by Revenue
select top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc


--I. Top 5 Pizzas by Quantity
select top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc

--J. Bottom 5 Pizzas by Quantity
select top 5 pizza_name,count(order_id) as total_order from pizza_sales
group by pizza_name
order by  total_order desc

--K. Top 5 Pizzas by Total Orders
select top 5 pizza_name,count(order_id) as total_order from pizza_sales
group by pizza_name
order by  total_order asc 


