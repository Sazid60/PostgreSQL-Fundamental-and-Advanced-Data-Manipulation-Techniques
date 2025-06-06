# PostgreSQL-Fundamental-and-Advanced-Data-Manipulation-Techniques

## 8-1 Using The Alter Keyword To Modify Tables and Setting Up PostgreSQl In Vscode.

### Lets learn about alter.

- By using this command we can change any structure of any existing table.
- Suppose we want to add more column or any columns constrains need to be changed or the data type needs to be changed. if we want we can remove any constrain as well. we can change column name. we will use `ALTER`,

![alt text](<WhatsApp Image 2025-05-16 at 18.58.22_d5cac800.jpg>)

#### Syntax of alter

```sql
ALTER TABLE table_name
action;
```

![alt text](<WhatsApp Image 2025-05-16 at 19.01.36_69ee5b85.jpg>)

- now lets setup Postgres in Vscode

![alt text](image.png)

- By clicking here we can run query.

![alt text](image-1.png)

- We can select the server from here as well.

![alt text](image-3.png)

![alt text](image-4.png)

## 8-2 Expanding On the ALTER Keyword for table Modification

#### Adding a Column

```sql
ALTER table person2
ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;
```

![alt text](image-5.png)

- here we can not directly say that it can not be null since we are just adding the column and setting no values as well there will be no email so the default value is added as default. now we will change.

#### Inserting data

```sql
INSERT INTO person2 VALUES(7,'test',45);

INSERT INTO person2 VALUES(8,'test',45, 'test@gmail.com');
```

![alt text](image-6.png)

#### Drop a column

```sql
ALTER TABLE person2
DROP COLUMN email;
```

- as we are not dropping the whole table we are just modifying the table so we have to use drop column inside the alter.

![alt text](image-7.png)

#### Renaming a column name

```sql
ALTER TABLE person2
RENAME COLUMN age to user_age;
```

- this takes column age and make it user_age

![alt text](image-8.png)

#### Changing Data Types

```sql
ALTER TABLE person2
ALTER COLUMN user_name TYPE VARCHAR(50)
```

- This will change the varchar 20 to 50

![alt text](image-9.png)

#### Changing Constrain in existing column.

```sql
ALTER TABLE person2
ALTER COLUMN user_age set NOT NULL;
```

- This will make user_age not null
- We can use any constrain
- for check we have to do it differently

```sql
ALTER TABLE person2
ADD CONSTRAINT age_check CHECK (user_age  >= 10);

ALTER TABLE person2
DROP CONSTRAINT age_check;

```

#### Remove a Constrain from existing column.

```sql
ALTER TABLE person2
ALTER COLUMN user_age DROP NOT NULL;
```

## 8-3 Different Method To Alter Tables For Primary Key, Unique Etc

#### More Constrain Change Using ALTER

- We can not set unique, primary key, foreign key, check constrain doing alter, this will give us error. when it comes to individual column works like not null, default value setting, the alter works perfectly. unique, primary key, foreign key, check, here we can engage multiple column, so the syntax is different for these.

##### Adding Unique Constrain and dropping unique key

```sql
ALTER TABLE person2
ADD constraint unique_person2_user_age UNIQUE(user_age);
```

- here `unique_person2_user_age` is just a name so that we can remember.
- If we want to drop the unique kye constraint

```sql

ALTER TABLE person2
DROP constraint unique_person2_user_age

```

##### Adding Primary Key Constrain

```sql
ALTER TABLE person2
ADD constraint pk_person2_user_age PRIMARY KEY(user_age);
```

#### Adding Check Constrain

```sql
ALTER TABLE person2
ADD CONSTRAINT check_valid_age CHECK (user_age >= 18 AND user_age <= 100);
```

##### Like this we can also use for foreign key.

#### Using TRUNCATE

- If we want to keep the table structure but there will be no data then we will use truncate

```sql
TRUNCATE TABLE person2;
```

- if we use drop the entire table with structure will be gone.

```sql
DROP TABLE person2;
```

#### Using Select

