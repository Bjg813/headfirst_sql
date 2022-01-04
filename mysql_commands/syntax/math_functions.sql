-- Add everything up in a column using the SUM function
SELECT SUM(sales) FROM cookie_sales WHERE first_name = 'Nicole';

-- SUM multiple columns at once using GROUP BY
SELECT first_name, SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales)DESC;

-- Find the average AVG of a column by adding the numbers and dividing the total number of values to find the average
SELECT first_name, AVG(sales) FROM cookie_sales GROUP BY first_name ORDER BY AVG(sales)DESC;

-- Find the maximum number in a column using MAX
SELECT first_name, MAX(sales) FROM cookie_sales GROUP BY first_name ORDER BY MAX(sales)DESC;

-- Find the minimum number in a column using MIN
SELECT first_name, MIN(sales) FROM cookie_sales GROUP BY first_name ORDER BY MIN(sales)DESC;

-- Find the number of rows in a column using the COUNT keyword
SELECT COUNT(sale_date) FROM cookie_sales;

-- Find specific number of rows in a column using WHERE and COUNT keywords
SELECT COUNT(sale_date) FROM cookie_sales WHERE sales > 0;

-- Find specific number of rows in a column using 'WHERE' 'COUNT' 'GROUP BY' keywords
SELECT first_name, COUNT(sale_date) FROM cookie_sales WHERE sales > 0 GROUP BY first_name;
