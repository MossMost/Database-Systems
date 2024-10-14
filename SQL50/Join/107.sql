SELECT NW.id
FROM Weather OW JOIN Weather NW ON datediff(NW.recordDate, OW.recordDate) = 1
WHERE NW.temperature > OW.temperature