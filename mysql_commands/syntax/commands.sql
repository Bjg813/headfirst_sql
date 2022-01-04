-- login to mysql in terminal
mysql --user=root -p

-- mySQL server password:
z52M1MjFLBvO

alias mysql=/usr/local/mysql/bin/mysql


-- Quit mysql
\q

-- Create a new database 
CREATE DATABASE [database_name];

-- See current databases
SHOW DATABASES;

-- See tables inside of a database
USE [database_name];

-- Create a primary key with PRIMAY KEY WITH AUTO_INCREMENT
CREATE TABLE clowns_contacts (
    contact_id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(30),
    first_name VARCHAR(20),
    email VARCHAR(50),
    PRIMARY KEY (contact_id)
);

SHOW TABLES;

-- See how your databases was created
SHOW CREATE DATABASE [database_name];

-- Show your work on a curret table
DESC your_table_name;

-- See how your table was created
SHOW CREATE TABLE [your_table_name];

-- See columns from a table
SHOW COLUMNS FROM [your_table_name];

-- Create a new table with data types
USE [database_name];
CREATE TABLE [table_name] (
    text_data_up_to_255_characters VARCHAR(20),
    text_data CHAR(1),
    whole_number INT, 
    decimal_number DEC(6,2),
    large_text_data BLOB,
    date_only_no_time DATE,
    date_and_time DATETIME,
    current_date_and_time TIMESTAMP,
    required_value_not_null CHAR(1) NOT NULL,
    default_value VARCHAR(2) DEFAULT 1.00,
    default_value_not_null VARCHAR(2) NOT NULL DEFAULT 1.00
);

-- Example how to create a table
CREATE TABLE soil_test_record 
    (
        contact_id INT NOT NULL AUTO_INCREMENT,
        id CHAR(1) NOT NULL, 
        date_applied DATE NOT NULL, 
        type_plant CHAR(25) NOT NULL, 
        ph_level DEC(3,2) NOT NULL, 
        nitrogen_reading CHAR(20) NOT NULL, 
        phosphorus_reading CHAR(20) NOT NULL, 
        potassium_reading CHAR(20) NOT NULL, 
        nitrogen_per_2000_sqft INT NOT NULL, 
        phosphorus_per_2000_sqft INT NOT NULL, 
        potassium_per_2000_sqft INT NOT NULL, 
        comments BLOB NOT NULL DEFAULT 'No Comments',
        PRIMARY KEY (contact_id)
    );


-- Delete a table
DROP TABLE your_table_name;

-- Add data to your table
INSERT INTO [your_table_name]
    (
        last_name, first_name, email, gender, birthday, profession, location, status, interests, seeking
    )
    VALUES
    (
        'Anderson', 'Jillian', 'jill_anderson@breakneckpizza.net', 'F', '1980-09-05', 'Technical Writer', 'Palo Alto, CA', 'Single', 'Kayaking, Reptiles', 'Relationship, Friends'
    );

-- Peek at your data in your table
SELECT * FROM [your_table_name];

-- Return specific records by searching colum fields and comparing them to data values
SELECT * FROM [your_table_name] WHERE [field_name] = [data_value];

-- Return specific columns from your table
SELECT [column_name, column_names] FROM [your_table_name] WHERE [column_name] = [data_value];
-- example:
SELECT drink_name FROM easy_drinks WHERE second = 'apricot nectar';

-- Combine queries
SELECT [field_name] FROM [your_table_name] WHERE [field_name] = [data_value] AND [field_name] = [data_value];
-- example: 
SELECT first_name FROM my_contacts WHERE gender = 'F' AND status = 'Single';

-- Combine queries using greater sign
SELECT drink_name FROM easy_drinks WHERE main = 'soda' AND amount1 > 1;

-- Combine queries using greater-equal sign
SELECT drink_name FROM easy_drinks WHERE main = 'soda' AND amount1 >= 1;

-- Directly select a NULL value is to use the keywords IS NULL
SELECT drink_name FROM drink_info WHERE calories IS NULL;

-- Using keyword LIKE with % wildcard
SELECT * FROM my_contacts WHERE location LIKE '%CA';

