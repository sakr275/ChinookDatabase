/* Query 2 */
/* What is the percentage of each genre from total sales? */
SELECT ge.Name GenreType,
       COUNT(*) SalesCount,
       SUM(il.UnitPrice * il.Quantity) SalesValue,
       SUM(il.UnitPrice * il.Quantity) * 100 / SUM(SUM(il.UnitPrice * il.Quantity)) OVER() AS SalesPercentage
FROM InvoiceLine il
JOIN Track tr ON il.TrackId = tr.TrackId
JOIN Genre ge ON tr.GenreId = ge.GenreId
GROUP BY 1
ORDER BY 4 DESC;
