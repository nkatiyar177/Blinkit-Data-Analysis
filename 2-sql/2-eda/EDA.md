**## 1- Dataset size**



SELECT COUNT(\*) AS total\_customers FROM customer\_clean;

SELECT COUNT(\*) AS total\_orders FROM orders\_clean;

SELECT COUNT(\*) AS total\_order\_items FROM order\_items\_clean;

SELECT COUNT(\*) AS total\_products FROM products\_clean;



**##2- -- customers by city**



SELECT city, COUNT(\*) AS no\_of\_cities

FROM customer\_clean

GROUP BY city

ORDER BY no\_of\_cities DESC



**##3- Orders trend over time (Monthly\_basis)**



SELECT

DATE\_TRUNC('month',order\_date)  AS month,

COUNT(\*) AS orders

FROM orders\_clean

GROUP BY month

ORDER BY month ASC;



**##4-- Delivery Time Distribution**

SELECT

MIN(delivery\_time\_min) AS Lowest\_delivery\_time,

MAX(delivery\_time\_min) AS Highest\_delivery\_time,

ROUND(AVG(delivery\_time\_min),2) AS Avg\_delivery\_time

FROM orders\_clean;



**Key observations:**



* Customers are spread across multiple cities
* Orders contain more than one product in many cases
* Delivery times vary significantly
* Revenue is not evenly distributed across all products and customers



**Delivery Performance Analysis**





* On-time delivery → 20 minutes or less
* Delayed delivery → more than 20 minutes



**Findings:**



* A noticeable portion of orders are delivered late
* Some cities experience more delivery delays than others



**Simple explanation:**



Fast delivery is a key promise of Blinkit. Delays can affect customer trust and repeat orders.