-- Using keyword BETWEEN in place of >= and <=
SELECT drink_name FROM drink_info WHERE calories BETWEEN 30 AND 60;

-- Using keyword IN in place of a bunch of 'OR's
SELECT drink_name FROM drink_info WHERE carbs IN (8.4, 3.2, 42.5, 4.2);

-- Using keyword NOT IN to return data in columns NOT IN the data value set - everything but these data values please
SELECT drink_name FROM drink_info WHERE carbs NOT IN (8.4, 3.2, 42.5, 4.2);

-- Can also use the keyword NOT with BETWEEN and LIKE - remember NOT goes right after WHERE
SELECT date_name FROM black_book WHERE NOT date_name LIKE 'A%' AND NOT date_name LIKE 'B%';

SELECT drink_name FROM drink_info WHERE NOT carbs BETWEEN 3 AND 5;

SELECT * FROM easy_drinks WHERE NOT main = 'soda' AND NOT main = 'iced tea';

-- Delete a row
DELETE FROM clown_info WHERE activities = 'dancing';

DELETE FROM doghnut_ratings WHERE location = 'Krispy King' OR rating > 5;

-- Update a value in a column - doesn't delete the record just recycles it
UPDATE doghnut_ratings SET type = 'glazed' WHERE type = 'plain glazed';

-- Update multiple values in columns at once
UPDATE doughnut_ratings SET rating = 20, type = 'not glazed' WHERE location = 'Krispy King';

-- Use addition to update your data
UPDATE drink_info SET cost = cost + 1 WHERE drink_name = 'Blue Moon' OR drink_name = 'Oh My Gosh' OR drink_name = 'Lime Fizz';

-- Create a primary key with PRIMAY KEY WITH AUTO_INCREMENT
CREATE TABLE clowns_contacts (
    contact_id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(30) DEFAULT NULL,
    first_name VARCHAR(20) DEFAULT NULL,
    email VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (contact_id)
);

-- See the indexed primary keys in your table
SHOW INDEX FROM [your_table_name];

-- See warnings if you get a message on your console that your SQL command has caused warnings
SHOW WARNINGS;

-- You can use ' backticks if you want to name one of your columns after a pre-determined keyword - however it is not recommended to use keywords as columns since its confusing and you have to use backticks which is annoying
CREATE TABLE table_name (
'select' varchar(50)
);

-- Add a new column to an existing table - Using ALTER and FIRST keyword
ALTER TABLE my_contacts ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (contact_id);

-- Add a new column to an existing table
ALTER TABLE my_contacts ADD COLUMN state CHAR(2);

-- How to delete a PRIMAY KEY
ALTER TABLE my_contacts DROP PRIMARY KEY;

-- Change a column to have AUTO_INCREMENT
ALTER TABLE my_contacts CHANGE contact_id contact_id INT(11) NOT NULL AUTO_INCREMENT;

-- Remove AUTO_INCREMENT from a column
ALTER TABLE my_contacts CHANGE contact_id contact_id INT(11) NOT NULL;

-- Add a new column to an existing table - using ALTER and SECOND keyword
ALTER TABLE my_contacts ADD COLUMN phone VARCHAR(10) SECOND;

-- Add a new column to an existing table - using ALTER and FIFTH keyword
ALTER TABLE my_contacts ADD COLUMN phone VARCHAR(10) FIFTH;

-- Add a new column to an existing table - using ALTER and AFTER keyword
ALTER TABLE my_contacts ADD COLUMN phone VARCHAR(10) AFTER first_name;

-- Add a new column to an existing table - using ALTER and BEFORE keyword
ALTER TABLE my_contacts ADD COLUMN phone VARCHAR(10) BEFORE last_name;

-- Add a new column to an existing table - using ALTER and LAST keyword
ALTER TABLE my_contacts ADD COLUMN phone VARCHAR(10) LAST;

-- Delete a column in an existing table - using ALTER and DROP keyword
ALTER TABLE my_contacts DROP COLUMN start_date;

-- Change table name using ALTER keyword
ALTER TABLE projekts RENAME TO project_list;

