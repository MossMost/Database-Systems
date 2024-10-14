SELECT M.name
FROM Employee E JOIN Employee M
WHERE E.managerId = M.id
GROUP BY M.id
HAVING COUNT(M.id)>=5