/*
Find the average number of bathrooms and bedrooms for each city’s property types.
Output the result along with the city name and the property type.
*/

SELECT AVG(bathrooms) as AVG_Bathrooms,
       AVG(bedrooms) as AVG_Bedrooms,
       city,
       property_type
FROM airbnb_search_details
GROUP BY city, property_type