-- Alter the name of columns and data types - without affecting the data inside of the records
ALTER TABLE project_list CHANGE COLUMN descriptionofproj proj_desc VARCHAR(100), 
CHANGE COLUMN contractoronjob con_name VARCHAR(30);

-- Alter data type without needing to modify the column name
ALTER TABLE project_list MODIFY COLUMN proj_desc VARCHAR(120);

-- Then update data in the new column
UPDATE TABLE project_list SET proj_desc = 'Time tested this is a string' WHERE proj_desc = 25;

-- Alter multiple columns in an existing table
ALTER TABLE hooptie RENAME TO car_table, ADD COLUMN car_id INT NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (car_id), 
    ADD COLUMN VIN VARCHAR(17) AFTER car_id,
    CHANGE COLUMN mo model VARCHAR(20),
    MODIFY COLUMN color AFTER model,
    MODIFY COLUMN year SIXTH,
    CHANGE COLUMN howmuch price DEC(7,2);

-- ALTER TABLE rules to live by
CHANGE = when you want to change both the name and data type of a column
MODIFY = when you wish to change only the data type
DROP COLUMN = drops the named column from the table
RENAME = change the name of your table
Change the order of your columns =  FIRST, LAST, BEFORE column_name, AFTER column_name, SECOND, THIRD, FOURTH, etc.

-- How to select different string characters inside of a column - using RIGHT keyword
SELECT RIGHT(location, 2) FROM my_contacts;

-- How to select strings inside of a column - using SUBSTRING_INDEX keyword
SELECT SUBSTRING_INDEX(location, ',', 1) FROM my_contacts;

-- Use current column to fill a new column
UPDATE my_contacts SET state = RIGHT(location, 2);

-- Case expression - you can use case expressions with SELECT, INSERT, DELETE, and UPDATE keywords
UPDATE my_table
SET new_column = 
CASE 
    WHEN column1 = somevalue1
        THEN newvalue1
    WHEN column2 = somevalue2
        THEN newvalue2
    ELSE newvalue3
END;

-- Case expression - use expressions with AND
UPDATE movie_table
SET category = 
CASE
    WHEN drama = 'T' THEN 'drama'
    WHEN comedy = 'T' THEN 'comedy'
    WHEN action = 'T' THEN 'action'
    WHEN gore = 'T' THEN 'horror'
    WHEN scifi = 'T' THEN 'scifi'
    WHEN for_kids = 'T' THEN 'family'
    WHEN cartoon = 'T' AND rating = 'G' THEN 'family'
    ELSE 'misc'
END;

> SET category = 
    CASE
    WHEN gore = 'T' AND rating = 'R' THEN 'horror-r'
    WHEN action = 'T' AND rating = 'R' THEN 'action-r'
    WHEN drama = 'T' AND rating = 'R' THEN 'drama-r'
    WHEN comedy = 'T' AND rating = 'R' THEN 'comedy-r'
    WHEN scifi = 'T' AND rating = 'R' THEN 'scifi-r'
    WHEN category = 'misc' AND rating = 'G' THEN 'family'
    ELSE 'misc'
    END;

-- Delete columns using ALTER keyword
ALTER TABLE movie_table
DROP COLUMN drama,
DROP COLUMN comedy,
DROP COLUMN action,
DROP COLUMN gore,
DROP COLUMN scifi,
DROP COLUMN for_kids,
DROP COLUMN cartoon;

-- Order a column by alphabetical order using the ORDER BY keyword
SELECT title, column FROM movie_table WHERE category = 'family' ORDER BY title;

-- Order a column in descending order - use DESC keyword to dipslay your data in descending order
SELECT title FROM movie_table ORDER BY title DESC;

-- Order a column in ascending order - use ASC keyword to display data in ascending order
SELECT title FROM movie_table ORDER BY title ASC;

-- Add everything up in a column using the SUM function
SELECT SUM(sales) FROM cookie_sales WHERE first_name = 'Nicole';

-- SUM multiple columns at once using GROUP BY
SELECT first_name, SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales)DESC;

