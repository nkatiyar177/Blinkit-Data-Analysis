**##1- Removed null values \& proper capitalization in customer table**



CREATE TABLE customer\_clean AS

SELECT DISTINCT(customer\_id),

INITCAP(COALESCE(customer\_name,'unknown')) AS customer\_name,

INITCAP(COALESCE(city,'unknown')) AS city,

COALESCE(signup\_date,'2020-03-27') AS signup\_date

FROM customer;



**##2- Removed null values from orders table**





CREATE TABLE orders\_clean

SELECT DISTINCT(order\_id), customer\_id, order\_date,

(COALESCE(delivery\_time\_min, (SELECT ROUND(AVG(delivery\_time\_min), 2) AS avg\_del\_time FROM orders))) AS delivery\_time\_min,

UPPER(COALESCE(payment\_mode, 'null')) AS payment\_mode

FROM orders;



**##3- Removed null in order\_items table**



CREATE TABLE order\_items\_clean AS

SELECT DISTINCT(order\_id),

COALESCE(product\_id, 'unknown') AS product\_id,

COALESCE(qty,0) AS qty,

order\_item\_id FROM order\_items;



**##4- Removed null and proper capitalization in orders table**



CREATE TABLE products\_clean AS

SELECT product\_id,

INITCAP(COALESCE(product\_name, 'unknown')) AS product\_name,

INITCAP(COALESCE(category,'unknown')) AS category,

price FROM products

WHERE price IS NOT NULL AND NOT price =0;



**##5-- Check duplicates in each table**



**--Duplicate customers**



SELECT customer\_name, COUNT(\*) from customer\_clean

GROUP BY customer\_name

HAVING COUNT(\*)>1



**--Duplicate orders**



SELECT order\_id, COUNT(\*) from orders\_clean

GROUP BY order\_id

HAVING COUNT(\*)>1



**--Duplicate order\_items**



SELECT order\_item\_id, COUNT(\*)

FROM order\_items\_clean

GROUP BY order\_item\_id

HAVING COUNT(\*) > 1;



**##6- Integrity checks**



**--orders without customers**



SELECT \* FROM orders\_clean o LEFT JOIN customer\_clean c

ON o.customer\_id=c.customer\_id

WHERE c.customer\_id IS NULL;



**-- customers without orders**



SELECT \* FROM customer\_clean c  LEFT JOIN orders\_clean o

ON c.customer\_id=o.customer\_id

WHERE o.order\_id IS NULL



