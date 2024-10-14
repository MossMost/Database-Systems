SELECT unique_id, name
FROM employees e LEFT JOIN employeeuni eu ON e.id = eu.id