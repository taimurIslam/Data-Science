--The view does not store data physically; it stores the query that is executed when the view is queried.

-- Creating a View to Show All Products in a Specific Group
CREATE VIEW smartphone_products AS
SELECT product_name, price
FROM products
WHERE group_id = 1;

select * from smartphone_products;

drop view smartphone_products;


drop materialized view smartphone_products;
CREATE materialized VIEW smartphone_products AS
SELECT product_name, price
FROM products
WHERE group_id = 1
with no data;


select * from smartphone_products;

REFRESH MATERIALIZED VIEW smartphone_products;
select * from smartphone_products;



drop materialized view smartphone_products;
CREATE materialized VIEW smartphone_products AS
SELECT product_name, price
FROM products
WHERE group_id = 1
with data;


select * from smartphone_products;


-- Common Table Expressions (CTE) 
-- CTEs are useful for organizing complex queries, improving readability, and simplifying nested queries.

WITH product_group_data AS (
    SELECT p.product_name, p.price, g.group_name
    FROM products p
    JOIN product_groups g ON p.group_id = g.group_id
)
SELECT * FROM product_group_data
WHERE group_name = 'Smartphone';

----------------
WITH product_count AS (
    SELECT group_id, COUNT(*) AS num_products
    FROM products
    GROUP BY group_id
)
SELECT g.group_name, p.num_products
FROM product_count p
JOIN product_groups g ON p.group_id = g.group_id;


