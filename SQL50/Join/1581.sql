SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits
WHERE visit_id not in (SELECT visit_id FROM Transactions)
GROUP BY customer_id