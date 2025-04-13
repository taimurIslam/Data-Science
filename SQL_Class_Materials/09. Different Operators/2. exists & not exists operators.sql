--  Finding Products with a Specific Group
SELECT product_name, price
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM product_groups g
    WHERE g.group_id = p.group_id AND g.group_name = 'Smartphone'
);

-- Finding Products Not in Specific Groups
SELECT product_name
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM product_groups g
    WHERE g.group_id = p.group_id AND g.group_name = 'Tablet'
);
