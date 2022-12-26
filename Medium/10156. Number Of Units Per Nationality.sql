/*
Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.
*/

SELECT hosts.host_id, nationality, age, unit_type,
       COUNT(DISTINCT unit_id) AS apartment_count
FROM airbnb_hosts AS hosts JOIN airbnb_units AS units
ON hosts.host_id = units.host_id
WHERE unit_type = 'Apartment' AND age < 30
GROUP BY nationality
ORDER BY apartment_count DESC
