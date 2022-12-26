/*
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.
*/

SELECT DISTINCT host_id, guest_id
FROM airbnb_hosts AS hosts JOIN airbnb_guests AS guests
ON hosts.nationality = guests.nationality AND hosts.gender = guests.gender
