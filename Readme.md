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

## 8-4 bMastering SELECT Queries: Column Aliasing and Result Ordering In PostgreSQL

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
