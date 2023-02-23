/*
Find the employee with the highest salary per department.
Output the department name, employee's first name along with the corresponding salary.
*/

SELECT department, first_name, salary
FROM (
     SELECT department, first_name, salary,
     DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS ranking
     FROM employee
) AS subquery
WHERE ranking = 1

Recommended Solution

SELECT first_name as employee_name, department, salary
FROM employee
WHERE salary IN (SELECT MAX(salary) FROM employee GROUP BY department)
