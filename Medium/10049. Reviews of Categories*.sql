Find the top business categories based on the total number of reviews.
Output the category along with the total number of reviews.
Order by total reviews in descending order.

categories column top 3 rows
Auto Detailing;Automotive
Personal Chefs;Food;Gluten-Free;Food Delivery Services;Event Planning & Services;Restaurants
Dry Cleaning & Laundry;Laundry Services;Local Services;Dry Cleaning

Multiple label in categories column per row, each separated by ';'
Each label needs to be separated into its own rows.
UNNEST() function only available in PostgreSQL not in MySQL (LONG WAY)

PostgreSQL
SELECT UNNEST(STRING_TO_ARRAY(categories, ';')) AS category,
       SUM(review_count) AS totaL_review
FROM yelp_business
GROUP BY category
ORDER BY total_review DESC

MySQL (LONG WAY)

-- Count the number of Words in a column per row
-- Why + 1 ?
-- Without + 1, the spaces between words. Example; 'ABC DEF GHI' = 2 spaces
-- With + 1, the words themselves. Example; 'ABC DEF GHI' = 2 + 1 = 3 words
-- Both LENGTH() & CHAR_LENGTH() would work
SELECT categories,
       LENGTH(categories) - LENGTH(REPLACE(categories,';','')) + 1 AS words
FROM yelp_business

-- Find the max number of Words in a column per row = 12
-- Hence why n < 12
SELECT MAX(LENGTH(categories) - LENGTH(REPLACE(categories,';','')) + 1) AS max_words
FROM yelp_business

WITH RECURSIVE num (n) AS (
-- create list 1 - 12
     SELECT 1
     UNION ALL
     SELECT n+1
     FROM num
     WHERE n < (SELECT
       MAX(LENGTH(categories) - LENGTH(REPLACE(categories,';','')) + 1) AS max_words
                FROM yelp_business)
)
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(categories,';',n),';',-1) AS category,
       SUM(review_count) AS total_review
-- run without nested SUBSTRING_INDEX to see the difference
-- why -1 ? look for SUBSTRING_INDEX syntax
FROM yelp_business INNER JOIN num -- add 'n' column from 'num' table to the side
ON n <= LENGTH(categories) - LENGTH(REPLACE(categories,';','')) + 1 -- how many 'n' rows will be added depends on the number of words in 'categories' column
GROUP BY category
ORDER BY total_review DESC
