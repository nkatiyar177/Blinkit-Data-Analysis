**##1- Total Revenue (GMV)**



SELECT

SUM(oi.qty\*p.price) AS total\_revenue

FROM order\_items\_clean oi

INNER JOIN products\_clean p

ON oi.product\_id= p.product\_id;



**##2-Average order value**



SELECT

(SUM(oi.qty \* p.price)/COUNT(DISTINCT(o.order\_id))) AS avg\_order\_value

FROM order\_items\_clean oi

INNER JOIN products\_clean p

 ON oi.product\_id= p.product\_id

INNER JOIN orders\_clean o

 ON o.order\_id=oi.order\_id;



**##3-- ON Time VS Late orders (Delivery time analysis)**



SELECT

SUM

(

CASE

     WHEN delivery\_time\_min<20 THEN 1 ELSE 0 END) AS ON\_TIME,

SUM

(

CASE

     WHEN delivery\_time\_min>20 THEN 1 ELSE 0 END) AS LATE

FROM orders\_clean;



**##4- Delivery SLA (20 minutes) (% of late orders)**



SELECT

ROUND(100\*(SUM(

CASE

WHEN delivery\_time\_min>20

THEN 1 ELSE 0 END)/COUNT(DISTINCT(order\_id))),2)

 AS Late\_delivery\_percentage

 FROM orders\_clean



**##5- ON time vs late delivery counts (Delivery analysis)**



SELECT

 CASE

  WHEN delivery\_time\_min <20

  THEN 'ON\_TIME' ELSE 'LATE' END AS delivery\_status,

  COUNT(DISTINCT(order\_id)) AS count\_of\_orders

FROM orders\_clean

 GROUP BY  delivery\_status