- The `SELECT` statement is used to retrieve data from one or more tables and can be customized with `conditions`, `sorting` and other clauses. Its basically used fro data query

![alt text](<WhatsApp Image 2025-05-17 at 10.47.19_68505fc6.jpg>)

## 8-4 Mastering SELECT Queries: Column Aliasing and Result Ordering In PostgreSQL

- lets create a table

```sql
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
```

- now lets insert the data, here student_id is not given since serial type automatically places incremental value.

```sql

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
```

### claus for SELECT

#### From claus

```sql
SELECT * FROM students;
```

- `*` means you select all the columns of the table

- If we just want to see the email we can use

```sql
SELECT email FROM students;
```

- If we want to see multiple columns

```sql
SELECT email,age,blood_group FROM students;
```

#### Aliasing a column

```sql
SELECT email as student_email FROM students
```

![alt text](image-10.png)

- if we want to alias spaced name we have to use "". '' will not work here since '' is for string

```sql
SELECT email as "Student Email", age FROM students;
```

#### Sorting

- If we want to sort the first_name in ascending we have to use `ORDER BY first_name ASC`

```sql
SELECT * FROM students ORDER BY first_name ASC;
```

- for descending order we have to say `DESC`

```sql
SELECT * FROM students ORDER BY first_name DESC;
```

```sql
SELECT first_name FROM students ORDER BY first_name DESC;
```

- by using `ORDER BY` we can see the data by sorting

## 8-5 Data Filtering: WHERE Clause, Logical Operators, and Comparison Operators

#### DISTINCT

- we have some duplicate countries, now we want to see the distinct countries only(UNIQUE COUNTRIES) we have to use `DISTINCT`.

```sql
SELECT DISTINCT country from students ORDER BY country ASC;
```

- to see the distinct blood_group

```sql
SELECT DISTINCT blood_group FROM students;
```

#### Filtering data Using `WHERE`(CONDITION BASED FILTERING)

##### Data Filtering

- select students from USA,

```sql
SELECT * FROM students
WHERE country = 'USA';
```

- select students with 'A' grade in physics

```sql
SELECT * FROM students
WHERE grade='A' AND course = 'Physics';
-- AND keyword is used to combine two conditions
```

- select student with specific blood_group ('A+')

```sql
SELECT * FROM students
WHERE blood_group = 'A+';
```

- select students from usa or australia

```sql
SELECT * FROM students
WHERE country = 'Australia' OR  country = 'USA'
```

- select students from usa or australia and the age is 20

```sql
SELECT * from students
WHERE (country = 'USA' OR country='Australia') AND age =20;
-- here comparison operator can also be used.
```

- use comparison operator. select students older than = 20 years

```sql
SELECT * FROM students
WHERE age >= 20;

```

- select students older than 20 years and subject is History

```sql
SELECT * FROM students
WHERE age >= 20 AND course='History';
```

- select students who are not = 20 years

```sql
SELECT * FROM students
-- where age != 20;
where age <> 20;

SELECT * FROM students
where country <> 'USA';
```

- select students with 'A' or 'B' grade in math or physics

```sql
SELECT * FROM students
where (course = 'Math' OR course='Physics') AND (grade = 'A' OR grade = 'B')
```

## 8-6 Exploring Scalar and Aggregate Functions in PostgreSQL

#### `Upper()` Function

- Suppose we want to see the first_name of all in capital word while seeing. we can use `upper()` function to see.

```sql
SELECT upper(first_name) FROM students;
```

- if we want to see the upper cased first_name and all the table data we have to use this.

```sql
SELECT upper(first_name),* FROM students;
```

![alt text](image-12.png)

- This is doing something like taking the first name and creating a column named upper and keeping there.
- we can change the name of the column as well using alias

```sql
SELECT upper(first_name) as first_name_in_upper_case, * FROM students;
```

#### `Concat()` Function

- Suppose we want to see the first name and the last name to form a full name we can use concat

```sql
SELECT concat(first_name, last_name) FROM students;
```

```sql
SELECT concat(first_name, ' ', last_name) as full_name FROM students;
```

![alt text](image-13.png)