-- Find the maximum number in a column using MAX function
SELECT first_name, MAX(sales) FROM cookie_sales GROUP BY first_name ORDER BY MAX(sales)DESC;

-- Find the minimum number in a column using MIN function 
SELECT first_name, MIN(sales) FROM cookie_sales GROUP BY first_name ORDER BY MIN(sales)DESC;

-- Find the number of rows in a column using the COUNT function
SELECT COUNT(sale_date) FROM cookie_sales;

-- COUNT tell you how many rows match a SELECT query without you having to see the rows. COUNT returns a single integer value

-- Find specific number of rows in a column using WHERE and COUNT function
SELECT COUNT(sale_date) FROM cookie_sales WHERE sales > 0;

-- Find specific number of rows in a column using COUNT function and WHERE GROUP BY keywords
SELECT first_name, COUNT(sale_date) FROM cookie_sales WHERE sales > 0 GROUP BY first_name;

-- Find distinct data in a column using DISTINCT keyword
SELECT DISTINCT sale_date FROM cookie_sales ORDER BY sale_date;

-- Distinct counts how many instances of a piece of data and gives a one-of-a-kind results
-- DISTINCT helps when you have multiple records with the same value in a single column and you want to see the variety of the values
-- DISTINCT returns each unique value only once with no duplicates

-- Find how many isntances of distinct data in a column using COUNT function and DISTINCT keyword
SELECT COUNT(DISTINCT sale_date) FROM cookie_sales;

-- Figure out which girl sold cookies on the most days using COUNT() function DISTINCT keyword and WHERE GROUP BY
SELECT first_name, COUNT(DISTINCT sale_date) FROM cookie_sales WHERE sales > 0 GROUP BY first_name;

-- Add everything up in a column using the SUM function
SELECT SUM(sales) FROM cookie_sales WHERE first_name = 'Nicole';

-- SUM multiple columns at once using GROUP BY
SELECT first_name, SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales)DESC;

-- Find the average AVG function of a column by adding the numbers and dividing the total number of values to find the average
SELECT first_name, AVG(sales) FROM cookie_sales GROUP BY first_name ORDER BY AVG(sales)DESC;

-- Find the maximum number in a column using MAX
SELECT first_name, MAX(sales) FROM cookie_sales GROUP BY first_name ORDER BY MAX(sales)DESC;

-- Find the minimum number in a column using MIN
SELECT first_name, MIN(sales) FROM cookie_sales GROUP BY first_name ORDER BY MIN(sales)DESC;

-- LIMIT lets you specify exactly how many rows to return and which row to start with
-- Show just the two top records in a table using the LIMIT keyword
SELECT first_name, SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales)DESC LIMIT 2;

-- Show records located in different positions in your table using LIMIT -- SQL starts at 0 in the first indexed position
SELECT first_name, SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales)DESC LIMIT 1,1;
-- This returns the second record only -- the first LIMIT number selects the position in the table and the second number returns the number of rows specified

-- Take repeated data from one column and put them in their own columns
UPDATE my_contacts SET
    interest1 = SUBSTRING_INDEX(interests, ',', 1),
    interests = SUBSTR(interests, LENGTH(interest1)+2),
    interest2 = SUBSTRING_INDEX(interests, ',', 1),
    interests = SUBSTR(interests, LENGTH(interest2)+2),
    interest3 = SUBSTRING_INDEX(interests, ',', 1),
    interests = SUBSTR(interests, LENGTH(interest3)+2),
    interest4 = interests;

-- Create the profession_info table with a primary key column and a VARCHAR column to hold the professions
-- Then fill up the profession column of the profession_info table with the values from your SELECT
CREATE TABLE profession_info
(
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profession VARCHAR(20)
);
INSERT INTO profession_info (profession)
    SELECT profession FROM my_contacts
    GROUP BY profession
    ORDER BY profession;

-- Create the profession table with one column full of values from the SELECT query
-- Then ALTER the table to add in the primary key field
CREATE TABLE profession_info AS 
    SELECT profession FROM my_contacts
    GROUP BY profession 
    ORDER BY profession;
ALTER TABLE profession_info 
    ADD COLUMN id INT NOT NULL AUTO_INCREMENT FIRST,
    ADD PRIMARY KEY (id);

