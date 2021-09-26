-- salesdb
/* QUESTION 1
Perform an anti-join that returns the SalesIDs of customers with no middle name
*/


/* QUESTION 2
Perform an anti-join of your choosing on any other dataset. 
Describe what the result of the query represents (in plain English).
*/


/* QUESTION 3
Return the Employee First name and last name, as one column, of employees who have sold a "Hex Nut". There should be no repetitions. Alias the resulting column as "full_name". 
You are encouraged to inspect the appropriate table before creating the query. This query could take quite long to run if you select unnecessary columns
*/

/* QUESTION 4
The police are investigating your business, looking for an alleged theif. The only thing they know about the suspect is that they have no middle name but have bought something at your shop. 
The police are requesting a list of all your customers (first name, middle initial and last name), as a single column. Fill in the NULL values with an initial of your choosing to avoid anyone being arested.
Rename the column so the police aren't suspicious.
*/

/* QUESTION 5
The police have noticed that one middle initial occurs much more frequently then the others and are questioning if you have tampered with the records.
You apologise profusely and blame it on a technical problem. Build another query that emulates a more natural distribution of middle initials (use CASE WHEN and/or IF)
*/


-- carcinogenesis
/* QUESTION 6
Recall the simple query we did using IF. It created a column with the values we specified (much like COALESCE). 
Now, inspect the canc table. Create a query that describes a drug  based on its class. Ie if its in class 1 it should say "yes" and if 0 it should say "no". Alias the column with a name of your choosing
*/

-- walmart
/* QUESTION 7
What days of the week has the sun risen at 7am (correct to 1 min)? Use CAST(expression AS datatype). 
Can you execute the query without using CAST()?
*/


/* QUESTION 8
How many days have passed since each of these sunrises were recorded?
*/

/* QUESTION 9
On what days of the week did these sunrises happen? Create a view with a query that allows you to answer this question. Give it a unique name.
*/


/* QUESTION 10
Does any day of the week occur more often than the rest? Use the view created in Q9 to help you determine what the mode(s) is/are.
*/

