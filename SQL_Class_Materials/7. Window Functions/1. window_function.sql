CREATE TABLE product_groups (
	group_id serial PRIMARY KEY,
	group_name VARCHAR (255) NOT NULL
);
CREATE TABLE products (
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	price DECIMAL (11, 2),
	group_id INT NOT NULL,
	FOREIGN KEY (group_id) REFERENCES product_groups (group_id)
);

INSERT INTO product_groups (group_name)
VALUES
	('Smartphone'),
	('Laptop'),
	('Tablet');
INSERT INTO products (product_name, group_id,price)
VALUES
	('Microsoft Lumia', 1, 200),
	('HTC One', 1, 400),
	('Nexus', 1, 500),
	('iPhone', 1, 900),
	('HP Elite', 2, 1200),
	('Lenovo Thinkpad', 2, 700),
	('Sony VAIO', 2, 700),
	('Dell Vostro', 2, 800),
	('iPad', 3, 700),
	('Kindle Fire', 3, 150),
	('Samsung Galaxy Tab', 3, 200);


-----------
SELECT
	AVG (price)
FROM
	products;

---------
SELECT
	group_name,
	AVG (price)
FROM
	products
INNER JOIN product_groups USING (group_id)
GROUP BY
	group_name;



-- Basic Structure of window function
function_name(expression) OVER (
    [PARTITION BY column_name] 
    [ORDER BY column_name] 
    [ROWS or RANGE frame_specification]
)

--------------------------- Aggregated Function
SELECT
	product_name,
	price,
	group_name,
	AVG (price) OVER (PARTITION BY group_name)
FROM
	products
INNER JOIN
	product_groups USING (group_id);


-----------ROW_NUMBER ()
SELECT
  product_id,
  product_name,
  group_id,
  ROW_NUMBER () OVER (ORDER By product_name)
FROM
  products;

----- Assign a row number for each product group
 SELECT
  product_id,
  product_name,
  group_id,
  ROW_NUMBER () OVER (
    PARTITION BY group_id
    ORDER BY
      product_name
  )
FROM
  products;


  --
 SELECT
  *
FROM
  products
WHERE
  price = (
    SELECT
      price
    FROM
      (
        SELECT
          price,
          ROW_NUMBER () OVER (
            ORDER BY
              price DESC
          ) nth
        FROM
          (
            SELECT
              DISTINCT (price)
            FROM
              products
          ) prices
      ) sorted_prices
    WHERE
      nth = 3
  );

select A.*
from
(
  select A.*,
  ROW_NUMBER () OVER (
            ORDER BY
              price DESC
          ) nth
  from products A) A
  where nth=3;



  ---------------------
  SELECT
	product_id,
	product_name,
	price,
	RANK () OVER (
		ORDER BY price DESC
	) price_rank
FROM
	products;
---------------------
SELECT
	product_id,
	product_name,
	group_name,
	p.group_id,
	price,
	RANK () OVER (
		PARTITION BY p.group_id
		ORDER BY price DESC
	) price_rank
FROM
	products p
	INNER JOIN product_groups g
		ON g.group_id = p.group_id;

----------
SELECT
	product_id,
	product_name,
	group_name,
	p.group_id,
	price,
	PERCENT_RANK () OVER (
		PARTITION BY p.group_id
		ORDER BY price
	) price_p_rank
FROM
	products p
	INNER JOIN product_groups g
		ON g.group_id = p.group_id;


select * from products;
SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY price) AS percentile_25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY price) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price) AS percentile_75
FROM products;

-------
SELECT
	product_id,
	product_name,
	group_name,
	p.group_id,
	price,
	cume_dist () OVER (PARTITION BY p.group_id ORDER BY price) cume_dist_,
	percent_rank () OVER (PARTITION BY p.group_id ORDER BY price) percent_rnk_,
FROM
	products p
	INNER JOIN product_groups g
		ON g.group_id = p.group_id;

	----
SELECT
	product_id,
	product_name,
	price,
	DENSE_RANK () OVER (
		ORDER BY price DESC
	) price_rank
FROM
	products;

-------
SELECT
    product_id,
    product_name,
	group_id,
    price,
    FIRST_VALUE(product_name)
    OVER(
	PARTITION BY group_id
        ORDER BY price
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) lowest_price
FROM
    products;
--------------------------
SELECT
    product_id,
    product_name,
    group_id,
    price,
    LAST_VALUE(product_name)
    OVER(
	PARTITION BY group_id
        ORDER BY price
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) highest_price
FROM
    products;


----
SELECT 
    product_name, 
    price,
    SUM(price) OVER (
        PARTITION BY group_id 
        ORDER BY price 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
	SUM(price) OVER (
        PARTITION BY group_id 
        ORDER BY price 
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total2,
	SUM(price) OVER (
        PARTITION BY group_id 
        ORDER BY price 
        ROWS BETWEEN UNBOUNDED PRECEDING AND 1 following
    ) AS running_total3
FROM products;

--Since ROWS BETWEEN ... is not explicitly mentioned,
--PostgreSQL automatically applies 
--RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.

select * from products;
-------------
SELECT
    product_id,
    product_name,
    price,
    group_id,
    NTH_VALUE(product_name, 2)
    OVER(
        PARTITION BY group_id
        ORDER BY price DESC
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    )
FROM
    products;

---------------
SELECT
    product_id,
    product_name,
    price,
    NTH_VALUE(product_name, 2)
    OVER(
        ORDER BY price DESC
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    )
FROM
    products;

-------- LAG - Previous
SELECT
  product_id,
    product_name,
    price,
	group_id,
  LAG(price, 1) OVER (
    PARTITION BY group_id
    ORDER BY
      price
  ) previous_product_price
FROM
  products;
--------------- Lead - Next Value
 SELECT
  product_id,
    product_name,
    price,
	group_id,
  Lead(price, 1) OVER (
    PARTITION BY group_id
    ORDER BY
      price
  ) previous_product_price
FROM
  products;