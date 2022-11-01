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


SELECT DISTINCT(geo.city)
FROM (SELECT *
	  FROM restbase.generalinfo
	  WHERE food_type = 'bagels') AS rest
RIGHT JOIN restbase.geographic geo ON rest.city = geo.city
WHERE id_restaurant IS NULL; 

/* QUESTION 3
Return each restaurant name and a column called address which comes in the format 'streetname, city'
*/
SELECT label, CONCAT(street_name, ", ", city)
FROM restbase.generalinfo g
NATURAL JOIN restbase.location l;

/* QUESTION 4
Select all the restaurants in location where the city is null. 
Return all the cities but replace the cities that are null with 'Atlantis'
*/
SELECT id_restaurant, COALESCE(city, "Atlantis")
FROM restbase.location
ORDER BY id_restaurant;


/* QUESTION 5
Using CASE in your select statement, create a new column called 'my_review'.
Change the review of your most liked food to 5 and your least liked food to 1. The remaining should stay the same.
*/
SELECT label, food_type, 
	CASE 
		WHEN food_type = 'bagels' THEN 5
		WHEN food_type = 'bagels' THEN 1
		ELSE review
	END AS my_review
FROM restbase.generalinfo
WHERE food_type = 'bagels';

/* QUESTION 5
Using CASE in your where statement, get the labels of restaurants that have a review > 4. If the restaurant serves bagels,
select them if they have a review > 2.5.
Is there another way to execute the same query?
*/
SELECT label, review
FROM restbase.generalinfo
WHERE review > 
	CASE 
		WHEN food_type = 'bagels' THEN 2.5
		ELSE 4
	END

/* QUESTION 6
Do an inner join with  geographic and world.City to get the country code of each city in geographic.
Return a list of cities and their country code. Order by country code (if its not null), otherwise order by city.
(Example ordering (Antioch, NULL), (san rafael, ARG), (brisbane, AUS))
*/

