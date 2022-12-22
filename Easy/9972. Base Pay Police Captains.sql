/*
Find the base pay for Police Captains.
Output the employee name along with the corresponding base pay.
*/

SELECT employeename, jobtitle, basepay
FROM sf_public_salaries
WHERE jobtitle = 'CAPTAIN III (POLICE DEPARTMENT)'


Recommended Solution

SELECT employeename, basepay FROM sf_public_salaries
WHERE jobtitle LIKE 'CAPTAIN%'

SELECT employeename, basepay FROM sf_public_salaries
WHERE jobtitle ILIKE '%CAPTAIN%POLICE%'
