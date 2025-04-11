 -- Find the Average GPA of All Students

SELECT AVG(gpa) AS average_gpa
FROM students
WHERE gpa IS NOT NULL;

-- Find the Highest GPA
SELECT MAX(gpa) AS highest_gpa
FROM students;

-- Find the Lowest GPA
SELECT MIN(gpa) AS lowest_gpa
FROM students;

-- Count the Total Number of Students
SELECT COUNT(*) AS total_students
FROM students;

--  Count Students by Gender
SELECT gender, COUNT(*) AS student_count
FROM students
GROUP BY gender
ORDER BY student_count DESC;

-- Find Average GPA by Gender
SELECT gender, AVG(gpa) AS avg_gpa
FROM students
WHERE gpa IS NOT NULL
GROUP BY gender
ORDER BY avg_gpa DESC;

-- Find the Most Recent Enrollment Date
SELECT MAX(enrollment_date) AS latest_enrollment
FROM students;

--Find the Oldest Student's Birth Year
SELECT MIN(date_of_birth) AS oldest_student_birthdate
FROM students;

---Count Students with GPA ≥ 3.5
SELECT COUNT(*) AS high_gpa_students
FROM students
WHERE gpa >= 3.5;

---Find Youngest & Oldest Students' Birthdates
SELECT MAX(date_of_birth) AS youngest_student, MIN(date_of_birth) AS oldest_student
FROM students;
