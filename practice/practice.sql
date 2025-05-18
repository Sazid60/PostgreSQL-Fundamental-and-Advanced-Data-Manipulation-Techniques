-- Active: 1747459510114@@localhost@5432@ph

CREATE TABLE practice_table(
    id serial PRIMARY key,
    student_id INTEGER REFERENCES students(student_id),
    name VARCHAR(20) NOT NULL,
    age INTEGER,
    email VARCHAR(100) NOT NULL UNIQUE,
    dob DATE,
    class VARCHAR(5) NOT NULL,
    hobby VARCHAR(20),
    isActive BOOLEAN default false
)

SELECT * from students;
SELECT * from practice_table;

INSERT INTO tabbul; (student_id, name, age, email, dob, hobby, status, course)
VALUES 
(3, 'Alice', 20, 'alice@example.com', '2005-08-15', '10A', 'Reading', true),
(4, 'Bob', 18, 'bob@example.com', '2007-01-22', '9B', 'Football', false),
(5, 'Charlie', 19, 'charlie@example.com', '2006-05-10', '10B', 'Drawing', true),
(6, 'Daisy', 17, 'daisy@example.com', '2008-03-14', '9A', 'Music', true),
(7, 'Ethan', 21, 'ethan@example.com', '2004-11-02', '11C', 'Gaming', false);

ALTER TABLE practice_table
ADD COLUMN course TEXT DEFAULT 'PH-L-2';

SELECT * from practice_table;

ALTER TABLE practice_table
DROP COLUMN class;

ALTER TABLE practice_table
RENAME TO tabbul;

SELECT * from tabbul;

ALTER TABLE tabbul
RENAME column isActive TO status;

ALTER Table tabbul
Alter COLUMN email type VARCHAR(90);


ALTER TABLE tabbul
ALTER COLUMN age set NOT NULL;


ALTER TABLE tabbul
ADD CONSTRAINT age_check CHECK (age >= 10);

ALTER TABLE tabbul
DROP CONSTRAINT age_check;

SELECT * from tabbul;
TRUNCATE TABLE tabbul;

INSERT INTO tabbul (student_id, name, age, email, dob, hobby, status, course)
VALUES 
(3, 'Alice', 20, 'alice@example.com', '2005-08-15', 'Reading', true, 'PH-L-2'),
(4, 'Bob', 18, 'bob@example.com', '2007-01-22', 'Football', false, 'PH-L-2'),
(5, 'Charlie', 19, 'charlie@example.com', '2006-05-10', 'Drawing', true, 'PH-L-2'),
(6, 'Daisy', 17, 'daisy@example.com', '2008-03-14', 'Music', true, 'PH-L-2'),
(7, 'Ethan', 21, 'ethan@example.com', '2004-11-02', 'Gaming', false, 'PH-L-2');

SELECT * from tabbul;

SELECT name as "student name" from tabbul ORDER BY name DESC;

SELECT * FROM students;

DROP TABLE tabbul;

CREATE TABLE tabbul (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 10),
    email VARCHAR(90) UNIQUE NOT NULL,
    dob DATE NOT NULL,
    hobby VARCHAR(50),
    status BOOLEAN DEFAULT true,
    course VARCHAR(20) DEFAULT 'PH-L-2'
);

INSERT INTO tabbul (student_id, name, age, email, dob, hobby, status, course)
VALUES 
(3, 'Fiona', 18, 'fiona@example.com', '2007-04-12', 'Dancing', true, 'PH-L-2'),
(4, 'George', 19, 'george@example.com', '2006-12-01', 'Swimming', false, 'PH-L-3'),
(5, 'Hannah', 17, 'hannah@example.com', '2008-09-25', 'Writing', true, 'PH-L-1'),
(6, 'Ibrahim', 20, 'ibrahim@example.com', '2005-06-20', 'Chess', true, 'PH-L-2'),
(7, 'Jasmine', 16, 'jasmine@example.com', '2009-01-30', 'Painting', false, 'PH-L-4'),
(8, 'Kevin', 18, 'kevin@example.com', '2007-03-15', 'Reading', true, 'PH-L-2'),
(9, 'Laura', 19, 'laura@example.com', '2006-05-21', 'Cooking', true, 'PH-L-1'),
(10, 'Mohit', 20, 'mohit@example.com', '2005-11-18', 'Football', false, 'PH-L-3'),
(11, 'Nina', 17, 'nina@example.com', '2008-07-07', 'Cycling', true, 'PH-L-2'),
(12, 'Omar', 18, 'omar@example.com', '2007-02-14', 'Gaming', false, 'PH-L-2'),
(13, 'Priya', 21, 'priya@example.com', '2004-10-29', 'Reading', true, 'PH-L-1'),
(14, 'Qasim', 20, 'qasim@example.com', '2005-08-10', 'Basketball', true, 'PH-L-2'),
(15, 'Riya', 18, 'riya@example.com', '2007-11-11', 'Dancing', true, 'PH-L-3'),
(16, 'Sam', 19, 'sam@example.com', '2006-06-06', 'Singing', false, 'PH-L-1'),
(17, 'Tina', 17, 'tina@example.com', '2008-03-09', 'Drawing', true, 'PH-L-4'),
(18, 'Umar', 20, 'umar@example.com', '2005-01-01', 'Gaming', true, 'PH-L-2'),
(19, 'Vera', 19, 'vera@example.com', '2006-09-19', 'Coding', false, 'PH-L-2'),
(1, 'Wasim', 18, 'wasim@example.com', '2007-05-30', 'Photography', true, 'PH-L-3'),
(20, 'Xena', 21, 'xena@example.com', '2004-12-12', 'Writing', true, 'PH-L-1')

SELECT * FROM tabbul;

SELECT DISTINCT status FROM tabbul;

SELECT * from tabbul
where age >= 19;

SELECT * from tabbul
where age >= 15 AND hobby='Swimming';

SELECT upper(name), length(name) from tabbul;