-- Create the profession table with both a primary key and a profession column
-- Then fill the profession column with the values from the my_contacts table using the SELECT query
CREATE TABLE profession_info
(
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profession VARCHAR(20)
) AS
    SELECT profession FROM my_contacts
    GROUP BY profession
    ORDER BY profession;

-- Using an alias in place of column name using AS
CREATE TABLE profession
(
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mc_prof VARCHAR(20)
) AS
    SELECT profession AS mc_prof FROM my_contacts
    GROUP BY mc_prof
    ORDER BY mc_prof;

-- Using an alias for table names using AS
SELECT profession AS mc_prof
FROM my_contacts AS mc
GROUP BY mc_prof
ORDER BY mc_prof;

-- Cartesian Join using aliases
SELECT t.toy, b.boy
FROM toys AS t 
    CROSS JOIN 
    boys AS b;

    -- Create a interests table that has its own PRIMARY KEY and uses a contact_id FOREIGN KEY from the my_contacts table
CREATE TABLE interests(
    interests_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    interest VARCHAR(50) NOT NULL,
    contact_id INT NOT NULL,
    CONSTRAINT my_contacts_contact_id_fk
    FOREIGN KEY (contact_id)
    REFERENCES my_contacts (contact_id)
    );

-- Create a FOREIGN KEY between two tables using CONSTRAINT AND REFERENCES
CREATE TABLE toys (
    toy_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    toy VARCHAR(50) NOT NULL
)

