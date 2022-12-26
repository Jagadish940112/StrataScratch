/*
What is the overall friend acceptance rate by date?
Your output should have the rate of acceptances by the date the request was sent.
Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender)
a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'.
If the request is accepted, the table logs action = 'accepted'.
If the request is not accepted, no record of action = 'accepted' is logged.
*/

WITH sent AS(
SELECT *
FROM fb_friend_requests
WHERE action = 'sent'),

     accepted AS(
SELECT *
FROM fb_friend_requests
WHERE action = 'accepted')

SELECT sent.date, COUNT(accepted.action)/COUNT(sent.action) AS acceptance_rate
FROM sent LEFT JOIN accepted ON
sent.user_id_sender = accepted.user_id_sender AND
sent.user_id_receiver = accepted.user_id_receiver
GROUP BY sent.date
