-- Active: 1747459510114@@localhost@5432@ph
CREATE TABLE ph_student (
    id SERIAL PRIMARY KEY,
    roll INTEGER UNIQUE,
    name VARCHAR(50),
    age INTEGER,
    department TEXT,
    score INTEGER,
    status TEXT CHECK (status IN ('passed', 'failed')),
    last_login DATE
);

drop table ph_student

ALTER Table ph_student
ADD column email VARCHAR(20)

SELECT * FROM ph_student

ALTER TABLE ph_student
RENAME column email to student_email;

ALTER TABLE ph_student
ADD constraint unique_student_email UNIQUE(student_email)

-- ALTER TABLE ph_student
-- ADD constraint pk_student

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

ALTER Table ph_student
DROP column student_email;

SELECT * FROM ph_student

DROP Table ph_student

INSERT INTO ph_student(roll, name, age, department, score, status, last_login) VALUES
(101, 'Ayaan', 20, 'CSE', 85, 'passed', '2025-05-17'),
(102, 'Riya', 19, 'EEE', 73, 'passed', '2025-05-15'),
(103, 'Tanvir', 22, 'BBA', 48, 'failed', '2024-12-20'),
(104, 'Nadia', 18, 'CSE', 90, 'passed', '2025-05-16'),
(105, 'Shuvo', 21, 'ME', 67, 'passed', '2024-11-02'),
(106, 'Lima', 23, 'EEE', 49, 'failed', '2023-12-10'),
(107, 'Hasan', 20, 'CSE', 55, 'passed', '2025-01-05'),
(108, 'Alif', 24, 'CSE', 95, 'passed', '2025-05-18'),
(109, 'Borna', 19, 'LAW', 40, 'failed', '2023-08-25'),
(110, 'Arif', 20, 'EEE', 78, 'passed', '2025-04-01'),
(111, 'Mahi', 22, 'CSE', 88, 'passed', '2025-05-16'),
(112, 'Sumaiya', 21, 'BBA', 42, 'failed', '2024-12-11'),
(113, 'Imran', 23, 'EEE', 65, 'passed', '2025-03-10'),
(114, 'Farhana', 19, 'ME', 91, 'passed', '2025-05-17'),
(115, 'Kabir', 18, 'CSE', 38, 'failed', '2023-09-22'),
(116, 'Nabila', 20, 'LAW', 76, 'passed', '2025-04-20'),
(117, 'Zahid', 24, 'EEE', 59, 'passed', '2025-02-14'),
(118, 'Rafsan', 22, 'BBA', 33, 'failed', '2023-07-01'),
(119, 'Afia', 21, 'ME', 84, 'passed', '2025-05-10'),
(120, 'Ratul', 20, 'CSE', 92, 'passed', '2025-05-18'),
(121, 'Sami', 23, 'EEE', 81, 'passed', '2025-04-11'),
(122, 'Tania', 22, 'CSE', 47, 'failed', '2024-12-25'),
(123, 'Ovi', 19, 'ME', 66, 'passed', '2025-03-28'),
(124, 'Joya', 20, 'LAW', 58, 'passed', '2025-05-17'),
(125, 'Tariq', 21, 'BBA', 37, 'failed', '2023-10-04'),
(126, 'Nayeem', 18, 'CSE', 93, 'passed', '2025-05-18'),
(127, 'Ria', 24, 'EEE', 72, 'passed', '2025-04-06'),
(128, 'Hassan', 20, 'CSE', 45, 'failed', '2024-11-30'),
(129, 'Sadia', 19, 'LAW', 86, 'passed', '2025-01-25'),
(130, 'Mahfuz', 22, 'BBA', 50, 'passed', '2025-05-12');

SELECT * FROM ph_student

SELECT * FROM ph_student
WHERE score >= 80 AND age IS NOT NUll;

SELECT * FROM ph_student
where department <> 'EEE';

SELECT * FROM ph_student;

SELECT name from ph_student
where name like 'A%';

SELECT name from ph_student
where name Ilike 'a%';

SELECT * from ph_student
where age BETWEEN 18 AND 19;

SELECT * from ph_student
where roll IN(102, 104,129)

select avg(score) from ph_student 

select min(age) from ph_student;
select max(age) from ph_student 


SELECT * from ph_student;

UPDATE ph_student
set status = 'passed'
where status = 'failed';

UPDATE ph_student
set status = 'failed'
WHERE score <= 50;

DELETE FROM ph_student
WHERE last_login < CURRENT_DATE - INTERVAL '1 year';



SELECT * from ph_student LIMIT 5 OFFSET 5*1
