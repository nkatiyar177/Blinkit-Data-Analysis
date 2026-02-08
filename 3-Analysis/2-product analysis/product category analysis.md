**##1- Product category analysis**



SELECT p.category, SUM(p.price\*oi.qty) AS Total\_Revenue

FROM products\_clean p 

FULL JOIN order\_items\_clean oi

&nbsp;ON p.product\_id=oi.product\_id

&nbsp;GROUP BY p.category 

&nbsp;HAVING SUM(p.price\*oi.qty) IS NOT NULL

&nbsp;ORDER BY Total\_Revenue DESC



