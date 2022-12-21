/*
Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.
*/

SELECT *,
        CASE
        WHEN yearly_salary <= 30000 THEN '<= 30k USD'
        WHEN yearly_salary >= 70000 THEN '>= 70k USD'
        ELSE 'Between 30k USD and 70k USD'
        END AS salary_group
FROM lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000


Recommended Solution

SELECT *
FROM lyft_drivers
WHERE yearly_salary NOT BETWEEN 30001 AND 70000
