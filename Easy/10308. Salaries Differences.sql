/*
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments.
Output just the absolute difference in salaries.
*/

-- Combine tables
WITH CombinedTable AS
(
SELECT employee.id, first_name, last_name, salary, department_id, department
FROM db_employee AS employee
JOIN db_dept AS dept
ON employee.department_id = dept.id
)
-- Find absolute salary differences
SELECT ABS
(
-- Max Marketing Salary
(SELECT MAX(salary) FROM CombinedTable WHERE department = 'marketing') -
-- Max Engineering Salary
(SELECT MAX(salary) FROM CombinedTable WHERE department = 'engineering')
)
AS salary_difference


-- Recommended Solution

SELECT ABS(MAX(a.salary) - MAX(b.salary)) AS salary_differences
FROM db_employee AS a, db_employee AS b
WHERE a.department_id = 4 AND b.department_id = 1;
