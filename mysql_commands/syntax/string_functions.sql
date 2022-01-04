-- FUNCTION METHODS
-- How to maniuplate strings - using SUBSTRING(your_string, start_position, length);
SELECT SUBSTRING('San Antonio, TX', 5, 3);
-- Answer: Ant

-- Make strings uppercase - using UPPER() method
SELECT UPPER('uSa');
-- Answer: USA

-- Make strings lowercase - using LOWER() method
SELECT LOWER('spaGHEtti');
-- Answer: spaghetti

-- Reverse a string - using REVERSE() method
SELECT REVERSE('spaGHEtti');
-- Answer: ittEHGaps

-- Trim extra spaces from left of a string - using LTRIM() method
SELECT LTRIM(' dogfood ');
-- Answer:dogfood

-- Trim extra spaces from right of a string - using RTRIM() method
SELECT RTRIM(' catfood ');
-- ANSWER: catfood

-- Find length of a string - using LENGTH() method
SELECT LENGTH('San Antonio, TX ');
-- Answer: 16