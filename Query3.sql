/* Query 3 */
/* Which artist has featured the most in each playlist? */
WITH t1 AS
  (SELECT pl.Name PlaylistName,
          ar.Name ArtistName,
          COUNT(*) Features
   FROM playlist pl
   JOIN PlaylistTrack pt ON pl.PlaylistId = pt.PlaylistId
   JOIN Track tr ON pt.TrackId = tr.TrackId
   JOIN Album al ON tr.AlbumId = al.AlbumId
   JOIN Artist ar ON al.ArtistId = ar.ArtistId
   GROUP BY PlaylistName,
            ArtistName
   ORDER BY Features DESC),
     t2 AS
  (SELECT PlaylistName,
          Max(Features) TopFeatures
   FROM t1
   GROUP BY 1)
SELECT t1.PlaylistName,
       t1.ArtistName,
       t1.Features
FROM t1
JOIN t2 ON t1.PlaylistName = t2.PlaylistName
AND t1.Features = t2.TopFeatures
GROUP BY 1,
         2
ORDER BY 3 DESC;
