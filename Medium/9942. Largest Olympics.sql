/*
Find the Olympics with the highest number of athletes.
The Olympics game is a combination of the year and the season, and is found in the 'games' column.
Output the Olympics along with the corresponding number of athletes.
Adjust solution to situation where there are multiple rows with highest value.
*/

-- First Step
SELECT COUNT(DISTINCT id) AS number_of_athletes, games, year, season
FROM olympics_athletes_events
GROUP BY year, season
ORDER BY number_of_athletes DESC

-- Second Step
DENSE_RANK() OVER (ORDER BY number_of_athletes DESC) AS Olympics_Rank

-- Now Combine both into a single query.
SELECT *, DENSE_RANK() OVER (ORDER BY number_of_athletes DESC) AS Olympics_Rank
FROM (
     SELECT COUNT(DISTINCT id) AS number_of_athletes, games, year, season
     FROM olympics_athletes_events
     GROUP BY year, season
     ORDER BY number_of_athletes DESC
) AS olympics_with_rank

-- Filter the "rank"
WITH CTE AS
(
SELECT *, DENSE_RANK() OVER (ORDER BY number_of_athletes DESC) AS Olympics_Rank
FROM (
     SELECT COUNT(DISTINCT id) AS number_of_athletes, games, year, season
     FROM olympics_athletes_events
     GROUP BY year, season
     ORDER BY number_of_athletes DESC
) AS olympics_with_rank
)

SELECT *
FROM CTE
WHERE Olympics_Rank = 1
