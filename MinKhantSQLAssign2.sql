-- Whale
select * from customers;
select * from order_items;
select * from orders;
select * from products;
select * from payments;
select * from shipments;

-- What are the most common products in customer orders?
with cte_common as(
select products.product_name, count(products.product_name) as product_count from order_items
left join products on products.product_id = order_items.product_id
group by products.product_name) -- Should order quantity include?

select * from cte_common
where product_count = 3;

-- Which payment method is most frequently used by customers for purchasing our products?
select payment_method, count(payment_method) as frequency 
from payments
group by payment_method; -- how to get the maximum frequency

-- What is the average payment amount for each payment method per month?
select date_format(payment_date, '%y %m') as monthly, payment_method, avg(amount) as average
from payments
where payment_status = 'Completed'
group by monthly, payment_method
order by monthly;

-- What is the average time taken between order placement and shipment for each shipment method?
select s.shipment_method, avg(TIMESTAMPDIFF(month,s.shipment_date,o.order_date)) 
from orders o
join shipments s on s.order_id = o.order_id
group by s.shipment_method;
-- chech order_date and in some cases order_date is late than shipment

select o.order_id, s.shipment_method, o.order_date,s.shipment_date, o.status
from orders o
join shipments s on s.order_id = o.order_id;


