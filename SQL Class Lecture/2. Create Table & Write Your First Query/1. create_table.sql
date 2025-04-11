
-------------------------- Table --------------
-- Create New Table

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,  -- Auto-incrementing unique ID
    first_name TEXT NOT NULL,  -- Mandatory column
    last_name TEXT NOT NULL, -- Mandatory column
    email TEXT UNIQUE NOT NULL,  -- Mandatory column + Ensures email is unique
    age INTEGER CHECK (age >= 18),  -- Restricts age to 18+
    salary NUMERIC(10,2) CHECK (salary > 0),  -- Salary must be positive
    department TEXT DEFAULT 'General',  -- Assigns default department if not provided
    hire_date DATE DEFAULT CURRENT_DATE  -- Auto-fills current date
);


-- Show All
select * from employees;

-- 1. CURRENT_DATE, 2. NOW(),3. CURRENT_TIMESTAMP

-- Insert Data Into Table
INSERT INTO employees (first_name, last_name, email,age, salary, department, hire_date)
VALUES 
    ('Alice', 'Smith', 'alice.smith@email.com',30, 60000, 'HR',NOW()),
    ('Bob', 'Johnson', 'bob.johnson@email.com',35, 75000, 'IT','2025-02-01'),
    ('Charlie', 'Brown', 'charlie.brown@email.com',40, 80000, 'Finance','2025-02-05');

-- Delete All Data From Employees
TRUNCATE table employees;

-- Delete All Data
Delete from employees;

--- Understand Constraints ---
------- Insert 
INSERT INTO employees (first_name, last_name, email, salary, department)
VALUES ('Alice', 'Smith', 'alice1.smith@email.com', 1, 'HR');

--------- Show All data
select * from employees;




