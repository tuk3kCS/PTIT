SELECT E.employeeID, 
       CONCAT(E.firstName, ' ', E.lastName) AS fullName, 
       WO.salary 
FROM Employee E
JOIN WorksOn WO ON E.employeeID = WO.employeeID
JOIN FullTimeEmployee FTE ON E.employeeID = FTE.employeeID_F
WHERE WO.salary > 15000000;

SELECT m.membershipLevel,
       CONCAT(cu.firstName, ' ', cu.lastName) AS FullName,
       m.totalPoints,
       m.dateOfIssue,
       m.expiredDate
FROM Membership m
JOIN Customer cu ON m.customerID = cu.customerID
WHERE m.totalPoints > 175
ORDER BY m.membershipLevel DESC, m.totalPoints DESC;

SELECT j.jobTitle,
       AVG(w.salary) AS AverageSalary,
       COUNT(e.employeeID) AS NumberOfEmployees
FROM ShoppingCenter s
JOIN WorksOn w ON s.centerID = w.centerID
JOIN Job j ON w.jobID = j.jobID
JOIN Employee e ON w.employeeID = e.employeeID
GROUP BY s.name, j.jobTitle
ORDER BY j.jobTitle;

SELECT C.customerID,
	   CONCAT(C.firstName, ' ', C.lastName) as fullName,
       V.visit_count
FROM customer C
JOIN (
	SELECT customerID, COUNT(*) as visit_count
    FROM visits
    WHERE customerID IN (
		SELECT customerID
        FROM customer
        WHERE address LIKE '%Quận Hai Bà Trưng, Hà Nội'
	)
    GROUP BY customerID
    ORDER BY visit_count DESC
    LIMIT 5
) V ON C.customerID = V.customerID;

SELECT V.contractID, C.companyID, C.name, V.signingDate
FROM company C
JOIN (
	SELECT companyID, contractID, signingDate
    FROM contract
    WHERE signingDate > '2024-01-01'
    )
    V on C.companyID = V.companyID;

SELECT v.storeID, s.name, COUNT(*) as total_visits
FROM visits v
JOIN store s ON v.storeID = s.storeID
GROUP BY v.storeID, s.name
ORDER BY total_visits DESC
LIMIT 1;

SELECT 
    SUBSTRING_INDEX(c.address, ', ', -2) AS district_city,
    COUNT(v.visitID) AS visit_count,
    COUNT(DISTINCT c.customerID) AS customer_count,
    ROUND((COUNT(v.visitID) * 1.0 / COUNT(DISTINCT c.customerID)), 2) AS avg_visits_per_customer
FROM customer c
LEFT JOIN visits v ON c.customerID = v.customerID
WHERE c.address LIKE '%, Quận %, Hà Nội'
GROUP BY SUBSTRING_INDEX(c.address, ', ', -2)
ORDER BY visit_count DESC;
