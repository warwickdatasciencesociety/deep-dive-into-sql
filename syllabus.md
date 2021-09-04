## Overview

### General Advice

- SQL can be taught in a "lego block" fashion, introducing new pieces as needed
- Try to introduce new concepts by example, trying to motivate the method with a practical use case
- Repeatedly read through the SQL and translate to English (e.g. `SELECT` this column `FROM` this table)
- Although SQL doesn't enforce proper capitalisation, make sure you know the conventions to set a good example
- Likewise, try to end statements with semi-colons. If you forget, point out that it doesn't always matter but is best-practice
- Try to use proper SQL terminology—statement, keyword, clause, predicate, expression—though emphasise that they are not that important to memorise
- The server uses the MySQL dialect of SQL; make sure students are aware that multiple dialects exist though are roughly the same

### Resources

- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/default.Asp)
- [MySQL functions](https://www.w3schools.com/sql/sql_ref_mysql.asp)

## Session Content

### Session 1: Basic queries

- Simplest statement: `SELECT col FROM ...`
- Introduce comments so you can use them where needed
- Expand to more than one column as well as `*` wildcard
- Introduce some basic mathematical transformations (e.g. multiple by 2; a motivating example is changing units)
- Okay, this now gives ugly column names—a perfect time for `AS`
- What about duplicates? `SELECT DISTINCT`
- TMI—introduce filtering with `WHERE`; start simple with comparisons and (not-)equality
- Point out in particular `=` is a single equals, strings must be in **single** quotes, `<>` can be thought of as either greater than or less than
- Filtering strings with `LIKE` and `%`, `_`, `[]`, `^`, `-`. Stress that these are rare and its okay to look them up. You could even say you can't remember them if you do and show how you'd find them on W3S
- Multiple conditions with `NOT`, `AND`, `OR`
- Show that pattern `... = ... OR ... = ... OR ... = ...` can be replaced with `IN`
- Likewise for `BETWEEN`
- If things are going _very_ well, you can do an `IN` using a subquery though this is likely overstepping
- Still too much? `LIMIT`. This is a good time to introduce dialects as its the first major difference from SQL Server/Oracle

Further reading:
- `CASE` statements
- Modulo operator
- `EXISTS`, `ANY`, `ALL` for handling subqueries

Database: `genes`

### Session 2: Aggregations and Set Operations

- Introduce basic aggregation functions: `SUM`, `AVG`, `COUNT`, `MIN`, `MAX`, grouping by one variable
- Reminder of the importance of `AS` for producing clear output
- Point out that aggregation functions ignore missing values
- Also introduce `COUNT DISTINCT`
- Group by multiple variables
- Introduce `HAVING`, making sure to distinguish it from `WHERE` (filter lines vs filter groups)
- Can also introduce `ORDER BY` at an appropriate point in the session, as well as `DESC`
- Show an example bringing everything we have learnt so far together
- Briefly introduce `UNION`, `INTERSECT`, but make clear they are not too common in practical use

Further reading:
- Window functions (advanced)
- `IIF`

Database: `Toxicology`

### Session 3: Joins and Null Values

- Start off with simple example to illustrate when to use each join type. E.g.:
  - Two tables: supplier (information about suppliers of a chemical compound) and sample (lab results from sampling the compound for QA)
  - Joined by the name of the supplier
  - If we no longer work with a supplier, they don't appear on supplier table. Some suppliers are yet to supply any samples
  - Q: how many total grams from each supplier? Need to use left join and fill NULL with 0
  - Q: what is average quality for each supplier? Probably want to use right join and replace NULL with 'Unknown'
  - Could also do inner joins if don't care about special cases
- Introduce joins in MySQL
- Clean up notation by adding aliases for the two tables
- Briefly mention that `ON` is extremely flexible and can take any condition that `WHERE` can
- Tell people they can play around with this but expect to get weird results as the behaviour is not completely intuitive
- Note that we might obtain null values when joining
- Find these with `IS NULL` and `IS NOT NULL` (point out it is not `NOT IS NULL`)
- Handle null values with `COALESCE`

Further reading:
- Self/cross joins
- Natural join and `USING`

Database: `Carcinogenesis`
