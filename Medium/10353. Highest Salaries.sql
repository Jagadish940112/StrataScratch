/*
Find the titles of workers that earn the highest salary.
Output the highest-paid title or multiple titles that share the highest salary.
*/

WITH salary AS
(
SELECT worker_title,
RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM worker AS w
JOIN title AS t
ON w.worker_id = t.worker_ref_id
)

SELECT worker_title
FROM salary
WHERE salary_rank = 1


Recommended Solution

SELECT t.worker_title
FROM worker AS w
JOIN title AS t
ON w.worker_id = t.worker_ref_id
WHERE salary IN (SELECT MAX(salary)
                 FROM worker)
