/*
Calculate the total revenue from each customer in March 2019.
Include only customers who were active in March 2019.
Output the revenue along with the customer id and sort the results based on the revenue in descending order.
*/

-- cust_id, SUM(total_order_cost)
-- The EXTRACT() function extracts a part from a given date.

SELECT cust_id, SUM(total_order_cost) AS revenue
FROM orders
WHERE order_date BETWEEN '2019-03-01' AND '2019-03-31' -- WHERE order_date LIKE '2019-03%'
GROUP BY cust_id
ORDER BY revenue DESC
