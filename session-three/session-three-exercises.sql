-- salesdb table
/* QUESTION 1
Perform an INNER JOIN between the tables Employees and Sales on Salesperson ID. 
*/
SELECT *
FROM salesdb.Employees 
INNER JOIN salesdb.Sales ON SalesPersonID;

/* QUESTION 2
Return the first and last names of Customers in order of number of transactions in the table Sales.

*/
SELECT  FirstName, LastName 
FROM salesdb.Customers
INNER JOIN salesdb.Sales ON salesdb.Customers.CustomerID 

/* QUESTION 3
The manager needs 2 employees manning the store at all times. Generate all possible pairs of employees. 
Count the number of rows to find the number of possible pairs.
*/

SELECT COUNT(*)
FROM salesdb.Employees e1, salesdb.Employees e2
WHERE NOT e1.EmployeeID = e2.EmployeeID;  

/* QUESTION 4
Recall that Full Outer Join is no longer supported by MySQL
How could you perform an equivalent operation? 
Read up on UNION and UNION ALL.
Perform a full outer join on the tables Employees and Customers. We want the data to display in a single row if a customer and an employee have the same ID
Do allow duplicate rows.
*/

SELECT *
FROM salesdb.Customers c
LEFT JOIN salesdb.Employees e ON c.CustomerID = e.EmployeeID
UNION ALL 
SELECT *
FROM salesdb.Customers c
RIGHT JOIN salesdb.Employees e ON c.CustomerID = e.EmployeeID

-- walmart table
/* QUESTION 5
Select the first 10 rows from the key table, ordered by station_nbr descending.
Can you see how this query could be interpreted in 2 different ways? 
Carry out both possible interpretations
*/
SELECT *
FROM walmart.key
ORDER BY station_nbr DESC
LIMIT 10;

SELECT *
FROM (
	SELECT *
	FROM walmart.key
	LIMIT 10
	) as Table1
ORDER BY station_nbr DESC;

/* QUESTION 6
What are the station numbers that experienced the highest recorded snowfall?
Using your answer, indicate which store corresponds to the highest snowfall recorded, grouped by store. 
Use a NATURAL JOIN
*/
SELECT station_nbr
FROM walmart.weather
NATURAL JOIN walmart.key
GROUP BY station_nbr 
ORDER BY max(snowfall);

/* QUESTION 7
What was the maximum temperature on 2012-02-05 at all the stores that sold 
more than 120 000 of units in total across all days?
*/
SELECT tmax
FROM walmart.weather
NATURAL JOIN (
	SELECT station_nbr, sum(units) as total_sales
	FROM walmart.train
	INNER JOIN walmart.key 
	ON key.store_nbr = train.store_nbr
	GROUP BY key.store_nbr ) AS table1
WHERE total_sales > 120000 AND date = '2012-02-05';

-- restbase table
/* QUESTION 10
Select a table of every restaurant ID, their city, and their region, if the region's details are available in the geographic table.
*/

SELECT id_restaurant, location.city, region
FROM restbase.location
LEFT JOIN restbase.geographic 
ON location.city = geographic.city
WHERE region IS NOT NULL;
