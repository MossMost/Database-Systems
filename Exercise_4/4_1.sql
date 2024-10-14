SELECT postal_code, COUNT(postal_code) AS customer_numbers
FROM customer
GROUP BY postal_code
ORDER BY customer_number DESC;