CREATE TABLE boys (
    boy_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    boy VARCHAR(50) NOT NULL,
    toy_id INT NOT NULL,
    INDEX `idx_toy`(toy_id),
    CONSTRAINT toys_toy_id_fk
    FOREIGN KEY (toy_id)
    REFERENCES toys (toy_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Use INNER JOIN to select the boys who get which toys form the toys and boys tables
SELECT boys.boy, toys.toy
FROM boys 
    INNER JOIN
    toys
ON boys.toy_id = toys.toy_id;

-- Query that returns the email addresses and professions of each person in my_contacts table
SELECT mc.email, p.profession 
FROM my_contacts mc
    INNER JOIN profession p ON mc.prof_id = p.prof_id;

-- Query that returns the first name, last name, status of each person in my_contacts table
SELECT mc.first_name, mc.last_name, s.status
FROM my_contacts mc
    INNER JOIN status s ON mc.status_id = s.status_id;

-- Query that returns the first name, last name, and state of each person in my_contacts table
SELECT mc.first_name, mc.last_name, z.state
FROM my_contacts mc
    INNER JOIN zip_code z ON mc.zip_code = z.zip_code;

-- Non-quijoin with the inner join to find which toys the boys don't have
SELECT boys.boy, toys.toy
FROM boys
    INNER JOIN
    toys 
ON boys.toy_id <> toys.toy_id 
ORDER BY boys.boy;

-- Find what toy each boy has using NATURAL JOIN
SELECT boys.boy, toys.toy
FROM boys 
    NATURAL JOIN
    toys;

-- Query that returns the email addresses and professions of each person in my_contacts table
-- Can use NATURAL JOIN because the foreign key and the primary key names match up in each of the queries
SELECT mc.email, p.profession 
FROM my_contacts mc 
    NATURAL JOIN profession p;

-- Query that returns the first name, last name, and any status that each person in my_contacts is not
-- Have to use INNER JOIN & ON because there are multiple rows for each person which is not a NATURAL JOIN
SELECT mc.first_name, mc.last_name, s.status 
FROM my_contacts mc 
    INNER JOIN status s ON mc.status_id <> s.status_id;

-- Query that returns the first name, last name, and state of each person in my_contacts
-- Can use NATURAL JOIN because the foreign key and the primary key names match up in each of the queries
SELECT mc.first_name, mc.last_name, z.state 
FROM my_contacts mc
    NATURAL JOIN zip_code z;

-- Query boy and toy to show which boy gets which toy depending on the boy connected to the toy_id foreign key using NATURAL JOIN
SELECT b.boy, t.toy
FROM boys b
    NATURAL JOIN toys t;

-- Write two queries with a different join, to get the matching records from my_contacts and contact_interest
SELECT mc.first_name, mc.last_name, ci.interests_id
FROM my_contacts mc
    INNER JOIN contact_interest ci ON mc.contact_id = ci.contact_id;

SELECT mc.first_name, mc.last_name, cs.seeking_id
FROM my_contacts mc
    INNER JOIN 
    contact_seeking cs 
    ON mc.contact_id = cs.contact_id;

-- List the professions of people in the my_contacts table, but without any duplicates and in alphabetical order
SELECT p.profession 
FROM my_contacts mc
    INNER JOIN profession p ON mc.prof_id = p.prof_id 
    GROUP BY profession
    ORDER BY profession;

-- Write query to get the qualified candidates form the database
SELECT mc.last_name, mc.first_name, mc.phone
FROM my_contacts mc
    NATURAL JOIN
    job_desired jd 
WHERE jd.title = 'Web Developer'
AND jd.salary_low < 150000
AND jd.years_exp >= 5;

-- Write query to see if there are any matches for job titles among his contacts
SELECT mc.first_name, mc.last_name, mc.phone, jc.title
FROM job_current jc
    NATURAL JOIN
    my_contacts mc
WHERE 
jc.title IN ('President', 'Senior Aide');

-- Write a subquery to combine two queries into one
SELECT mc.first_name, mc.last_name, mc.phone, jc.title
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
WHERE jc.title IN (SELECT title FROM job_listings);

-- Write a subquery with alias column names
SELECT mc.first_name AS firstname, mc.last_name AS lastname, mc.phone AS phon, jc.title AS jobtitle
FROM job_current AS jc NATURAL JOIN my_contacts AS mc
WHERE jc.title IN (SELECT title FROM job_listings);

-- Find who makes the highest salary using subquery
SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc NATURAL JOIN job_current AS jc
WHERE jc.salary = (SELECT MAX(jc.salary) FROM job_current jc);

-- Use subquery in SELECT query
SELECT ads.ad_name, ads.start_date, 
    (SELECT headline FROM headlines
    WHERE ads.headline_id = headlines.id) AS headline
    FROM ads;

-- Add date
SELECT DATE_ADD(wt.start, INTERVAL wt.day DAY) 
    FROM web_timeline AS wt;

-- Find average salary of job title
SELECT AVG(salary) FROM job_current WHERE title = 'Web Developer';

-- Find which contacts have job titles in job_listings
SELECT mc.first_name, mc.last_name, mc.phone, jc.title 
    FROM job_current AS jc
    NATURAL JOIN
    my_contacts AS mc 
    WHERE jc.title IN (SELECT title FROM job_listings);

-- Find which contacts have job titles in job_listings
SELECT mc.first_name, mc.last_name, mc.phone, jc.title 
    FROM job_current AS jc
    NATURAL JOIN
    my_contacts AS mc 
    WHERE jc.title NOT IN (SELECT title FROM job_listings);

-- Use a subquery in a SELECT query
SELECT mc.first_name, mc.last_name, jc.salary, (SELECT AVG(salary) FROM job_current WHERE title = 'Web Developer') avg_salary
    FROM my_contacts mc 
    NATURAL JOIN
    job_current jc 
    WHERE jc.title = 'Web Developer'

-- List titles for jobs that earn salaries equal to the highest salary in the job_listings table
SELECT jc.title, jc.salary 
FROM job_current AS jc 
WHERE jc.salary IN (SELECT MAX(salary) FROM job_listings);

-- List the first and last name of people with a salary greater than the average salary
SELECT mc.first_name, mc.last_name
    FROM my_contacts mc
    NATURAL JOIN job_current jc
    WHERE jc.salary > (SELECT AVG(salary) FROM job_current);

-- Find all web designers who have the same zip code as any job_listings for web designers
SELECT mc.first_name, mc.last_name, mc.phone
    FROM my_contacts mc
    NATURAL JOIN job_current jc 
    WHERE jc.title = 'Web Designer' AND mc.zip_code
    IN (SELECT zip FROM job_listings WHERE title = 'Web Designer');

-- List everyone who lives in the same zip code as the person with the highest current salary
SELECT last_name, first_name FROM my_contacts
    WHERE zip_code IN (SELECT mc.zip_code FROM my_contacts mc
    NATURAL JOIN job_current jc
    WHERE jc.salary = (SELECT MAX(salary) FROM job_current));

-- Find people who are not in not in the job_current table using NOT EXISTS
SELECT mc.first_name firstname, mc.last_name lastname, mc.email email
    FROM my_contacts mc
    WHERE NOT EXISTS
    (SELECT * FROM job_current jc
    WHERE mc.contact_id = jc.contact_id);

-- Find people who do EXIST in the job_current table
SELECT mc.first_name firstname, mc.last_name lastname, mc.email email 
FROM my_contacts mc
WHERE EXISTS(SELECT * FROM contact_interest ci WHERE mc.contact_id = ci.contact_id);

-- Query that returns the email of people who have at least one interest but don't exist in the job_current table
SELECT mc.email email FROM my_contacts mc 
WHERE 
EXISTS(SELECT * FROM contact_interest ci WHERE mc.contact_id = ci.contact_id) 
AND 
NOT EXISTS (SELECT * FROM job_current jc WHERE mc.contact_id = jc.contact_id);

-- Create a self-referencing Foreign Key
-- Create the table first and add the foreign key but don't add the constraint, FOREIGN KEY() or reference yet
CREATE TABLE clown_info 
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    boss_id INT NOT NULL
    );
-- After the table is created, ALTER TABLE to add the Self-Referencing FORIEGN KEY
-- Add the constraint, FOREIGN KEY & reference
ALTER TABLE clown_info ADD
    CONSTRAINT clown_info_boss_id_fk
    FOREIGN KEY (boss_id)
    REFERENCES clown_info (id);
-- Use a self-join to use the self-referencing foreign key when all data when primary key is referencing the foreign key
SELECT c1.name, c2.name AS boss 
    FROM clown_info c1
    INNER JOIN clown_info c2
    ON c1.boss_id = c2.id;

-- Use UNION to find combined results and no duplicates
SELECT title FROM job_current
    UNION
    SELECT title FROM job_desired
    UNION
    SELECT title FROM job_listings
    ORDER BY title;

-- Using UNION ALL to return all values including duplicates
SELECT title FROM job_current 
    UNION ALL 
    SELECT title FROM job_desired 
    UNION ALL 
    SELECT title FROM job_listings 
    ORDER BY title;

-- Create a table using CREATE TABLE AS using a SELECT query and UNION
CREATE TABLE my_union AS 
    SELECT title FROM job_current UNION 
    SELECT title FROM job_desired UNION 
    SELECT title FROM job_listings;

-- Using CHECK constraint
CREATE TABLE piggy_bank
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    coin CHAR(1) CHECK (coin IN ('P', 'N', 'D', 'Q'))
);

