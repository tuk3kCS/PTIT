WITH MonthlyLoanCounts AS (
    SELECT YEAR(LoanDate) AS Year, MONTH(LoanDate) AS Month, COUNT(*) AS NumberOfLoans
    FROM Loans
    GROUP BY YEAR(LoanDate), MONTH(LoanDate)
),
MaxLoansPerYear AS (
    SELECT Year, MAX(NumberOfLoans) AS MaxLoans
    FROM MonthlyLoanCounts
    GROUP BY Year
)
SELECT m.Year, m.Month, m.NumberOfLoans
FROM MonthlyLoanCounts m
JOIN MaxLoansPerYear ml ON m.Year = ml.Year AND m.NumberOfLoans = ml.MaxLoans
ORDER BY m.Year ASC, m.Month ASC;
