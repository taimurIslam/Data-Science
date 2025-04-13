------ Suppose you have an existing table named: 'old_customers'
CREATE TABLE old_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Now you created a new table named: 'new_customers'
CREATE TABLE new_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);


----- Insert Data
INSERT INTO old_customers (customer_id, name, city) VALUES
(1, 'Alice', 'Dhaka'),
(2, 'Bob', 'Chittagong'),
(3, 'Charlie', 'Sylhet');

INSERT INTO new_customers (customer_id, name, city) VALUES
(3, 'Charlie', 'Sylhet'),
(4, 'David', 'Dhaka'),
(5, 'Emma', 'Rajshahi');


SELECT * FROM old_customers;
SELECT * FROM new_customers;


---- Union
SELECT customer_id, name, city FROM old_customers
UNION
SELECT customer_id, name, city FROM new_customers;

-- Union All
SELECT customer_id, name, city FROM old_customers
UNION ALL
SELECT customer_id, name, city FROM new_customers;



---- Interset
SELECT customer_id, name, city FROM old_customers
INTERSECT
SELECT customer_id, name, city FROM new_customers;

---- Interset
SELECT customer_id, name, city FROM old_customers
EXCEPT
SELECT customer_id, name, city FROM new_customers;


