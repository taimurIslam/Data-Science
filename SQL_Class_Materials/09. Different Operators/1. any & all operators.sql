-- ANY: The condition is TRUE if it satisfies the condition for any one value returned by the subquery.
-- ALL: The condition is TRUE only if it satisfies the condition for every value returned by the subquery.

--Products with Price Equal to Any Value in Another List
SELECT product_name, group_id, price
FROM products p
WHERE price = ANY (
    SELECT price
    FROM products
    WHERE group_id = 2
);

-- Products with a Price Greater than All Products in a Specific Group
select * from products where group_id =1;

SELECT product_name, price
FROM products p
WHERE price > ALL (
    SELECT price
    FROM products
    WHERE group_id = 1
);

--- Products with prices equal to All Prices in Another List
SELECT product_name, group_id, price
FROM products p
WHERE price < ALL (
    SELECT price
    FROM products
    WHERE group_id = 2
);

select * from products where group_id =2;


