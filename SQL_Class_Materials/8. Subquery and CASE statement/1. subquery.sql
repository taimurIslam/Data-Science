-- Listing Products With Prices Higher than the Average Price
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

--Finding Groups With More Than 3 Products
SELECT group_name
FROM product_groups
WHERE group_id IN (
    SELECT group_id 
    FROM products
    GROUP BY group_id
    HAVING COUNT(*) > 3
);
-- Finding the Cheapest Product in Each Group


SELECT product_name, price, group_id
FROM products
WHERE price = (
    SELECT MIN(price)
    FROM products p2
    WHERE p2.group_id = products.group_id
);

select * from products;
