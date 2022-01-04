CREATE DATABASE timelines;

CREATE TABLE web_timeline 
    (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        action VARCHAR(250),
        start DATE,
        day INT
    );

CREATE TABLE 

-- Add date
SELECT DATE_ADD(wt.start, INTERVAL wt.day DAY) 
    FROM web_timeline AS wt;

