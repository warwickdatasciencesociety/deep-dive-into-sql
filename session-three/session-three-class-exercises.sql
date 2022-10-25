/*CLASS EXCERCISES*/
/* PART 1: JOINS */

--world

/* QUESTION 1
Perform an LEFT JOIN between City and CountryLanguage tables on Country Code. 
Select the City name, Language and Percentage where Name is your home country. Interpret the table.
*/


/* QUESTION 2
Perform a LEFT JOIN between City and Country on Country code. Count the number of rows.
Now, perform a RIGHT JOIN instead. Count the number of rows.
Now, perform an INNER JOIN instead.
Are the counts the same? What do they mean? 
If the counts are different, can you select the rows that are in one but not another?
*/


/* QUESTION 3
Perform a NATURAL JOIN on City and CountryLanguage. 
What is another way (using some other type of JOIN) to generate the same table?
*/



/*CLASS EXCERCISES*/
/* PART 2: Subqueries */

/* QUESTION 4
Select all the cities in City that contain the word 'San'.
Find the total population that live in a city with the word 'San' in the name. Rename this population as san_pop.
*/


/* QUESTION 5
Using a subquery and performing the appropriate JOIN, find a country and it's appropriate san_pop. 
(If a country does not contain a 'san' city, exclude it from the resulting table)
*/


/* QUESTION 6
Among the countries that have a city with the word 'San' in it, find the proportion of a country that lives in a city with 
the word 'San' in it. Name it 'san_percent' and list them in descending order of san_percent
*/


/*CLASS EXCERCISES*/
/* PART 3: Challenge */

/* QUESTION 7
By performing an appropriate join with the country table, get a table containing 4 columns:
1. The population of a country
2. The Languages spoken in the country
3. The percentage for of each language spoken
*/

/* QUESTION 8
Using your answer from question 7, find the most commonly spoken languages in the world and the number of speakers for each.
*/

