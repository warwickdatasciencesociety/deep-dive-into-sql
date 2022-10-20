/*CLASS EXCERCISES*/
/* PART 1: Advanced Queries */


-- walmart
/*
1.1 In the weather database, select rows for station_nbr 3, where the date is in the month of Feb 2012. 
*/
SELECT *
FROM walmart.weather
WHERE station_nbr = 3 AND MONTH(date) = 2 AND YEAR(date) = 2012;

SELECT *
FROM walmart.weather
WHERE station_nbr = 3 AND date BETWEEN '2012-02-01' AND '2012-02-29';


/*
1.2 Select all rows in weather which contain 'BR' in their codesum
*/

SELECT *
FROM walmart.weather
WHERE codesum LIKE '%BR%';

/*
1.3 Select all rows in weather that have both a recorded sunrise time and a sunset time.
*/

SELECT *
FROM walmart.weather
WHERE sunrise IS NOT NULL AND sunset IS NOT NULL;

SELECT *
FROM walmart.weather
WHERE NOT sunrise IS NULL AND NOT sunset IS NULL;

SELECT *
FROM walmart.weather
WHERE NOT sunrise IS NULL OR sunset IS NULL;

SELECT *
FROM walmart.weather
WHERE NOT (sunrise IS NULL OR sunset IS NULL);


/* PART 2: Aggregate Functions*/


/*
2.1 Find the date(s) with maximum minimum temperature for station_nbr 2.
    HINT: Using only what we have covered, You will probbaly need to do more than 1 query. 
          In class 3, we will see how to do it with just 1.
*/

SELECT MAX(tmin)
FROM walmart.weather
WHERE station_nbr = 2;

SELECT `date`
FROM walmart.weather
WHERE station_nbr = 2 AND tmin = 74;

/*
2.2 Select the first and last recording, in terms of date.
    How many days is the time gap between the first recording in the table and the last recording in the table?
    HINT: Read up on the DATEDIFF function
*/

SELECT DATEDIFF(MAX(date),MIN(date))
FROM walmart.weather;

/*
2.3 What is the total precipitation for the month of January in 2013 at station 4
*/
SELECT SUM(preciptotal)
FROM walmart.weather
WHERE date BETWEEN '2013-01-01' AND '2013-01-31' AND station_nbr = 4;


/*
2.4 For how many days in January 2012 did station 1 experience distinct values for dewpoint?
*/

SELECT DISTINCT dewpoint
FROM walmart.weather
WHERE date BETWEEN '2012-01-01' AND '2012-01-31' AND station_nbr = 1; 

/* PART 3: Group by */

/*
3.1 What is the total precipitation for the month of January in 2013 for all stations?
*/

SELECT station_nbr , SUM(preciptotal)
FROM walmart.weather
WHERE date BETWEEN '2013-01-01' AND '2013-01-31'
GROUP BY station_nbr;

/* 
3.2 For station 2, in the year of 2012, what was the highest total precipitation over a single month?
    HINT: Use the function MONTH. Example: MONTH('2012-02-01') = 2
*/

SELECT MONTH(date), SUM(preciptotal) as totalrain
FROM walmart.weather
GROUP BY MONTH(date)
ORDER BY totalrain DESC
LIMIT 1;

