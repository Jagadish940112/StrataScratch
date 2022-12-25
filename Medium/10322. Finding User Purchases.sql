/*
Write a query that'll identify returning active users.
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases.
Output a list of user_ids of these returning active users.
*/

SELECT DISTINCT user_id
FROM (
    SELECT user_id, created_at,
    LEAD(created_at) OVER (PARTITION BY user_id ORDER BY created_at) AS next_order
    FROM amazon_transactions
     ) AS subquery
WHERE DATEDIFF(next_order, created_at) <= 7
