/*
Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email.
Output the library code.
*/

SELECT DISTINCT home_library_code
FROM library_usage
WHERE provided_email_address = 0 
  AND circulation_active_year = 2016 
  AND notice_preference_definition = 'email'
