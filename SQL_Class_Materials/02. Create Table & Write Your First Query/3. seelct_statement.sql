--- Select All
-- * asterisk 
select * from students;

-- Select top n items from students table
select * from students limit 2;

-- Find all first names from students
select first_name from students;

-- Find multiple columns from students
select first_name,last_name from students;

--- Return full name 
-- Use of Alias
select first_name||' '||last_name as fullname from students;
select first_name||' '||last_name as "full name" from students;

select concat(first_name,' ',last_name) as fullname from students;


--- Select without from
select now();
select current_date;
select current_timestamp;