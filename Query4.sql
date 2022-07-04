/* Query 4 */
/* What is the percentage of each genre from total sales? */
SELECT al.Title AlbumTitle,
       ar.Name ArtistName,
       COUNT(il.Quantity) Sales
FROM InvoiceLine il
JOIN Track tr ON il.TrackId = tr.TrackId
JOIN Album al ON tr.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
JOIN Genre ge ON tr.GenreId = ge.GenreId
GROUP BY AlbumTitle,
         ArtistName
ORDER BY Sales DESC
LIMIT 10;