#### `Length()` Function

```sql
SELECT length(first_name) FROM students;
```

#### Functions in depth in postgres

- `upper()`, `concat()` these are called Functions(scaler) in Postgres
- there two types of functions in postgres

  1. `Scaler`: Operate ona single value and return a single value. they perform an operation on each rows data independently. This function will run one time against one row and will give value for each row and will run independently as a result there will no connection on previous or upcoming row. If we call scaler function we will get multiple data since it will give data for each row.

  ```sql
  SELECT concat(first_name, ' ', last_name) as full_name FROM students;
  ```

  ![alt text](<WhatsApp Image 2025-05-17 at 14.47.56_7bcc3448.jpg>)

##### There are some `scaler` functions

- `UPPER()` Converts a string to uppercase
- `LOWER()` Converts a string to Lowercase
- `CONCAT()` Concatenates two or more strings
- `LENGTH()` Returns the number of characters in a string

  1. `Aggregate` : Aggregate Function operate on a set of values and return a single value summarizing the set. They perform an operation across multiple rows, often used with `GROUP BY` clause.

  ![alt text](<WhatsApp Image 2025-05-17 at 14.51.50_6449e6c5.jpg>)

##### There are some `aggregation` functions

- `AVG()` Calculate the average of a set of values

  ```sql
  select avg(age) from students;
  ```

- `MAX()` Returns the max value in a set

  ```sql
  select max(age) from students;
  ```

- `MIN()` Returns the minimum values in a set

  ```sql
  select min(age) from students;
  ```

- `SUM()` Calculates the sum of values in a set

  ```sql
  select sum(age) from students;
  ```

- `COUNT()` Counts The number of rows in a set

  ```sql
  select count(*) from students;
  -- This will count the rows
  ```

##### We can use the `scaler` and `aggregate` function together as well

- suppose we want see whose first_name length is maximum?

```sql
SELECT max(length(first_name)) FROM students
```

![alt text](image-14.png)

## 8-7 Logical Negation NOT, understanding NULL and the Null-Coalescing Operator in PostgreSQL

#### Using Logical Negation `NOT`

```sql
SELECT * FROM students
where country <> 'USA';
```

- we can write this using `NOT`

```sql
SELECT * FROM students
where NOT country = 'USA';
```

- When we will write complex query then we will be able to reverse the query using `NOT` to negate.

#### Usage of `NULL`

- Null is crucial part since it depends on us and we have to handle smartly.
- js null si neither true neither false. but in postgres null is false.
- Null and empty string is different
- Whatever we do using null, everything will be null.

  ```sql
  SELECT NULL= NULL
  ```

  ![alt text](image-15.png)

  ```sql
  SELECT NULL <> NULL

  ```

  ```sql
  SELECT NULL = 1

  ```

  ```sql
  SELECT NULL <> 1
  ```

![alt text](image-16.png)

#### `IS` operator usage

- Suppose we want to find the students who's email value is not null

```sql
SELECT * FROM students
where email != NULL;
```

- this not right since whatever we do with null it will give us null and this give nothing of the table. but we need true of false. for this reason we will use `IS` Operator.

```sql
SELECT * FROM students
where email IS NULL;

SELECT * FROM students
where email IS not NULL;
```

#### `Null-Coalescing` Operator

- suppose we have a situation like we know there might be some null values in email field. When sending to frontend it might cause error in frontend for being null. for this we have to set a default value so that frontend do not give error. and here `Coalescing` operator comes with help.

```sql
SELECT COALESCE(NULL,NULL,5)

-- The values are: NULL, NULL, 5
-- NULL is skipped.
-- NULL is skipped.
-- 5 is the first non-NULL value → so it is returned.
```

- Lets try with a column
- This will do something like if the email field is null i will show the given value for the null email.

```sql
SELECT COALESCE(email,'No Email') from students;

SELECT COALESCE(email,'No Email') as "Email", blood_group, first_name from students;
```

## 8-8 Exploring IN, BETWEEN, LIKE, and ILIKE Operators in PostgreSQL.

