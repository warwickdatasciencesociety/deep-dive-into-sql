/*
WDSS Deep-Dive Into SQL: Session One Homework

To receive a certificate email all four
homework files to sean.koh@warwick.ac.uk

To start out with this homework, connect to the
course database with the following details

- Host: sql.wdss.io
- Port: 33061
- User: guest
- Password: relational

The homework exercises below will make use of the 'genes' database.
With the help of this database and our SQL skills we will retrieve
data to help us analyse the characteristics, functions, and interactions
of different genes.
*/

-- USING THE GENES TABLE

/* Question 1:
Select the 'GeneID' and 'Function' columns. Use 'ID' as an
alias for GeneID. Name three different types of gene functions that
you can see upon inspection. If you're having problems with this task leave it until you've
seen session 3
*/


/* Question 2:
Select all of the genes located in the nucleus and with
'METABOLISM' as their function.
*/

/* Question 3:
Select the top 20 genes located in the cytoplasm with strictly
more than 2 chromosones.
*/

/* Question 4:
Select all of the 'Essential' genes located in either
the cytoplasm or mitochondria.
*/

/* Question 5:
Select the top 10 genes without exactly 2 chromosones and belonging to the
'ATPases' gene class.
*/


-- USING THE INTERACTIONS TABLE

/* Question 6:
Select all physical interactions with correlation greater than 0.5.
*/

/* Question 7:
Select all genetic interactions with correlation strictly less than -0.4.
*/

/* Question 8:
Select all interactions with correlation greater than |0.4|.
*/

/* Question 9:
Select the top 10 genetic reactions with highest absolute correlation
(Hint: We will learn about a more efficient way to go about
 this in the next session, but for now try selecting those with absolute
 correlations of more than 0.95 and work from there.
*/


/* Question 10:
Select all physical interactions with correlation greater than |0.3| and
genetic interactions with correlation greater than |0.5|
(Genetic-physical reactions must satisfy the least binding of these constraints).
*/
