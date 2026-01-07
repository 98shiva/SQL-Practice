
-- Classify orders by delivery speed: if the delivery date is within 3 days of order date mark as Fast, within 7 days as Normal, else Delayed.
select *,case 
             when datediff(delivery_date,order_Date) = 3 then "Fast"      
             when datediff(delivery_date,order_Date)  = 7 then "Normal"
             else "Delayed"
         end as delivery_status    
from orders  ;

-- Create a report of customers showing age groups: Youth (under 25), Adult (25–40), Senior (above 40), and count customers in each group (transpose style).
select * from customers;
select case 
			when age <= 25 then "Youth"
            when age > 25 and age <= 40 then "Adult"
            when  age > 40 then "Senior"
            end as age_intervals, count(*)
from customers
group by age_intervals;


-- For each product category, show total revenue and classify performance: High Revenue (above 1,00,000), Medium Revenue (50,000–1,00,000), Low Revenue (below 50,000).

with total_sales as (select p.product_name,sum(p.price*od.quantity) total_sales
from products p join order_details od
on p.product_id = od.product_id
group by p.product_name)
select *, case 
              when total_Sales > 100000 then "High Revenue"
              when total_Sales between  50000 and  100000 then "Medium Revenue"
			  else "Lost Revenue" end  as performance
from total_Sales   ;

-- Pivot the returns table: count how many returns are in each refund status (Approved, Pending, Processed), using CASE inside aggregates to simulate transposed columns.
select * FROM RETURNS;
SELECT
    COUNT(CASE WHEN refund_status = 'Approved' THEN 1 END)   AS approved_returns,
    COUNT(CASE WHEN refund_status = 'Pending' THEN 1 END)    AS pending_returns,
    COUNT(CASE WHEN refund_status = 'Processed' THEN 1 END)  AS processed_returns
FROM returns;

-- For each state, calculate the number of orders paid by different payment methods (Credit Card, UPI, Cash) using CASE expressions, 
-- and return only states where at least two payment methods are used significantly.

SELECT 
    c.state,

    SUM(CASE WHEN o.payment_method = 'Credit Card' THEN 1 ELSE 0 END) AS Credit_Card,
    SUM(CASE WHEN o.payment_method = 'UPI' THEN 1 ELSE 0 END) AS UPI,
    SUM(CASE WHEN o.payment_method = 'Debit Card' THEN 1 ELSE 0 END) AS Debit_Card,
    SUM(CASE WHEN o.payment_method = 'Cash on Delivery' THEN 1 ELSE 0 END) AS Cash_on_Delivery

FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id

GROUP BY c.state

HAVING 
    (SUM(CASE WHEN o.payment_method = 'UPI' THEN 1 ELSE 0 END) > 0)
  + (SUM(CASE WHEN o.payment_method = 'Debit Card' THEN 1 ELSE 0 END) > 0)
  + (SUM(CASE WHEN o.payment_method = 'Cash on Delivery' THEN 1 ELSE 0 END) > 0) >= 2;












           















