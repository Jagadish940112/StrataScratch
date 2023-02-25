/*
Find the rate of processed tickets for each type.
*/

SELECT type,
CASE
    WHEN type = 0 THEN SUM(processed)/COUNT(processed)
    WHEN type = 1 THEN SUM(processed)/COUNT(processed)
    -- since the two WHEN conditions are identical, so the query could be simplified to:
    -- WHEN type IN (0, 1) THEN SUM(processed)/COUNT(processed)
    -- SUM(CASE...1 ElSE 0...)::NUMERIC / COUNT(*)
    ELSE NULL
END AS processed_rate
FROM facebook_complaints
GROUP BY type

Recommended Solution

SELECT type, SUM(processed)/COUNT(*)
FROM facebook_complaints
GROUP BY type;
