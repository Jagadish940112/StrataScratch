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

SELECT ABS
(
-- Max Marketing Salary
(SELECT MAX(salary) FROM CombinedTable WHERE department = 'marketing') -
-- Max Engineering Salary
(SELECT MAX(salary) FROM CombinedTable WHERE department = 'engineering')
)
AS salary_difference
