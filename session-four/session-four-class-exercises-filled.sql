-- restbase
/* QUESTION 1
Select all the restaurants in generalinfo that have food_type = bagels.
*/

SELECT *
FROM restbase.generalinfo
WHERE food_type = 'bagels';


/* QUESTION 2
Using a subquery and an anti-join with geographic, find the cities without a bagel restaurant.
*/
SELECT geo.city
FROM (SELECT *
	  FROM restbase.generalinfo
	  WHERE food_type = 'bagels') as bagel_rest
RIGHT JOIN restbase.geographic geo ON bagel_rest.city = geo.city
WHERE bagel_rest.food_type IS NULL;

/* QUESTION 3
Return each restaurant and a column called address which comes in the format 'streetname, city'
*/

SELECT CONCAT(street_name, ', ', city) AS `streetname, city`
FROM restbase.location

SELECT CONCAT_WS(', ', street_name, city) AS `streetname, city`
FROM restbase.location

/* QUESTION 4
Select all the cities in location where the city is null. 
Return all the cities but replace the cities that are null with 'Atlantis'
*/

SELECT COALESCE(city, 'Atlantis'), id_restaurant 
FROM restbase.location
ORDER BY id_restaurant;

/* QUESTION 5
Using CASE in your select statement, create a new column called 'my_review'.
Change the review of your most liked food to 5 and your least liked food to 1. The remaining should stay the same.
*/

SELECT label, 
	CASE
		WHEN food_type = 'bagels' THEN 5
		WHEN food_type = 'cafe' THEN 1
		ELSE review
	END AS my_review
FROM restbase.generalinfo
WHERE food_type = 'bagels'

SELECT label, 
	CASE
		WHEN food_type = 'bagels' THEN 5
		WHEN food_type = 'cafe' THEN 1
		ELSE review
	END AS my_review
FROM restbase.generalinfo
WHERE food_type = 'cafe'

/* QUESTION 5
Using CASE in your where statement, get the labels of restaurants that have a review > 4. If the restaurant serves bagels,
select them if they have a review > 2.5.
Is there another way to execute the same query?
*/

SELECT label
FROM restbase.generalinfo
WHERE 
	CASE 
		WHEN food_type = 'bagels' THEN review > 2.5
		ELSE review > 4
	END	

/* QUESTION 6
Do an inner join with  geographic and world.City to get the country code of each city in geographic.
Return a list of cities and their country code. Order by country code (if its not null), otherwise order by city.
(Example ordering (Antioch, NULL), (san rafael, ARG), (brisbane, AUS))
*/
SELECT city, CountryCode
FROM restbase.geographic geo
LEFT JOIN world.City c on geo.city = c.Name
ORDER BY 
	CASE 
		WHEN CountryCode IS NULL THEN city
		ELSE CountryCode
	END