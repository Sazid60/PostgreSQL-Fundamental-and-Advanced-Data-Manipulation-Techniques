-- Active: 1747401214883@@127.0.0.1@5432@ph
SELECT * FROM person2;

ALTER table person2
ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;

INSERT INTO person2 VALUES(7,'test',45);

INSERT INTO person2 VALUES(8,'test',45, 'test@gmail.com');

DELETE FROM person2
WHERE ctid = (
  SELECT ctid
  FROM person2
  ORDER BY id
  OFFSET 6
  LIMIT 1
);

-- DELETE FROM table_name WHERE condition;
-- This deletes the 7th row (OFFSET starts from 0) ordered by id.

ALTER TABLE person2 
DROP COLUMN email;

ALTER TABLE person2 
RENAME COLUMN age to user_age;

ALTER TABLE person2 
ALTER COLUMN user_name TYPE VARCHAR(50)


ALTER TABLE person2 
ALTER COLUMN user_age set NOT NULL;
ALTER TABLE person2 
ALTER COLUMN user_age DROP NOT NULL;




UPDATE person2 SET user_age = 32 WHERE id = 1;


ALTER TABLE person2
ADD constraint unique_person2_user_age UNIQUE(user_age);

ALTER TABLE person2
DROP constraint unique_person2_user_age

ALTER TABLE person2
ADD constraint pk_person2_user_age PRIMARY KEY(user_age);

DROP TABLE person2;
TRUNCATE TABLE person2;