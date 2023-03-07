/*
Classify each business as either a restaurant, cafe, school, or other.

•	A restaurant should have the word 'restaurant' in the business name.
•	A cafe should have either 'cafe', 'café', or 'coffee' in the business name.
•	A school should have the word 'school' in the business name.
•	All other businesses should be classified as 'other'.

Output the business name and their classification.
*/

SELECT DISTINCT business_name,
CASE

    -- WHEN LOWER(business_name) REGEXP '\\b(restaurant)\\b' THEN 'restaurant'
    -- Restaurante Montecristo, word boundary wont work because of 'Restaurante'
    
    WHEN LOWER(business_name) LIKE '%restaurant%' THEN 'restaurant'
    WHEN LOWER(business_name) REGEXP '\\b(cafe|café|coffee)\\b' THEN 'cafe'
    WHEN LOWER(business_name) LIKE '%school%' THEN 'school'
    
    -- WHEN LOWER(business_name) REGEXP '\\b(school)\\b' THEN 'school' 
    -- Gateway High/Kip Schools, word boundary wont work because of 'Schools'
    
    ELSE 'other'

END AS business_type
FROM sf_restaurant_health_violations

-- Recommended Solution

SELECT
    DISTINCT business_name
    , CASE
        WHEN business_name LIKE '%restaurant%' THEN 'restaurant'
        WHEN business_name LIKE '%cafe%'
            OR business_name LIKE '%café%'
            OR business_name LIKE '%coffee%' THEN 'cafe'
        WHEN business_name LIKE '%school%' THEN 'school'
        ELSE 'other'
    END AS business_type
FROM sf_restaurant_health_violations
