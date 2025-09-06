SELECT DISTINCT a.AuthorID, a.AuthorName, a.Country, a.Sex, a.YearOfBirth
FROM Authors a
JOIN Books b ON a.AuthorID = b.AuthorID
JOIN BookCopies bc ON b.BookID = bc.BookID
JOIN LoanDetails ld ON bc.CopyID = ld.CopyID
JOIN Loans l ON ld.LoanID = l.LoanID
WHERE a.Country IN ('United Kingdom', 'United States')
ORDER BY a.Country ASC, a.AuthorName DESC;