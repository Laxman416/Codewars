-- 6kyu JOIN and RANK 

-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the sales table so that you can return the COUNT of all sales and RANK each person by their sale_count.

-- people table schema
-- id
-- name
-- sales table schema
-- id
-- people_id
-- sale
-- price
-- You should return all people fields as well as the sale count as "sale_count" and the rank as "sale_rank".

-- NOTE: Your solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

-- Create your SELECT statement here

SELECT people.id, 
       people.name, 
       COUNT(sales.id) AS sale_count,
       RANK() OVER (ORDER BY COUNT(sales.id) DESC) AS sale_rank
FROM people
JOIN sales ON people.id = sales.people_id
GROUP BY people.id, people.name
ORDER BY sale_count DESC;