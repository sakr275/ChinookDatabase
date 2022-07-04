/* Query 1 */
/* What are the numbers of media types sold by most selling employee? */
SELECT em.FirstName|| ' ' ||em.LastName EmployeeFullName,
       mt.name MediaTypeName,
       COUNT(*) Quantity
FROM Employee em
JOIN Customer cu ON em.EmployeeId = cu.SupportRepId
AND em.EmployeeId =
  (SELECT EmployeeId
   FROM
     (SELECT em.EmployeeId,
             em.firstname|| ' ' ||em.lastname,
             SUM(il.UnitPrice * il.Quantity)
      FROM InvoiceLine il
      JOIN Invoice i ON il.InvoiceId = i.InvoiceId
      JOIN Customer cu ON i.CustomerId = cu.CustomerId
      JOIN Employee em ON cu.SupportRepId = em.EmployeeId
      GROUP BY em.EmployeeId,
               em.firstname|| ' ' ||em.lastname
      ORDER BY 3 DESC
      LIMIT 1) tt)
JOIN Invoice i ON i.CustomerId = cu.CustomerId
JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
JOIN Track tr ON tr.TrackId = il.TrackId
JOIN MediaType mt ON mt.MediaTypeId = tr.MediaTypeId
GROUP BY 2
ORDER BY 3 DESC;
