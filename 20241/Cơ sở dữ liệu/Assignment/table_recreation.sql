create table ShoppingCenter (
	centerID char(5),
    name varchar(20),
    address varchar(50),
    email varchar(30),
    primary key (centerID)
);

create table ShoppingCenter_phoneNumber (
	centerID char(5),
    phoneNumber varchar(15),
    primary key (centerID, phoneNumber),
    foreign key (centerID) references ShoppingCenter(centerID)
);

create table Employee (
	employeeID char(5),
    firstName varchar(10),
    lastName varchar(20),
    dob date,
    address varchar(50),
    gender varchar(3),
    email varchar(30),
    primary key (employeeID)
);

create table Employee_phoneNumber (
	employeeID char(5),
    phoneNumber varchar(15),
    primary key (employeeID, phoneNumber),
    foreign key (employeeID) references Employee(employeeID)
);

create table PartTimeEmployee (
	employeeID_P char(5),
    hoursPerWeek int,
    primary key (employeeID_P),
    foreign key (employeeID_P) references Employee(employeeID)
);

create table FullTimeEmployee (
	employeeID_F char(5),
    benefitsPackage varchar(50),
    annualLeave int,
    primary key (employeeID_F),
    foreign key (employeeID_F) references Employee(employeeID)
);

create table Shift (
	shiftID char(5),
    shiftType varchar(10),
    startTime time,
    endTime time,
    primary key (shiftID)
);

create table Job (
	jobID char(5),
    jobTitle varchar(20),
    jobType varchar(20),
    primary key (jobID)
);

create table WorksOn (
	centerID char(5),
    employeeID char(5),
    shiftID char(5),
    jobID char(5),
    salary int,
    primary key (employeeID, shiftID, jobID),
    foreign key (centerID) references ShoppingCenter(centerID),
    foreign key (employeeID) references Employee(employeeID),
    foreign key (shiftID) references Shift(shiftID),
    foreign key (jobID) references Job(jobID)
);

create table Company (
	companyID char(5),
    name varchar(50),
    taxCode char(10),
    abbreviation varchar(10),
    headOfficeAddress varchar(50),
    legalRepresentative varchar(30),
    dateOfIssue date,
    email varchar(30),
    primary key (companyID)
);

create table Company_phoneNumber (
	companyID char(5),
    phoneNumber varchar(15),
    primary key (companyID, phoneNumber),
    foreign key (companyID) references Company(companyID)
);

create table Advertisement (
	adID char(5),
    centerID char(5),
    companyID char(5),
    adType varchar(10),
    startDate date,
    endDate date,
    price int,
    placeAt varchar(20),
    primary key (adID),
    foreign key (centerID) references ShoppingCenter(centerID),
    foreign key (companyID) references Company(companyID)
);

create table Services (
	serviceID char(5),
    serviceType varchar(10),
    primary key (serviceID)
);

create table Contract (
	contractID char(10),
    companyID char(5),
    signingDate date,
    endDate date,
    dateOfIssue date,
    contractType varchar(10),
    billingFrequency varchar(10),
    primary key (contractID),
    foreign key (companyID) references Company(companyID)
);

create table ServiceOnContract (
	serviceID char(5),
    contractID char(10),
    centerID char(5),
    primary key (serviceID, contractID),
    foreign key (serviceID) references Services(serviceID),
    foreign key (contractID) references Contract(contractID),
    foreign key (centerID) references ShoppingCenter(centerID)
);

create table Invoice (
	invoiceID char(10),
    contractID char(10),
    dateOfIssue date,
    issuedTo varchar(255),
    issuedBy varchar(255),
    totalAmount int,
    primary key (invoiceID),
    foreign key (contractID) references Contract(contractID)
);

create table Store (
	storeID char(5),
    centerID char(5),
    contractID char(10),
    name varchar(20),
    activeStatus tinyint(1),
    activeDate date,
    endDate date,
    totalArea int,
    position varchar(10),
    floor varchar(2),
    businessActivity varchar(20),
    primary key (storeID),
    foreign key (centerID) references ShoppingCenter(centerID),
    foreign key (contractID) references Contract(contractID)
);

create table Customer (
	customerID char(10),
    firstName varchar(10),
    lastName varchar(20),
    gender varchar(3),
    dob date,
    address varchar(50),
    email varchar(30),
    primary key (customerID)
);

create table Customer_phoneNumber (
	customerID char(10),
    phoneNumber varchar(15),
    primary key (customerID, phoneNumber),
    foreign key (customerID) references Customer(customerID)
);

create table Visits (
	visitID char(10),
	customerID char(10),
    storeID char(5),
    amountsBought int,
    visitedDate date,
    pointsEarned int,
    primary key (visitID, customerID, storeID),
	foreign key (customerID) references Customer(customerID),
    foreign key (storeID) references Store(storeID)
);

create table Membership (
	customerID char(10),
    membershipNumber char(10),
    dateOfIssue date,
    expiredDate date,
    totalPoints int,
    membershipLevel varchar(10),
    primary key (customerID, membershipNumber),
    foreign key (customerID) references Customer(customerID)
);

create table Membership_privilegePackage (
	customerID char(10),
    membershipNumber char(10),
    privilegePackage varchar(50),
    primary key (customerID, membershipNumber, privilegePackage),
    foreign key (customerID, membershipNumber) references Membership(customerID, membershipNumber)
);