#### `IN` keyword usage

- suppose we want to see who are from USA,UK,Canada

```sql
SELECT * FROM  students
WHERE country='USA' OR country='UK' OR country='Canada';
```

- This is lengthy query and some repetitive things we are writing. so we can use `IN` keyword

```sql
SELECT * FROM  students
WHERE country IN('USA','UK','Canada');
```

- This doing same thing like multiple or

#### `NOT IN` keyword usage

- This is reverse of `IN` keyword. and giving who are not from USA,UK,Canada

```sql
SELECT * FROM  students
WHERE country NOT IN('USA','UK','Canada');
```

#### `BETWEEN` Keyword usage

- Suppose we want to grab the students who's are age in between 18-20

```sql
SELECT * FROM students
WHERE age BETWEEN 19 AND 20
```

- this `between` used more with date

```sql
SELECT * FROM students
WHERE dob BETWEEN '2001-01-14' AND '2003-01-14'
```

- we can sort as well

```sql
SELECT * FROM students
WHERE dob BETWEEN '2001-01-14' AND '2003-01-14' ORDER BY dob;
```

#### `LIKE` operator usage

- Its kind of search. I8 will give pattern like string, if anything matches with it, it will return the data.
- Its like regex
- suppose we want the name who has `n` at the end

```sql
SELECT * FROM students
where last_name LIKE '%n';
```

- Here % means before `n` anything could be but it will end with `n` word.

```sql
SELECT * FROM students
where last_name LIKE 'A%';
```

- Here % means after `A` anything could be but it will start with `A` word.
- `LIKE` is case sensitive.

```sql
SELECT * FROM students
where first_name LIKE '__a%';
```

- This means after first two character third character will `a` and after a there can be anything.

![alt text](image-17.png)

```sql
SELECT * FROM students
where first_name LIKE '___a_';
```

#### `ILIKE` usage

- `ILIKE` is cas insensitive

```sql
SELECT * FROM students
where last_name ILIKE 'a%';
```

## 8-9 Pagination with Limit Offset and Data Deletion in PostgreSQL

- `LIMIT` and `OFFSET` is useful while doing pagination.

#### Lets Understand `Limit`

```sql
SELECT * FROM students;
```

- This is giving us all the data in one page.

- Now we will limit how many `columns` it will give me and how many `rows` it will give me.
- lets say i just want 5 data

```sql
SELECT * FROM students LIMIT 5;
```

![alt text](image-19.png)

- We can say to `Limit` after any query.

```sql
SELECT * FROM  students
WHERE country IN('USA','UK','Canada') LIMIT 2;
```

#### Lets Understand `OFFSET`

- Lets think of it like skip first 2 and then give me 5 data after the 2

```sql
SELECT * FROM students limit 5 OFFSET 2;
```

#### Now lets think about how do we implement with `LIMIT` and `OFFSET`

- Suppose we have 5 pages and we know how many data each page will contain. lets assume we want to show 5 data per page. for first page we tell backend that its 0 number page, for second page we will tell backend this is 1 number page like array index.

```sql
-- pagination__________________________________________________________________
-- first page
SELECT * FROM students limit 5 OFFSET 5 * 0;
-- second page
SELECT * FROM students limit 5 OFFSET 5 * 1;
-- third page
SELECT * FROM students limit 5 OFFSET 5 * 2;
-- fourth page
SELECT * FROM students limit 5 OFFSET 5 * 3;

```

#### Now lets see deletion of a data `Delete`

- we may delete one row or multiple row.

```sql
DELETE FROM students;
```

- this will delete all the data in the table this is not right.

- Delete the students who have got B,

```sql
DELETE FROM students
WHERE grade = 'B';
```

- another one

```sql
DELETE FROM students
WHERE grade = 'C' AND country='USA';
```

- we can any condition for delegation.

## 8-10 Understanding and Using the UPDATE Operator in PostgreSQL

- There is a issue with the serial number, even if all the data is deleted the serial number will start from the last number he had perviously. This is default behavior

- This is how we can change email maintaining the condition.

