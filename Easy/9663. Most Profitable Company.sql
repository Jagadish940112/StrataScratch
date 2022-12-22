/*
Find the most profitable company from the financial sector.
Output the result along with the continent.
*/

SELECT company, MAX(profits), continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'


Recommended Solution

SELECT company, continent
FROM forbes_global_2010_2014
WHERE sector = 'Financials'
ORDER BY profits DESC
LIMIT 1
