--Top selling products

use retail_db;
select
	p.product_id,
    p.product_name,
    sum(oi.quantity) as total_quantity_sold
from order_items oi
join products p
	on p.product_id = oi.product_id
group by
	p.product_id, p.product_name
order by 
	total_quantity_sold desc
limit 10;

--customer segmentation

select
	c.customer_id,
    c.name,
    sum(oi.quantity * p.price) as total_spent,
case
	when sum(oi.quantity * p.price) >= 3550000 then 'High Spender'
    when sum(oi.quantity * p.price) between 3500000 and 3559999 then 'Medium Spender'
    else 'Low Spender'
end as customer_segmentation
from customers c
join orders o
	on c.customer_id = o.customer_id
join order_items oi
	on o.order_id - oi.order_id
join products p
	on p.product_id = oi.product_id
group by
	c.customer_id, c.name
order by
	total_spent desc;
    
--Monthly Sales Trend

select
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    sum(oi.quantity * p.price) as total_revenue
from orders o
join order_items oi
	on o.order_id = oi.order_id
join products p
	on oi.product_id = p.product_id
group by
	month
order by
	month;
    
--City Level Performance

select
	c.city,
    sum(oi.quantity * p.price) as total_sales
from customers c
join orders o
	on o.customer_id = c.customer_id
join order_items oi
	on o.order_id = oi.order_id
join products p
	on p.product_id = oi.product_id
group by
	city
order by 
	total_sales desc;
    
--Category Performance Analysis


select
	p.category,
    sum(oi.quantity * p.price) as Revenue
from products p
join order_items oi
	on oi.product_id = p.product_id
group by
	category
order by
	Revenue desc;