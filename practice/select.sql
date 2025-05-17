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

SELECT * FROM students;
SELECT email FROM students;
SELECT email,age,blood_group FROM students;

SELECT email as student_email FROM students

SELECT email as "Student Email", age FROM students;

SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY first_name DESC;

SELECT first_name FROM students ORDER BY first_name DESC;

SELECT * FROM students ORDER BY age DESC;

SELECT DISTINCT country from students ORDER BY country ASC;

SELECT DISTINCT blood_group FROM students;

-- - select students from USA,
SELECT * FROM students
WHERE country = 'USA';

-- - select students with 'A' grade in physics
SELECT * FROM students
WHERE grade = 'A' AND course = 'Physics';

-- - select student with specific blood_group ('A+')
SELECT * FROM students
WHERE blood_group = 'A+';

-- - select students from usa and australia

SELECT * FROM students
WHERE country = 'Australia' OR  country = 'USA'

-- - select students from usa and australia and the age is 20

SELECT * from students
WHERE (country = 'USA' OR country='Australia') AND age =20;
-- - select students with 'A' or 'B' grade in math or physics

-- - select students older than 20 years

SELECT * FROM students
WHERE age >= 20;


-- - select students older than 20 years and subject is History

SELECT * FROM students
WHERE age >= 20 AND course='History';

-- - select students who are not = 20 years

SELECT * FROM students
-- where age != 20;
where age <> 20;

SELECT * FROM students
where country <> 'USA';

-- - select students with 'A' or 'B' grade in math or physics

SELECT * FROM students
where (course = 'Math' OR course='Physics') AND (grade = 'A' OR grade = 'B')

SELECT * FROM students

SELECT upper(first_name),* FROM students;

SELECT upper(first_name) as first_name_in_upper_case, * FROM students;

SELECT concat(first_name, ' ', last_name) as full_name FROM students;

SELECT length(first_name) FROM students;

select avg(age) from students;

select max(age) from students;
select min(age) from students;
select sum(age) from students;

select count(*) from students;

SELECT max(length(first_name)) FROM students

SELECT * FROM students
where NOT country = 'USA';

SELECT NULL= NULL;

SELECT NULL <> NULL

SELECT NULL <> 1

SELECT NULL = 1

SELECT * FROM students
where email != NULL;

SELECT * FROM students;

SELECT * FROM students
where email != NULL;

SELECT * FROM students
where email IS NULL;

SELECT * FROM students
where email IS not NULL;

SELECT COALESCE(NULL,NULL,5)

SELECT email from students;
SELECT COALESCE(email,'No Email') as "Email", blood_group, first_name from students;

SELECT * FROM  students
WHERE country='USA' OR country='UK' OR country='Canada';



SELECT * FROM  students
WHERE country IN('USA','UK','Canada');


SELECT * FROM  students
WHERE country NOT IN('USA','UK','Canada');

SELECT * FROM students
WHERE age BETWEEN 19 AND 20

SELECT * FROM students
WHERE dob BETWEEN '2001-01-14' AND '2003-01-14' ORDER BY dob;


SELECT * FROM students
where last_name LIKE '%n';

SELECT * FROM students
where last_name LIKE 'A%';

SELECT * FROM students
where first_name LIKE '__a%';

SELECT * FROM students
where first_name LIKE '___a_';

SELECT * FROM students
where last_name ILIKE 'a%';