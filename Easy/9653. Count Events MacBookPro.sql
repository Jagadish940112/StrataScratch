/*
Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.
*/

-- event is vague, 2 columns both have events (event_type & event_name)

SELECT event_name, COUNT(event_name) as event_count
FROM playbook_events
WHERE device LIKE '%macbook pro%'
GROUP BY event_name
ORDER BY event_count DESC


Recommended Solution

SELECT COUNT(*) as event_count, event_name
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name
ORDER BY event_count DESC
