-- Create my_contacts table
CREATE TABLE my_contacts
    (
        last_name VARCHAR(30),
        first_name VARCHAR(20),
        email VARCHAR(50),
        gender CHAR(1),
        birthday DATE,
        profession VARCHAR(50),
        location VARCHAR(50),
        status VARCHAR(20),
        interests VARCHAR(100),
        seeking VARCHAR(100)
    );

-- Value record
INSERT INTO my_contacts
    (
        last_name, first_name, email, gender, birthday, profession, location, status, interests, seeking
    )
    VALUES
    (
        'Anderson', 'Jillian', 'jill_anderson@breakneckpizza.net', 'F', '1980-09-05', 'Technical Writer', 'Palo Alto, CA', 'Single', 'Kayaking, Reptiles', 'Relationship, Friends'
    );

-- test one with no location value
INSERT INTO my_contacts
    (
        last_name, first_name, email, gender, birthday, profession, location, status, interests, seeking
    )
    VALUES
    (
        'Anderson', 'Jillian', 'jill_anderson@breakneckpizza.net', 'F', '1980-09-05', 'Technical Writer', 'Single', 'Kayaking, Reptiles', 'Relationship, Friends'
    );

-- test two missing email column
INSERT INTO my_contacts
    (
        last_name, first_name, gender, birthday, profession, location, status, interests, seeking
    )
    VALUES
    (
        'Anderson', 'Jillian', 'jill_anderson@breakneckpizza.net', 'F', '1980-09-05', 'Technical Writer', 'Palo Alto, CA', 'Single', 'Kayaking, Reptiles', 'Relationship, Friends'
    );

-- test three missing comma between 'Technical Writer' 'Palo Alto, CA'
INSERT INTO my_contacts
    (
        last_name, first_name, email, gender, birthday, profession, location, status, interests, seeking
    )
    VALUES
    (
        'Anderson', 'Jillian', 'jill_anderson@breakneckpizza.net', 'F', '1980-09-05', 'Technical Writer' 'Palo Alto, CA', 'Single', 'Kayaking, Reptiles', 'Relationship, Friends'
    );

    -- test four missing single quote at 'Relationship, Friends
INSERT INTO my_contacts
    (
        last_name, first_name, email, gender, birthday, profession, location, status, interests, seeking
    )
    VALUES
    (
        'Anderson', 'Jillian', 'jill_anderson@breakneckpizza.net', 'F', '1980-09-05', 'Technical Writer', 'Palo Alto, CA', 'Single', 'Kayaking, Reptiles', 'Relationship, Friends'
    );


CREATE TABLE my_contacts_copy (
    contact_id INT NOT NULL,
    last_name varchar(30) DEFAULT NULL,
    first_name varchar(20) DEFAULT NULL,
    email varchar(50) DEFAULT NULL,
    gender char(1) DEFAULT NULL,
    birthday date DEFAULT NULL,
    profession varchar(50) DEFAULT NULL,
    location varchar(50) DEFAULT NULL,
    status varchar(20) DEFAULT NULL,
    interests varchar(100) DEFAULT NULL,
    seeking varchar(100) DEFAULT NULL,
    PRIMARY KEY (contact_id)
);

INSERT INTO my_contacts
    (
        interest1, interest2, interest3, interest4
    )
    VALUES
    (
        'golfing', 'bbqing', 'fishing', 'reading'
    );

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

-- Split up the tables to create better relationships and to make it easier to query and maintain in the future
CREATE TABLE profession
(
    prof_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profession VARCHAR(50)
);

CREATE TABLE zip_code
(
    zip_code INT NOT NULL PRIMARY KEY,
    city VARCHAR(100),
    state VARCHAR(50)
);

CREATE TABLE status
(
    status_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status CHAR(30)
);

CREATE TABLE interests
(
    interest_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    interest VARCHAR(50)
);

CREATE TABLE seeking
(
    seeking_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    seeking VARCHAR(100)
);

