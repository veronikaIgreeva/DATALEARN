-- Total Sales, Total Profit, Profit Ratio, Avg. Discount
select sum(sales) 
, sum(profit)
, round(sum(profit)/sum(sales)*100) as profit_ratio
, round(avg(discount)*100) as avg_discount
from orders;

-- Profit per Order
select round(sum(profit), 2) as profit_per_order
, order_id 
from orders  
group by order_id;

-- Sales per Customer
select round(sum(sales), 2) as sales_per_customer
, customer_id
from orders
group by customer_id;

-- Monthly Sales by Segment 
select sum(sales)
, extract(year from order_date) as year 
, extract (month from order_date) as month
, segment
from orders 
group by segment, year, month 
order by year, month;

-- Monthly Sales by Product Category
select sum(sales)
, extract(year from order_date) as year 
, extract (month from order_date) as month
, category
from orders 
group by category, year, month 
order by year, month;

-- Sales by Product Category over time
select category
, sum(sales)
from orders 
group by category;

-- Sales and Profit by Customer
-- Customer Ranking
select customer_id
, customer_name 
, sum (sales)
, sum(profit)
, dense_rank() over (order by sum(profit) desc)
from orders 
group by customer_id, customer_name;

-- Sales per region
select region 
, sum(sales)
from orders 
group by region;


