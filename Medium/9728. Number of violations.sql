/*
You're given a dataset of health inspections.
Count the number of violation in an inspection in 'Roxanne Cafe' for each year.
If an inspection resulted in a violation, there will be a value in the 'violation_id' column.
Output the number of violations by year in ascending order.
*/

/* COUNT(violation_id), WHERE business_name = 'Roxanne Cafe', GROUP BY year(inspection_date), WHERE violation_id IS NOT NULL */

SELECT YEAR(inspection_date) AS year, COUNT(violation_id) AS n_violations
-- SELECT EXTRACT(YEAR FROM inspection_date) AS year,
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe' AND violation_id IS NOT NULL
-- WHERE business_name like '%Roxanne Cafe%'
GROUP BY year
ORDER BY year ASC

-- COUNT(*) will include NULL fields, while
-- COUNT(column) will not
