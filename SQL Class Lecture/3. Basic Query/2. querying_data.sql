-------- Querying Data -------

-- Class -02
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,  -- Auto-incrementing unique student ID
    first_name TEXT NOT NULL,  -- Mandatory first name
    last_name TEXT NOT NULL,  -- Mandatory last name
    email TEXT UNIQUE NOT NULL,  -- Unique email for each student
    date_of_birth DATE NOT NULL,  -- Stores the birth date
    gender TEXT CHECK (gender IN ('Male', 'Female', 'Other')),  -- Restrict gender values
    phone_number TEXT UNIQUE,  -- Unique contact number
    enrollment_date DATE DEFAULT CURRENT_DATE,  -- Auto-sets current date
    gpa NUMERIC(3,2) CHECK (gpa BETWEEN 0 AND 4.0),  -- Ensures GPA is between 0.00 - 4.00
    status TEXT DEFAULT 'Active'  -- Default student status
);

-- Insert values into students table
INSERT INTO students (first_name, last_name, email, date_of_birth, gender, phone_number, gpa) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '2002-05-15', 'Male', '1234567890', 3.8),
('Jane', 'Smith', 'jane.smith@example.com', '2001-11-22', 'Female', '0987654321', 3.5)
('Saddam', 'Hossain', 'saddam.hossain@gmail.com', '2003-12-22', 'Male', '0987654356', 3.9);


--Select & Alias already showed in Class:02

-- Insert 2 new rows to understand order by
INSERT INTO students (first_name, last_name, email, date_of_birth, gender, phone_number, gpa,status) 
VALUES 
('John', 'Doe-J', 'john.doej@example.com', '2001-05-15', 'Male', '1234577890', 3.6,'Inactive'),
('John', 'Eoe', 'john.eoe@example.com', '2001-05-15', 'Male', '1234577899', 3.6, 'Inactive');

-- Order By
select 
	first_name,
	last_name
from
	students
order by 
	first_name desc,
	last_name asc;

--- Sorts the rows by the lengths of the first names
select 
	first_name,
	length(first_name) len
from
	students
order by 
	len desc;
---------- Distinct ----
-- SELECT DISTINCT to remove duplicate rows from a result set of a query.
select 
	distinct first_name
from
	students
order by first_name;
