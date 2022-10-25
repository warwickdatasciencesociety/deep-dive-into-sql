/*CLASS EXCERCISES*/
/* PART 1: JOINS */

--world

/* QUESTION 1
Perform an LEFT JOIN between City and CountryLanguage tables on Country Code. 
Select the City name, Language and Percentage where Name is your home country. Interpret the table.
*/

SELECT Name, `language`, percentage
FROM world.City 
LEFT JOIN world.CountryLanguage 
ON City.CountryCode = CountryLanguage.CountryCode
WHERE Name = 'Singapore';


/* QUESTION 2
Perform a LEFT JOIN between City and Country on Country code. Count the number of rows.
Now, perform a RIGHT JOIN instead. Count the number of rows.
Now, perform an INNER JOIN instead.
Are the counts the same? What do they mean? 
If the counts are different, can you select the rows that are in one but not another?
*/

SELECT COUNT(*)
FROM world.City
RIGHT JOIN world.Country ON City.CountryCode = Country.Code;

/* QUESTION 3
Perform a NATURAL JOIN on City and CountryLanguage. 
What is another way (using some other type of JOIN) to generate the same table?
*/

SELECT *
FROM world.City 
NATURAL JOIN world.CountryLanguage 

/*CLASS EXCERCISES*/
/* PART 2: Subqueries */

/* QUESTION 4
Select all the cities in City that contain the word 'San'.
Find the total population that live in a city with the word 'San' in the name. Rename this population as san_pop.
*/

SELECT CountryCode, Sum(Population) as san_pop
FROM world.City
WHERE Name LIKE '% San %' OR Name LIKE '%San %'
GROUP BY CountryCode;

/* QUESTION 5
Using a subquery and performing the appropriate JOIN, find a country and it's appropriate san_pop. 
(If a country does not contain a 'san' city, exclude it from the resulting table)


*/
SELECT Name, san_pop, population
FROM world.Country c
INNER JOIN (
	SELECT CountryCode, Sum(Population) as san_pop
	FROM world.City
	WHERE Name LIKE '% San %' OR Name LIKE '%San %'
	GROUP BY CountryCode
) AS san ON c.Code = san.CountryCode

/* QUESTION 6
Among the countries that have a city with the word 'San' in it, find the proportion of a country that lives in a city with 
the word 'San' in it. Name it 'San_Percent' and list them in descending order of san_percent
*/

SELECT Name, san_pop/population as san_percent
FROM world.Country c
INNER JOIN (
	SELECT CountryCode, Sum(Population) as san_pop
	FROM world.City
	WHERE Name LIKE '% San %' OR Name LIKE '%San %'
	GROUP BY CountryCode
) AS san ON c.Code = san.CountryCode
ORDER BY san_percent DESC;


/*CLASS EXCERCISES*/
/* PART 3: Challenge */

/* QUESTION 7
By performing an appropriate join with the country table, get a table containing 4 columns:
1. The population of a country
2. The Languages spoken in the country
3. The percentage for of each language spoken
*/

SELECT population, `language`, percentage, continent
FROM world.CountryLanguage as l
INNER JOIN world.Country as c ON l.CountryCode = c.Code;


/* QUESTION 8
Using your answer from question 7, find the most commonly spoken languages in the world and the number of speakers for each.
*/

SELECT `language`, ROUND(SUM(population*percentage/100)) as num_speakers
FROM world.CountryLanguage as l
INNER JOIN world.Country as c ON l.CountryCode = c.Code
GROUP BY `language`
ORDER BY num_speakers DESC;
