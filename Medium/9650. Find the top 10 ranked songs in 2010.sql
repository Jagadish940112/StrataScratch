/*
What were the top 10 ranked songs in 2010?
Output the rank, group name, and song name but do not show the same song twice.
Sort the result based on the year_rank in ascending order.
*/

SELECT DISTINCT year_rank, group_name, song_name
FROM billboard_top_100_year_end
WHERE year = 2010
ORDER BY year_rank ASC
LIMIT 10

-- OR
-- RANK() and DENSE_RANK() provide the same number for ties, thus unable differentiate no_occurence, use ROW_NUMBER instead

WITH CTE AS (
    SELECT year_rank, group_name, song_name,
    ROW_NUMBER() OVER (PARTITION BY year_rank ORDER BY year_rank ASC) AS no_occurence
    FROM billboard_top_100_year_end
    WHERE year = 2010 AND year_rank <= 10
)
SELECT year_rank, group_name, song_name
FROM CTE
WHERE no_occurence = 1