-- Using CHECK constraint to allow only Male or Female inputs
ALTER TABLE my_contacts
    ADD CONSTRAINT CHECK gender IN ('M', 'F');

-- Create a table that only allows certain values
CREATE TABLE mystery_table
(
    column1 INT(4) CHECK (column1 > 200), -- allows any number greater than 200
    column2 CHAR(1) CHECK (column2 NOT IN ('x', 'y', 'z')), -- does not allow x y z
    column3 VARCHAR(3) CHECK ('A' = SUBSTRING(column3, 1, 1)), -- allows only if the string starts with A
    column4 VARCHAR(3) CHECK ('A'= SUBSTRING(column4, 1, 1)
    AND '9' = SUBSTRING(column4, 2, 1)) -- allows only if the string starts with A9
);

-- Write query to find all the web designers from job_desired
SELECT mc.first_name, mc.last_name, mc.phone 
    FROM my_contacts mc 
    INNER JOIN job_desired jd 
    ON mc.contact_id = jd.contact_id 
    WHERE jd.title = "Web Designer";

-- Create a VIEW to save queries you use often
CREATE VIEW web_designers AS
    SELECT mc.first_name, mc.last_name, mc.phone, mc.email
    FROM my_contacts mc
    INNER JOIN
    job_desired jd
    ON mc.contact_id = jd.contact_id
    WHERE jd.title = 'Web Designer';
