--                    Pharse 1
-- 1. List all unique pizza categories (DISTINCT).

SELECT DISTINCT category FROM pizza_types;

/* 2.Display pizza_type_id, name, and ingredients, 
replacing NULL ingredients with "Missing Data". Show first 5 rows.
*/
SELECT pizza_type_id, name, 
	COALESCE(ingredients, 'Missing Data') AS ingredients
    FROM pizza_types
    LIMIT 5;
    
-- 3.Check for pizzas missing a price (IS NULL).
SELECT price
FROM pizzas
WHERE price IS NULL;
 
 
 
 --                      Pharse 2
 -- 4.Orders placed on '2015-01-01' (SELECT + WHERE).
SELECT * FROM orders
WHERE date = '2015-01-01';

-- 5.List pizzas with price descending.
SELECT pizza_id, pizza_type_id, price
FROM pizzas
ORDER BY price DESC;

-- 6. Pizzas sold in sizes 'L' or 'XL'.
SELECT * 
FROM pizzas
WHERE size IN ('L', 'XL');

--  7.Pizzas priced between $15.00 and $17.00.
SELECT *
FROM pizzas
WHERE price BETWEEN 15.00 AND 17.00;

-- 8.Pizzas with "Chicken" in the name.
SELECT *
FROM pizza_types
WHERE name LIKE '%Chicken%';

 -- 9.Orders on '2015-02-15' or placed after 8 PM.
 SELECT order_id, date, time
 FROM orders
 WHERE date = '2015-02-15' or time > '20:00:00';
 
 
 --         Pharse3
 -- 10. Total quantity of pizzas sold (SUM).
 SELECT SUM(quantity) as total_quantity_sold
 FROM order_details;
 
 -- 11.Average pizza price (AVG).
 SELECT ROUND(AVG(price),2) AS Avg_pizza_price
 FROM pizzas; 
 
 -- 12.Total order value per order (JOIN, SUM, GROUP BY).
 SELECT 
    od.order_id,
    SUM(od.quantity * p.price) AS total_order_value
FROM order_details od
JOIN pizzas p 
	ON od.pizza_id = p.pizza_id
GROUP BY od.order_id;
 -- 13.Total quantity sold per pizza category (JOIN, GROUP BY).
 
 select pt.pizza_type_id,
		pt.category, SUM(od.quantity) AS total_quantity
FROM order_details as od
JOIN pizzas as p
	on od.pizza_id = p.pizza_id
JOIN pizza_types as pt
	ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.pizza_type_id, pt.category;

-- 14.Categories with more than 5,000 pizzas sold (HAVING).
SELECT pt.pizza_type_id,
		pt.category,
		SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN pizzas p 
		ON od.pizza_id = p.pizza_id
JOIN pizza_types pt 
		ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.pizza_type_id, pt.category
HAVING total_quantity_sold > 5000;

-- 15.Pizzas never ordered (LEFT/RIGHT JOIN).
SELECT P.*
FROM pizzas p
LEFT JOIN order_details as od
ON p.pizza_id = od.pizza_id
WHERE od.order_id IS NULL;

-- 16. Price differences between different sizes of the same pizza (`SELF JOIN`).

SELECT p1.pizza_type_id,
	   p1.size AS size_1,
       p2.size AS size_2,
       p1.price AS price_1,
       p2.price AS price_2,
    ROUND(ABS(p1.price - p2.price), 2) AS price_difference
FROM pizzas p1
JOIN pizzas p2
        ON p1.pizza_type_id = p2.pizza_type_id
        WHERE p1.size <> p2.size AND p1.size < p2.size
ORDER BY p1.pizza_type_id, size_1;






 
 
 