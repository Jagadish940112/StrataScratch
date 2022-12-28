/*
Find the date with the highest total energy consumption from the Meta/Facebook data centers.
Output the date along with the total energy consumption across all data centers.
*/

WITH sumx AS(
SELECT date, SUM(consumption) AS total_energy
FROM (
     SELECT * FROM fb_eu_energy
     UNION ALL
     SELECT * FROM fb_asia_energy
     UNION ALL
     SELECT * FROM fb_na_energy
) AS combined
GROUP BY date
ORDER BY total_energy DESC
)

SELECT *
FROM (
     SELECT date, total_energy,
            DENSE_RANK() OVER (ORDER BY total_energy DESC) AS ranking
     FROM sumx
) AS total_with_ranking
WHERE ranking = 1
