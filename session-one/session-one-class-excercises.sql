/*CLASS EXCERCISES*/
/* PART 1: Understanding our data and handling Select statements */

/*
1.1 Open the Sales database. What tables do you see?
*/


/*
1.2 Open the Employees table. What attributes does the table contain? What kind of values can each attribute take?
*/

/*See the properties section*/

/*
1.3 Select all of the data in the Employees table. 
Afterwards, try to select only two attributes.
*/

/*
1.4 Select the first name, middle initial and last name of every employee. Rename each attribute to first, middle and last.
*/



/* PART 2: Select WHERE???*/

/*
2.1 Select the first and last name of every customer with the last name "Diaz".
*/
/*
2.2 Do the same selection as 2.1 but this time with the last name "diaz" (Note the lowercase). What does this tell you
about MySQL's attention to capitalisation?
*/

/*
2.3 Select all customers with ID between 100 and 200 (exclusive).
*/

/*
2.4 Select all customers with ID below 100 or above 200 (inclusive).
*/




/* PART 3: Top performers
Management wants to find the top performing employees of the quarter and reward them with a bonus. 
You are tasked to find the SalesPersonID of these top performers.
 * */

/*
3.1 From the Sales table, select the SalesPersonID of all sales in descending order of Quantity sold. 
*/

/* 
3.2 We only want to reward the salespeople who made the top 5 sales in terms of quantity sold. 
    Find the SalesPersonID and Quantity of the salespeople who made the top 10 sales.
*/

/* 
3.3 There seems to be something peculiar about the data. What do you notice? 
    Devise a strategy to get the SalesPersonIDs of the salespeople who did the highest quantity sales.
    (There are many ways to do this and it may take several queries.
*/
