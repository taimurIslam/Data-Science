-- Inner Join
-- Returns only customers who have placed an order.
SELECT 
	customers.customer_id, 
	customers.name, 
	orders.order_id, 
	orders.product
FROM 
	customers
INNER JOIN orders 
	ON customers.customer_id = orders.customer_id;

-- Left Join
-- All Customers, Even If No Orders

SELECT 
	customers.customer_id, 
	customers.name, 
	orders.order_id, 
	orders.product
FROM 
	customers
LEFT JOIN orders 
	ON customers.customer_id = orders.customer_id;

-- Right Join
-- All Orders, Even If No Customer Info
SELECT 
	customers.customer_id, 
	customers.name, 
	orders.order_id, 
	orders.product
FROM 
	customers
RIGHT JOIN orders 
	ON customers.customer_id = orders.customer_id;

-- Full Outer Join
-- All Data, Even If No Match
SELECT 
	customers.customer_id, 
	customers.name, 
	orders.order_id, 
	orders.product
FROM 
	customers
FULL JOIN orders 
	ON customers.customer_id = orders.customer_id;

-- Cross Join
-- Every Row Combines with Every Row

SELECT 
	customers.name, 
	orders.product
FROM 
	customers
CROSS JOIN orders;

-- Self Join
-- Joining a Table with Itself


SELECT 
	A.name AS customer1, 
	B.name AS customer2, 
	A.city
FROM 
	customers A
JOIN customers B 
	ON A.city = B.city AND A.customer_id <> B.customer_id;


--- Natural Join
SELECT customers.*,orders.*
FROM customers
INNER JOIN orders using (customer_id);
-- Or you can write 
SELECT customers.*,orders.*
FROM customers
NATURAL INNER JOIN orders;


SELECT customers.*,orders.*
FROM customers
left JOIN orders using (customer_id);

SELECT customers.*,orders.*
FROM customers
NATURAL left JOIN orders;




------------------------ Example: Assignment--------------------
-- 1. Calculate the total amount spent by each customer.
SELECT customers.name, SUM(orders.amount) AS total_spent
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name;
-- 2. dentify customers who haven’t made any purchases.
SELECT customers.customer_id, customers.name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;





