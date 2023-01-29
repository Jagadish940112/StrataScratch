/*
Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01.
If customer had more than one order on a certain day, sum the order costs on daily basis.
Output customer's first name, total cost of their items, and the date.

For simplicity, you can assume that every first name in the dataset is unique.
*/

-- customer, highest daily total order cost, between 2019-02-01 to 2019-05-01,
-- sum the order costs on daily basis
-- Output customer's first name, total cost of their items, and the date.

-- SUM total_order_cost by day
WITH CTE AS (
SELECT cust_id, order_date, total_order_cost,
       SUM(total_order_cost) AS total_order_cost_daily
FROM orders
WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY cust_id, order_date
-- HAVING total_order_cost != total_order_cost_daily -- checking
ORDER BY cust_id
)

-- highest daily total order cost
SELECT first_name, cust_id, order_date, total_order_cost_daily
FROM customers AS c RIGHT JOIN CTE AS o ON c.id = o.cust_id
WHERE total_order_cost_daily = (SELECT MAX(total_order_cost_daily) FROM CTE)