-- Use your web_designers VIEW
SELECT * FROM web_designers;

-- Delete a view
DROP VIEW web_designers;

-- ACID compliancy for TRANSACTIONS
-- A : Atomicity - all of th epeices of the transaction must be completed, or non of the will be completed.
-- C : Consistency - A complete transaction leaves the database in a consistent state at the end of the transaction
-- I : Isolation - Isolation means that every transaction has a consistent view of the database regardless of other transactions taking place at the Time
-- D : Durability - After the transaction, the database needs to save the data correctly and protect it from power outages or other threats.

-- How to check what Storage Engine you are using - Storage Engine will be shown at the bottom of the results
SHOW CREATE TABLE table_name;
-- Transaction Storage Engine = InnoDB

-- Change your Storage Engine
ALTER TABLE your_table TYPE = InnoDB;

-- Transaction using ROLLBACK to rollback to the original state
START TRANSACTION;
SELECT * FROM savings;
UPDATE savings SET balance = 0;
SELECT * FROM savings;
ROLLBACK;
SELECT * FROM savings;

-- Transaction using COMMIT to commit to your transaction and change the state
START TRANSACTION;
SELECT * FROM savings;
UPDATE savings SET balance = 100000;
SELECT * FROM savings;
COMMIT;
SELECT * FROM savings;

-- Create a new user/password to add to your database
CREATE USER elsie 
IDENTIFIED BY 'password';

-- Grant users access to tables with SELECT permissions
GRANT SELECT ON 
clown_info 
TO elsie;

-- Grant users access to tables with INSERT permissions
GRANT INSERT ON magic_animals TO doc;

-- Grant users access to tables with DELETE permissions
GRANT DELETE ON chores TO happy, sleepy;

-- Grant users access to tables with SELECT permissions to a particular column in a table
GRANT SELECT (chore_name) ON chores TO dopey;

-- Grant users access to tables with SELECT & INSERT permissions
GRANT SELECT, INSERT ON talking_animals TO sneezy;

-- Grant users access to tables with ALL permissions
GRANT ALL ON talking_animals TO bashful;

-- Grant users access to tables with DELETE permissions and to give permission to any other user
GRANT DELETE ON chores to happy, sleepy WITH GRANT OPTION;

-- Allow SELECT privilege to a user for every table inside a database using .*
GRANT SELECT ON woodland_college.* TO doc;

-- Grant privileges for all the tables in a database
GRANT SELECT, INSERT, DELETE 
ON gregs_list.* TO jim;

-- REVOKE privileges to users
REVOKE SELECT ON clown_info FROM elsie;

-- REVOKE the GRANT OPTION permission
REVOKE GRANT OPTION ON DELETE ON chores FROM happy, sleepy;

-- Check to see the user you want to revoke priveleges from has granted privileges to any other user using RESTRICT
-- If they have while using RESTRICT you will get an error
REVOKE DELETE ON chores FROM sleepy RESTRICT;

-- REVOKE a permission and GRANT OPTION using CASCADE
REVOKE DELETE on info_location FROM elsie CASCADE;

-- Create roles to give group users priveleges so you can edit them if necessary without having to edit specific accounts
CREATE ROLE data_entry;
GRANT SELECT, INSERT ON some_table TO data_entry;
GRANT data_entry TO doc;

-- Create an administrator role to grant a group all access to every table and use SELECT, INSERT, DELETE then assign it to an account user
CREATE ROLE administrator;
GRANT SELECT, INSERT, DELETE ON gregs_list.* TO administrator;
GRANT administrator TO james;

-- Revoke a role from an account user
REVOKE data_entry FROM james;

-- Allow users to have admin powers to assign people the same role they are
GRANT data_entry TO doc WITH ADMIN OPTION;

-- Using RESTRICT when you want to remove a privilege from a user will return an error if that user has granted privileges to anyone else
REVOKE data_entry FROM doc RESTRICT;