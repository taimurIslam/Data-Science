------------- Filtering Data --------
INSERT INTO students (first_name, last_name, email, date_of_birth, gender, phone_number,status) 
VALUES 
('Tai', 'Hu', 'tai.hu@example.com', '1992-05-15', 'Male', '1234577888','Inactive');

---
select * from students;
------------- Limit
-- Top 3 younger students
select *
from
	students
order by
	date_of_birth desc
limit 3;

---Top 3 younger students excluding the youngest one
select *
from
	students
order by
	date_of_birth desc
limit 3 offset 1;



-------------FETCH-----
select *
from
	students
order by
	date_of_birth desc
offset 1 rows
fetch first 3 rows only;

------------- WHERE -----
select *
from
	students
where 
	status = 'Inactive';

---- Additional Example 

-- Example of =, >, < , >=, <=, AND, OR, IN, BETWEEN, lIKE, IS NULL, NOT operators

SELECT * FROM students WHERE student_id = 10;
SELECT * FROM students WHERE gpa > 3.5;
SELECT * FROM students WHERE enrollment_date < '2023-01-01';
SELECT * FROM students WHERE date_of_birth <= '2000-01-01';

--------- AND/OR Operator -------
SELECT * FROM students WHERE gender = 'Female' AND gpa > 3.2;
SELECT * FROM students WHERE gpa < 2.0 OR status = 'Inactive';

--------- IN --------
SELECT * FROM students WHERE gender IN ('Male', 'Other');
SELECT * FROM students WHERE status NOT IN ('Active');

--- BETWEEN -------
SELECT * FROM students WHERE date_of_birth BETWEEN '1995-01-01' AND '2005-12-31';

----- LIKE -----
SELECT * FROM students WHERE first_name LIKE 'J%';
SELECT * FROM students WHERE first_name NOT LIKE 'J%';
SELECT * FROM students WHERE first_name LIKE '_o%';
SELECT * FROM students WHERE first_name ILIKE '_O%';


---- IS NULL -----
SELECT * FROM students WHERE phone_number IS NULL;

-------- Handle NULL
select first_name, COALESCE(gpa,3.99) from students;







------------- UPDATE
update students
set status = 'Inactive'
where gpa = 3.60;
------------------- Table related information --------
select 
	column_name, 
	data_type, 
	is_nullable, 
	column_default
from
	information_schema.columns
where 
	table_name = 'students';

select * from students;