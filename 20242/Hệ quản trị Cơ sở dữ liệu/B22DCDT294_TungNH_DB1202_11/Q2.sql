SELECT MemberID, MemberName, Address, Email, Sex, BirthDate
FROM Members
WHERE Sex = 'Male' AND BirthDate > '1990-12-31';