```sql
UPDATE students
set email = 'default@email.com'
where student_id = 1;
```

- we can update multiple column data at a time

```sql
UPDATE students
set email = 'default@email.com', age = 100, course = 'CS50'
where student_id = 20;
```

## Practice Task

Practice Tasks: Module-8

https://docs.google.com/document/d/1yxfMf68CPgHahza6aAkL_eauCsNeoEc9uwbHPNuR-RM/mobilebasic?usp=embed_facebook

# Module-8 Practice Tasks: SQL Exercises on Students Table

This repository contains SQL practice tasks based on a sample table named `students`.  
Use this as a reference while solving the tasks.

---

## Table Overview

| Column Name  | Description                            |
| ------------ | -------------------------------------- |
| `id`         | Auto-incremented primary key           |
| `roll`       | Unique roll number for each student    |
| `name`       | Name of the student                    |
| `age`        | Age of the student                     |
| `department` | Student’s department (e.g., CSE, EEE)  |
| `score`      | Score achieved by the student          |
| `status`     | Academic status (e.g., passed, failed) |
| `last_login` | Last login date                        |

---

## Table Alteration Tasks

1. **Add a column `email` (VARCHAR) to the existing `students` table**

   ```sql
   ALTER TABLE students
   ADD COLUMN email VARCHAR(100);
   ```

2. **Rename the column `email` to `student_email`**

   ```sql
   ALTER TABLE students
   RENAME COLUMN email TO student_email;
   ```

3. **Add a UNIQUE constraint to `student_email`**

   ```sql
   ALTER TABLE students
   ADD CONSTRAINT unique_student_email UNIQUE(student_email);
   ```

4. **Add a PRIMARY KEY to a new table named `courses`**

   ```sql
   CREATE TABLE courses (
       course_id SERIAL PRIMARY KEY,
       course_name VARCHAR(100)
   );
   ```

5. **Drop a column from any existing table**

   ```sql
   ALTER TABLE students
   DROP COLUMN student_email;
   ```

---

## Filtering & Logical Operations

1. **Find all students who have a score greater than 80 and not null**

   ```sql
   SELECT * FROM students
   WHERE score > 80 AND score IS NOT NULL;
   ```

2. **Use the NOT operator to exclude students from a specific department**

   ```sql
   SELECT * FROM students
   WHERE NOT department = 'CSE';
   ```

3. **Fetch students whose names start with ‘A’ using LIKE and ILIKE**

   ```sql
   -- Case-sensitive
   SELECT * FROM students
   WHERE name LIKE 'A%';

   -- Case-insensitive
   SELECT * FROM students
   WHERE name ILIKE 'a%';
   ```

4. **Select all students whose age is between 18 and 25**

   ```sql
   SELECT * FROM students
   WHERE age BETWEEN 18 AND 25;
   ```

5. **Retrieve rows using IN for a specific set of roll numbers**

   ```sql
   SELECT * FROM students
   WHERE roll IN (101, 102, 105);
   ```

---

## Aggregate Functions

1. **Count how many students exist in the students table**

   ```sql
   SELECT COUNT(*) AS total_students FROM students;
   ```

2. **Find the average score of students in a specific department**

   ```sql
   SELECT AVG(score) AS avg_score
   FROM students
   WHERE department = 'CSE';
   ```

3. **Get the maximum and minimum age of all students**

   ```sql
   SELECT MAX(age) AS max_age, MIN(age) AS min_age FROM students;
   ```

---

## Update & Delete Operations

1. **Update the status of students who scored less than 50 to 'failed'**

   ```sql
   UPDATE students
   SET status = 'failed'
   WHERE score < 50;
   ```

2. **Delete students who have not logged in since last year**

   ```sql
   DELETE FROM students
   WHERE last_login < CURRENT_DATE - INTERVAL '1 year';
   ```

3. **Use LIMIT and OFFSET to fetch the second page of results (5 per page)**

   ```sql
   SELECT * FROM students
   ORDER BY id
   LIMIT 5 OFFSET 5;
   ```

---

Feel free to use these queries to practice and test your SQL skills!

---
