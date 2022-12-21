/*
Find all posts which were reacted to with a heart.
Since a post can be liked by 1 of more users, duplicates should be removed.
For such posts output all columns from facebook_posts table.
*/

SELECT DISTINCT r.reaction, p.post_id, p.poster, post_text, post_keywords, post_date
FROM facebook_reactions AS r
JOIN facebook_posts AS p
ON r.poster = p.poster AND r.post_id = p.post_id
WHERE r.reaction = 'heart'


Recommended Solution

SELECT * FROM facebook_posts
WHERE post_id IN (SELECT post_id FROM facebook_reactions WHERE reaction = 'heart')

-- subquery resulted 2 rows with the post same post_id = 1
-- facebook_posts only have one row with post_id = 1
