/*
We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information.
Find the current salary of each employee assuming that salaries increase each year.
Output their id, first name, last name, department ID, and current salary.
Order your list by employee ID in ascending order.
*/

SELECT id, first_name, last_name, department_id, MAX(salary) AS current_salary
FROM ms_employee_salary
GROUP BY id
ORDER BY id

Recommended Solution

SELECT 
    id,
    first_name,
    last_name,
    department_id,
    salary as max_salary
FROM (
    SELECT *, 
    dense_rank() OVER (PARTITION BY id ORDER BY salary DESC) AS rnk
    FROM ms_employee_salary) fnl
WHERE fnl.rnk = 1
ORDER by fnl.id ASC
