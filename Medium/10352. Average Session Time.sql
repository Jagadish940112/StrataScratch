/*
Calculate each user's average session time.
A session is defined as the time difference between a page_load and page_exit.
For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit.
Output the user_id and their average session time.
*/

-- Pre-Query
SELECT *
FROM facebook_web_log
WHERE action IN ('page_load','page_exit')
ORDER BY user_id

-- Solution
WITH CTE AS
(
SELECT user_id, timestamp, DATE(timestamp), action,
MAX(CASE WHEN action = 'page_load' THEN timestamp ELSE NULL END) AS page_load,
MIN(CASE WHEN action = 'page_exit' THEN timestamp ELSE NULL END) AS page_exit
FROM facebook_web_log
WHERE action IN ('page_load','page_exit')
GROUP BY user_id, DATE(timestamp)
ORDER BY user_id
)
SELECT user_id, AVG(TIMESTAMPDIFF(SECOND,page_load,page_exit)) AS AVG_Session_time
FROM CTE
GROUP BY user_id
HAVING AVG_Session_time IS NOT NULL
