/*
Find employees who are earning more than their managers.
Output the employee's first name along with the corresponding salary.
*/

-- first_name, salary
-- id, first_name, employee_title, salary, manager_id

SELECT e1.id, e1.first_name, e1.employee_title, e1.salary, e1.manager_id
FROM employee AS e1 JOIN employee AS e2 ON e1.manager_id = e2.id
WHERE e1.salary > e2. salary

