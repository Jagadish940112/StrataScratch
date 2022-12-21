/*
Count the number of movies that Abigail Breslin was nominated for an oscar.
*/

SELECT nominee, COUNT(DISTINCT movie) AS movies_count
FROM oscar_nominees
WHERE nominee = 'Abigail Breslin'


Recommended Solution -- not good, supposed to count the number of movies that Abigail Breslin nominated.

Select 
    count(nominee) 
From 
    oscar_nominees
Where nominee = 'Abigail Breslin';
