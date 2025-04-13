
-- Create Procedure 
CREATE PROCEDURE insert_product(
    product_name VARCHAR,
    price DECIMAL(11, 2),
    group_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO products (product_name, price, group_id)
    VALUES (product_name, price, group_id);
END;
$$;

-- Execute the Procedure
CALL insert_product('Samsung Galaxy S21', 999.99, 1);


select * from products;
--delete from products where product_id = 12;


-- Information about the stored procedure
SELECT pg_catalog.pg_get_functiondef(p.oid)
FROM pg_catalog.pg_proc p
WHERE p.proname = 'insert_product';



