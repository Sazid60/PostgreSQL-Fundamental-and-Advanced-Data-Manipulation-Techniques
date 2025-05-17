-- Active: 1747401214883@@127.0.0.1@5432@ph
CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
age INT,
grade CHAR(2),
course VARCHAR(20),
email VARCHAR(100),
dob DATE,
blood_group VARCHAR(5),
country VARCHAR(50)
)


INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('John', 'Doe', 20, 'A+', 'Math', 'john.doe@example.com', '2004-05-12', 'O+', 'USA'),
('Jane', 'Smith', 22, 'B', 'Physics', 'jane.smith@example.com', '2002-03-25', 'A-', 'UK'),
('Robert', 'Brown', 21, 'A', 'Chemistry', 'robert.brown@example.com', '2003-08-19', 'B+', 'Canada'),
('Emily', 'Davis', 19, 'C+', 'Biology', 'emily.davis@example.com', '2005-11-07', 'AB-', 'Australia'),
('Michael', 'Johnson', 23, 'B-', 'Math', 'michael.johnson@example.com', '2001-01-14', 'O-', 'USA'),
('Sarah', 'Wilson', 20, 'A-', 'English', 'sarah.wilson@example.com', '2004-06-30', 'A+', 'India'),
('David', 'Lee', 18, 'C', 'Computer', 'david.lee@example.com', '2006-09-22', 'B-', 'South Korea'),
('Laura', 'Garcia', 21, 'A+', 'History', 'laura.garcia@example.com', '2003-02-10', 'O+', 'Spain'),
('James', 'Martinez', 22, 'B+', 'Math', 'james.martinez@example.com', '2002-12-03', 'AB+', 'Mexico'),
('Linda', 'Anderson', 20, 'A', 'Physics', 'linda.anderson@example.com', '2004-07-15', 'B+', 'USA'),
('Daniel', 'Thomas', 19, 'B-', 'Biology', 'daniel.thomas@example.com', '2005-04-17', 'A-', 'UK'),
('Olivia', 'Taylor', 22, 'A+', 'Computer', 'olivia.taylor@example.com', '2002-10-29', 'O-', 'Germany'),
('Matthew', 'Hernandez', 20, 'C+', 'Chemistry', 'matthew.hernandez@example.com', '2004-01-06', 'B+', 'Brazil'),
('Sophia', 'Moore', 21, 'A', 'English', 'sophia.moore@example.com', '2003-09-14', 'AB+', 'France'),
('Anthony', 'Jackson', 23, 'B+', 'History', 'anthony.jackson@example.com', '2001-05-05', 'O-', 'USA'),
('Chloe', 'White', 18, 'C-', 'Math', 'chloe.white@example.com', '2006-12-27', 'A-', 'Australia'),
('Joshua', 'Lopez', 20, 'A', 'Computer', 'joshua.lopez@example.com', '2004-03-02', 'B+', 'Colombia'),
('Grace', 'Gonzalez', 19, 'B', 'Physics', 'grace.gonzalez@example.com', '2005-08-11', 'O+', 'Argentina'),
('Andrew', 'Clark', 21, 'A+', 'Biology', 'andrew.clark@example.com', '2003-06-20', 'A+', 'Canada'),
('Ella', 'Lewis', 22, 'B-', 'English', 'ella.lewis@example.com', '2002-04-08', 'AB-', 'USA');

SELECT email FROM students;
SELECT email,age,blood_group FROM students;

SELECT email as student_email FROM students

SELECT email as "Student Email", age FROM students;

SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY first_name DESC;

SELECT first_name FROM students ORDER BY first_name DESC;

SELECT * FROM students ORDER BY age DESC;