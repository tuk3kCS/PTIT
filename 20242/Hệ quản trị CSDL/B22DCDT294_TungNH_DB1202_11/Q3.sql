SELECT b.BookID, b.Title, b.PublicationYear, b.GenreID, g.GenreName
FROM Books b
JOIN Genres g ON b.GenreID = g.GenreID
WHERE b.PublicationYear <= 1900 AND g.GenreName = 'Adventure';