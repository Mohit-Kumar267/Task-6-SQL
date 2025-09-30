1.Use scalar and correlated subqueries 
2.Use subqueries inside IN, EXISTS, =


1. Scalar and Correlated Subqueries
🔸 Scalar Subquery

A scalar subquery is a subquery that returns exactly one value (one row, one column).
It is typically used in places where a single value is expected, such as in the SELECT, WHERE, or HAVING clauses.

👉 Characteristics:
Must return only one row and one column
If it returns more than one row, it will throw an error
Often used with =, <, >, etc.

🔸 Correlated Subquery
A correlated subquery is a subquery that uses values from the outer query.
This means the subquery is executed once for every row selected by the outer query.

👉 Characteristics:
Depends on the outer query for its values
Cannot be run independently
Often used to perform row-by-row comparisons

2. Subqueries inside IN, EXISTS, =
🔸 Subquery with IN
The IN keyword is used to match a value against a list of values returned by the subquery.

🔸 Subquery with EXISTS
EXISTS checks for the existence of rows returned by the subquery.
It returns TRUE if the subquery returns at least one row.

🔸 Subquery with =
Using = compares a column to the single value returned by a scalar subquery.
