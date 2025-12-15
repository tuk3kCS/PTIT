SELECT g.GenreID, g.GenreName, COUNT(bc.CopyID) AS NumberOfBookCopies
FROM Genres g
LEFT JOIN Books b ON g.GenreID = b.GenreID AND b.PublicationYear > 1980
LEFT JOIN BookCopies bc ON b.BookID = bc.BookID
GROUP BY g.GenreID, g.GenreName
ORDER BY NumberOfBookCopies DESC, g.GenreName ASC;