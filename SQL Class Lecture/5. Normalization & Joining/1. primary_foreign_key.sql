drop table customers;
-- Creating the Customers table (Parent Table)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

drop table orders;
-- Creating the Orders table (Child Table)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

---- Insert data in both tables
INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Alice', 'Dhaka'),
(2, 'Bob', 'Chittagong'),
(3, 'Charlie', 'Sylhet'),
(4, 'Tai', 'Barishal');

INSERT INTO orders (order_id, customer_id, product, amount) VALUES
(101, 1, 'Laptop', 800.00),
(102, 1, 'Mouse', 20.00),
(103, 2, 'Keyboard', 50.00),
(104, 4, 'Monitor', 200.00);


select * from Orders;


select * from Customers;



---- Information about Customers Table
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE lower(table_name) = 'customers';

---- Information about Orders Table
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE lower(table_name) = 'orders';

-- Check Foreign key of Order Table

SELECT constraint_name,constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_name = 'orders' 
AND constraint_type = 'FOREIGN KEY';

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'Customers';



SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'customers'
AND table_schema = 'public';


SELECT tablename, tableowner 
FROM pg_tables 
WHERE tablename = 'customers';

SELECT *
FROM information_schema.functions;
WHERE table_name = 'customers'
AND table_schema = 'public';
