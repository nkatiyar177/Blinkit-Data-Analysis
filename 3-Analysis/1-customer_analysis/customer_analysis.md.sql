##1- Customer Lifetime Value (CLV)

SELECT c.customer_name, SUM(p.price * oi.qty) AS Total_Revenue
FROM customer_clean c 
INNER JOIN orders_clean o
 ON c.customer_id= o.customer_id 
INNER JOIN order_items_clean oi
 ON o.order_id = oi.order_id 
INNER JOIN products_clean p
 ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY Total_Revenue DESC;

## 2--Repeat Customers

SELECT customer_id, 
COUNT(DISTINCT(order_id)) AS Total_Orders FROM orders_clean
GROUP BY customer_id
HAVING COUNT(DISTINCT(order_id))>1
ORDER BY Total_Orders DESC