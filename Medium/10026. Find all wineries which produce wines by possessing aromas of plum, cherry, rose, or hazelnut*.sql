/*
Find all wineries which produce wines by possessing aromas of plum, cherry, rose, or hazelnut.
To make it more simple, look only for singular form of the mentioned aromas.

Example Description: Hot, tannic and simple, with cherry jam and currant flavors accompanied by high, tart acidity and chile-pepper alcohol heat.
Therefore the winery Bella Piazza is expected in the results.
*/

-- REGEXP

-- matches any of the patterns p1, p2, or p3(p1|p2|p3): Gives all the names containing ‘be’ or ‘ae’.Example – Abel, Baer.
SELECT name FROM student_tbl WHERE name REGEXP 'be|ae' ;

-- \\b is a word boundary

SELECT DISTINCT winery
FROM winemag_p1
WHERE LOWER(description) REGEXP '\\b(plum|cherry|rose|hazelnut)\\b'
ORDER BY winery

-- [^a-z] does not match any alphabet from A to Z
-- Before and after the words should not have any alphabet from A to Z
-- Example; perosetta

SELECT DISTINCT winery
FROM winemag_p1
WHERE LOWER(description) REGEXP '([^a-z])(plum|rose|cherry|hazelnut)([^a-z])'
ORDER BY winery
