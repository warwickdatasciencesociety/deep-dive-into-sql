-- restbase
/* QUESTION 1
Select all the restaurants in generalinfo that have food_type = bagels.
*/


/* QUESTION 2
Using a subquery and an anti-join with geographic, find the cities without a bagel restaurant.
*/


/* QUESTION 3
Return each restaurant and a column called address which comes in the format 'streetname, city'
*/


/* QUESTION 4
Select all the cities in location where the city is null. 
Return all the cities but replace the cities that are null with 'Atlantis'
*/


/* QUESTION 5
Using CASE in your select statement, create a new column called 'my_review'.
Change the review of your most liked food to 5 and your least liked food to 1. The remaining should stay the same.
*/



/* QUESTION 5
Using CASE in your where statement, get the labels of restaurants that have a review > 4. If the restaurant serves bagels,
select them if they have a review > 2.5.
Is there another way to execute the same query?
*/


/* QUESTION 6
Do an inner join with  geographic and world.City to get the country code of each city in geographic.
Return a list of cities and their country code. Order by country code (if its not null), otherwise order by city.
(Example ordering (Antioch, NULL), (san rafael, ARG), (brisbane, AUS))
*/

