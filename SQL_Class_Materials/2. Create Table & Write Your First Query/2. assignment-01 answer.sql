-------- Class 02: Assignment 01
-- Create table students
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


----- Select 
select * from students;