-- Create my_contacts with 3 foreign keys: prof_id, zip_code, status_id
-- Create a FOREIGN KEY between two tables using CONSTRAINT AND REFERENCES
CREATE TABLE my_contacts (
    contact_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name CHAR(50),
    first_name CHAR(50),
    phone VARCHAR(12),
    email VARCHAR(100),
    gender CHAR(10),
    birthday DATE, 
    prof_id INT NOT NULL,
    INDEX `idx_profession`(prof_id),
    CONSTRAINT profession_prof_id_fk
    FOREIGN KEY (prof_id)
    REFERENCES profession (prof_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    zip_code INT NOT NULL,
    INDEX `idx_zip_code`(zip_code),
    CONSTRAINT zip_code_zip_code_fk
    FOREIGN KEY (zip_code)
    REFERENCES zip_code (zip_code) ON UPDATE CASCADE ON DELETE RESTRICT,
    status_id INT NOT NULL,
    INDEX `idx_status`(status_id),
    CONSTRAINT status_status_id_fk
    FOREIGN KEY (status_id)
    REFERENCES status (status_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create the contact_interest table that has two primary keys from my_contacts and interests tables and are the composite keys
CREATE TABLE contact_interest (
    contact_id INT NOT NULL,
    INDEX `idx_my_contacts`(contact_id),
    CONSTRAINT my_contacts_contact_id_fk
    FOREIGN KEY (contact_id)
    REFERENCES my_contacts (contact_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    interest_id INT NOT NULL,
    INDEX `idx_interests`(interest_id),
    CONSTRAINT interests_interest_id_fk
    FOREIGN KEY (interest_id)
    REFERENCES interests (interest_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (contact_id, interest_id)
);

-- Create the contact_seeking table that has two primary keys from my_contacts and seeking tables and are the composit keys
CREATE TABLE contact_seeking (
    contact_id INT NOT NULL,
    INDEX `idx_my_contacts`(contact_id),
    CONSTRAINT my_contacts_seeking_contact_id_fk
    FOREIGN KEY (contact_id)
    REFERENCES my_contacts (contact_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    seeking_id INT NOT NULL,
    INDEX `idx_seeking`(seeking_id),
    CONSTRAINT seeking_seeking_id_fk
    FOREIGN KEY (seeking_id)
    REFERENCES seeking (seeking_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (contact_id, seeking_id)
);

-- Insert data into tables
INSERT INTO profession 
(profession)
VALUES
('Web Developer'), ('Web Designer'), ('Marketing Director'), ('Project Manager');

INSERT INTO zip_code
(zip_code, city, state)
VALUES
(95833, 'Sacramento', 'California'), 
(97035, 'Portland', 'Oregon'),
(12101, 'Boston', 'Massachusetts'),
(90712, 'Long Beach', 'California');

INSERT INTO status
(status)
VALUES
('Single'), ('Married'), ('Divorced'), ('Engaged');

INSERT INTO interests
(interest)
VALUES
('Golfing'), ('Surfing'), ('Working Out'), ('Programming');

INSERT INTO seeking
(seeking)
VALUES 
('Relationship'), ('Marriage'), ('Friendship'), ('No Attachment');

INSERT INTO my_contacts
(last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES
('Grout', 'Brennan', '7144693057', 'brennan@uptownstudios.net', 'Male', '1985-08-13', 3, 95833, 2),
('Michele', 'Kate', '7144691295', 'kate@gmail.com', 'Female', '2012-07-21', 1, 97035, 1),
('Washington', 'George', '9514521385', 'george@cherrytree.org', 'Male', '1995-01-10', 4, 12101, 4),
('Herrera', 'Amanda', '5621234565', 'amanda@gmail.com', 'Female', '1981-12-10', 2, 90712, 1),
('Donahue', 'James', '5624457894', 'jdonahue@gmail.com', 'Male', '1980-5-12', 4, 90712, 1),
('Blackfish', 'George', '5628945672', 'bgeorge@gmail.com', 'Male', '1975-3-14', 2, 90712, 1);

INSERT INTO contact_interest
(contact_id, interest_id)
VALUES 
(1, 4), (2, 4), (3, 2), (4, 3), (5, 3), (6, 1);

INSERT INTO contact_seeking
(contact_id, seeking_id)
VALUES
(1, 3), (2, 3), (3, 1), (4, 2), (5, 2), (6, 2);


CREATE TABLE job_listings (
    job_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    salary VARCHAR(100),
    zip INT NOT NULL,
    description VARCHAR(225)
);

CREATE TABLE job_desired (
    contact_id INT NOT NULL,
    INDEX `idx_job_desired_contact_id`(contact_id),
    CONSTRAINT my_contacts_job_desired_contact_id_fk
    FOREIGN KEY (contact_id)
    REFERENCES my_contacts (contact_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    title VARCHAR(100),
    salary_low VARCHAR(50),
    salary_high VARCHAR(50),
    available VARCHAR(100),
    years_exp VARCHAR(50)
);

CREATE TABLE job_current (
    contact_id INT NOT NULL,
    INDEX `idx_job_current_contact_id`(contact_id),
    CONSTRAINT my_contacts_job_current_contact_id_fk
    FOREIGN KEY (contact_id)
    REFERENCES my_contacts (contact_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    title VARCHAR(100),
    salary VARCHAR(50),
    start_date DATE
);

INSERT INTO job_listings 
(title, salary, zip, description)
VALUES
('Web Developer', '$95,000-$105,000', 95833, 'Looking for Web Developer with first rate HTML & CSS chops to work with our interaction and visual design teams. This is a tremendous opportunity for someone who is meticulous about web standards.'),
('Web Designer', '$60,000-$75,000', 95833, 'Looking for Web Designer who likes to design websites and can create awesome logos for a broad range of clients'),
('Digital Marketer', '$60,000-$70,000', 95833, 'Looking for Digital Marketer who has Google Ads experience and Social Media Facebook Ads and Instagram Ads experience');

INSERT INTO job_desired
(contact_id, title, salary_low, salary_high, available, years_exp)
VALUES
(1, 'Web Developer', '$90,000', '$100,000', 'Yes', '2 years'),
(5, 'Web Designer', '$60,000', '$70,000', 'Yes', '4 years');

INSERT INTO job_current
(contact_id, title, salary, start_date)
VALUES
(3, 'President', '$150,000', '2012-12-22'),
(4, 'Senior Aide', '$70,000', '2010-08-12'),
(6, 'Commercial Fisherman', '$180,000', '2007-3-18');

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
WHERE jc.title IN ('President', 'Senior Aide');