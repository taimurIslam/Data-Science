-- Casting: Converting data type

--Porcess:01
SELECT '123'::INTEGER;  -- Converts string to integer
SELECT 123.456::DECIMAL(5,2);  -- Converts float to decimal with 2 decimal places
SELECT '2024-03-03'::DATE;  -- Converts string to date
--Process:02
SELECT CAST('123' AS INTEGER);  
SELECT CAST('2024-03-03' AS DATE);
SELECT CAST(99.994 AS NUMERIC(10,2));

--- Class:02 Students Table
select 
	first_name,
	last_name,
	gpa::decimal(5,2),
	gpa::integer,
	gpa::text
from 
	students;


--- 
SHOW server_version;
-- Show the type of the data
SELECT pg_typeof(10.9);

--- Ceil/Floor/Round
select ceil(10.9);
select floor(10.9);
select round(10.9,2);






