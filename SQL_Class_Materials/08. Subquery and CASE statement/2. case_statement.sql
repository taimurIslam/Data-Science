-- CASE WHEN – Categorizing Products by Price
SELECT product_name, price,
    CASE 
        WHEN price < 300 THEN 'Budget'
        WHEN price BETWEEN 300 AND 700 THEN 'Mid-range'
        ELSE 'Premium'
    END AS price_category
FROM products;

select * from products;
select * from product_groups;

-- CASE WHEN – Discount Based on Product Group
SELECT product_name, price, group_id,
    CASE 
        WHEN group_id = 1 THEN price * 0.85  -- 15% discount for Smartphones
        WHEN group_id = 2 THEN price * 0.90  -- 10% discount for Laptops
        WHEN group_id = 3 THEN price * 0.80  -- 20% discount for Tablets
        ELSE price
    END AS discounted_price
FROM products;


