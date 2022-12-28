/*
Find the average total compensation based on employee titles and gender.
Total compensation is calculated by adding both the salary and bonus of each employee.
However, not every employee receives a bonus so disregard employees without bonuses in your calculation.
Employee can receive more than one bonus.

Output the employee title, gender (i.e., sex), along with the average total compensation.
*/

WITH bonus AS(
SELECT worker_ref_id, SUM(bonus) AS bonus
FROM sf_bonus
GROUP BY worker_ref_id
)
-- dont count employees without bonuses so use JOIN NOT LEFT JOIN
SELECT employee_title, sex, AVG(salary + bonus) AS avg_compnesation
FROM sf_employee AS e JOIN bonus AS b ON e.id = b. worker_ref_id
GROUP BY employee_title, sex
