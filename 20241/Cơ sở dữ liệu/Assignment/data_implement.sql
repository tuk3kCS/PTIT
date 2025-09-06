-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingcenterdb
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement` (
  `adID` char(5) NOT NULL,
  `centerID` char(5) DEFAULT NULL,
  `companyID` char(5) DEFAULT NULL,
  `adType` varchar(10) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `price` int DEFAULT NULL,
  `placeAt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`adID`),
  KEY `centerID` (`centerID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`centerID`) REFERENCES `shoppingcenter` (`centerID`),
  CONSTRAINT `advertisement_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES ('A001','C01','C0001','Billboard','2024-11-01','2024-11-30',5000,'Entrance'),('A0010','C01','C0019','Online','2024-11-10','2024-11-25',5000,'Mobile App'),('A0011','C01','C0020','Billboard','2024-11-02','2024-11-20',4500,'Lobby'),('A0012','C01','C0022','Poster','2024-11-01','2024-11-10',1000,'Hallway'),('A0013','C01','C0023','Online','2024-11-12','2024-11-26',3200,'YouTube'),('A0014','C01','C0025','Billboard','2024-11-05','2024-11-30',5500,'Escalator'),('A0015','C01','C0030','Poster','2024-11-07','2024-11-21',1800,'Window'),('A0016','C01','C0014','Online','2024-11-15','2024-11-28',4000,'Search Engine'),('A0017','C01','C0018','Billboard','2024-11-02','2024-11-20',6000,'Exhibition Area'),('A0018','C01','C0009','Online','2024-11-08','2024-11-22',3700,'Affiliate Program'),('A0019','C01','C0008','Poster','2024-11-01','2024-11-14',1600,'Customer Service'),('A002','C01','C0002','Online','2024-11-05','2024-11-20',3000,'Website'),('A0020','C01','C0013','Billboard','2024-11-06','2024-11-20',5000,'Convention Center'),('A003','C01','C0006','Poster','2024-11-10','2024-11-25',1500,'Storefront'),('A004','C01','C0005','Billboard','2024-11-12','2024-12-12',5500,'Main Hall'),('A005','C01','C0004','Online','2024-11-15','2024-11-30',4500,'Social Media'),('A006','C01','C0010','Poster','2024-11-01','2024-11-15',2000,'Elevator'),('A007','C01','C0012','Online','2024-11-03','2024-11-10',3500,'Email'),('A008','C01','C0015','Billboard','2024-11-07','2024-11-21',6000,'Parking Lot'),('A009','C01','C0016','Poster','2024-11-05','2024-11-15',1200,'Restroom');
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyID` char(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `taxCode` char(10) DEFAULT NULL,
  `abbreviation` varchar(10) DEFAULT NULL,
  `headOfficeAddress` varchar(50) DEFAULT NULL,
  `legalRepresentative` varchar(30) DEFAULT NULL,
  `dateOfIssue` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('C0001','Highlands Coffee Vietnam','0302100754','HLD','146-148 Nguyen Van Cu, District 1, HCMC','Nguyen Xuan Phu','2020-01-15','contact@highlandscoffee.com.vn'),('C0002','Phuc Long Heritage JSC','0315521653','PLH','42/24-42/26 Nguyen Hue, District 1, HCMC','Le Viet Thanh','2019-06-22','info@phuclong.com.vn'),('C0003','Uniqlo Vietnam','0315304731','UQL','146 Nguyen Van Linh, District 7, HCMC','Osamu Ikezoe','2021-03-10','contact@uniqlo.vn'),('C0004','CGV Vietnam','0303675393','CGV','79 Nguyen Van Troi, Phu Nhuan, HCMC','Kim Jung Soo','2018-11-30','info@cgv.vn'),('C0005','Nguyen Kim Trading JSC','0301238757','NKM','63-65 Tran Hung Dao, District 1, HCMC','Dang Thanh Tam','2022-02-18','online@nguyenkim.com'),('C0006','The Face Shop Vietnam','0312654789','TFS','65 Le Loi, Ben Nghe, District 1, HCMC','Park Min Young','2021-07-05','info@thefaceshop.vn'),('C0007','Pizza Hut Vietnam','0300577143','PHV','2 Ngo Duc Ke, District 1, HCMC','Tran Hung Nam','2020-09-12','contact@pizzahut.vn'),('C0008','Jollibee Vietnam','0303883266','JBE','26 Bis Nguyen Thi Minh Khai, District 1, HCMC','Tran Thi Lan Anh','2019-04-25','info@jollibee.vn'),('C0009','Nike Vietnam','0315789432','NKE','29 Le Duan, District 1, HCMC','Nguyen Hai Yen','2022-01-08','contact@nike.com.vn'),('C0010','Adidas Vietnam','0315876543','ADS','55 Nguyen Cu Trinh, District 1, HCMC','Le Minh Tuan','2020-11-15','info@adidas.vn'),('C0011','Tran Anh Mobile','0102174916','TAM','1174 Duong Lang, Dong Da, Ha Noi','Tran Xuan Kien','2021-05-20','contact@trananh.vn'),('C0012','TheFaceShop Vietnam','0315432198','TFS','123 Cach Mang T8, District 3, HCMC','Le Thi My Hanh','2019-08-30','info@tfsvietnam.vn'),('C0013','KFC Vietnam','0300557326','KFC','292 Ba Trieu, Hai Ba Trung, Ha Noi','Nguyen Thi Kim Oanh','2022-03-15','contact@kfcvietnam.com.vn'),('C0014','Vascara','0312987654','VSC','74 Hai Ba Trung, District 1, HCMC','Le Thi Hoai','2020-04-08','cs@vascara.com'),('C0015','Lotte Cinema','0305867234','LTC','469 Nguyen Huu Tho, District 7, HCMC','Park Hyun Jin','2021-09-22','info@lottecinemavn.com'),('C0016','Fahasa Book Store','0304132510','FHS','60-62 Le Loi, District 1, HCMC','Pham Minh Thuan','2019-12-10','info@fahasa.com'),('C0017','Starbucks Vietnam','0312345678','SBV','157 Nguyen Du, District 1, HCMC','Patricia Marques','2022-01-30','info@starbucks.vn'),('C0018','Puma Vietnam','0315678901','PUM','70 Le Thanh Ton, District 1, HCMC','Tran Van Quyen','2020-07-14','contact@puma.vn'),('C0019','Miniso Vietnam','0315234567','MNS','45 Tran Quang Khai, Hoan Kiem, Ha Noi','Nguyen Thi Hong','2021-11-05','info@miniso.vn'),('C0020','The Gioi Di Dong Store','0303217654','TGD','123 Nguyen Thai Hoc, District 1, HCMC','Le Van Tam','2019-03-18','store@thegioididong.com'),('C0021','Paris Baguette','0315678234','PBV','27 Nguyen Trung Truc, District 1, HCMC','Kim Sung Ho','2022-04-01','info@parisbaguette.vn'),('C0022','Mumuso Vietnam','0315432789','MMS','189 Nguyen Thai Hoc, District 1, HCMC','Le Thi Hang','2020-08-25','contact@mumuso.vn'),('C0023','Innisfree Vietnam','0312345987','INF','50 Le Loi, District 1, HCMC','Park Ji Young','2021-06-12','cs@innisfree.vn'),('C0024','Guardian Vietnam','0301458762','GDN','141 Nguyen Du, District 1, HCMC','Tran Kien Nam','2019-10-05','customer@guardian.vn'),('C0025','Watsons Vietnam','0315789123','WTS','67 Le Loi, District 1, HCMC','Rod Rutherford','2022-02-28','care@watsons.vn'),('C0026','H&M Vietnam','0315432167','HNM','115 Nguyen Hue, District 1, HCMC','Fredrik Famm','2020-12-15','contact@hm.vn'),('C0027','Zara Vietnam','0315678543','ZRA','58 Dong Khoi, District 1, HCMC','Maria Garcia','2021-04-08','info@zara.vn'),('C0028','Lotteria Vietnam','0300244207','LTR','100 Nguyen Van Cu, District 5, HCMC','Lee Jong Kun','2019-07-22','contact@lotteria.vn'),('C0029','Lock&Lock Vietnam','0312398745','LNL','77 Hoang Van Thu, Phu Nhuan, HCMC','Kim Jung Hoon','2022-05-10','info@locknlock.vn'),('C0030','Xiaomi Store Vietnam','0315876234','XMI','123 Ba Trieu, Hai Ba Trung, Ha Noi','Nguyen Duy Hung','2020-10-20','store@xiaomi.vn'),('C0031','Cleaning Vietnam','0867772881','CLN','123 Tran Phu, Ha Dong, Ha Noi','Dinh Quyet Thang','2023-10-10','contact@cleanginvn.com'),('C0032','Delivery Vietnam','0867772833','DLV','300 Tran Phu, Ha Dong, Ha Noi','Dinh Quyet Muc','2022-10-10','contact@deliveryvn.com');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_phonenumber`
--

DROP TABLE IF EXISTS `company_phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_phonenumber` (
  `companyID` char(5) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`companyID`,`phoneNumber`),
  CONSTRAINT `company_phonenumber_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_phonenumber`
--

LOCK TABLES `company_phonenumber` WRITE;
/*!40000 ALTER TABLE `company_phonenumber` DISABLE KEYS */;
INSERT INTO `company_phonenumber` VALUES ('C0001','0723134555'),('C0001','0818231231'),('C0002','0258257845'),('C0003','0987773772'),('C0004','0210184214'),('C0005','0439366381'),('C0006','0516578793'),('C0007','0801479458'),('C0008','0587350675'),('C0009','0477765673'),('C0009','0639951162'),('C0010','0640498583'),('C0010','0746881593'),('C0011','0727239942'),('C0012','0972721947'),('C0013','0382470126'),('C0014','0867772881'),('C0015','0867772883'),('C0016','0321451231'),('C0016','0867821932'),('C0017','0123412451'),('C0017','0258257845'),('C0018','0912381234'),('C0019','0213122214'),('C0020','0125412124'),('C0021','0132513580'),('C0022','0218371293'),('C0022','0929134791'),('C0023','0123891273'),('C0023','0129837129'),('C0024','0918273912'),('C0025','0192381291'),('C0026','0192389123'),('C0026','0999182381'),('C0027','0919238812'),('C0028','0991238912'),('C0029','0129319233'),('C0029','0971238712'),('C0029','0999123123'),('C0030','0912391231');
/*!40000 ALTER TABLE `company_phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contractID` char(10) NOT NULL,
  `companyID` char(5) DEFAULT NULL,
  `signingDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `dateOfIssue` date DEFAULT NULL,
  `contractType` varchar(10) DEFAULT NULL,
  `billingFrequency` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`contractID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES ('CTR2024001','C0001','2023-12-15','2026-12-14','2023-12-20','LEASE','QUARTERLY'),('CTR2024002','C0002','2024-01-01','2028-12-31','2024-01-05','LEASE','MONTHLY'),('CTR2024003','C0003','2023-11-30','2026-11-29','2023-12-05','LEASE','QUARTERLY'),('CTR2024004','C0004','2023-10-15','2028-10-14','2023-10-20','LEASE','MONTHLY'),('CTR2024005','C0005','2024-01-10','2029-01-09','2024-01-15','ANCHOR','QUARTERLY'),('CTR2024006','C0006','2023-12-01','2025-11-30','2023-12-05','LEASE','MONTHLY'),('CTR2024007','C0007','2024-01-15','2027-01-14','2024-01-20','F&B','MONTHLY'),('CTR2024008','C0008','2023-11-01','2026-10-31','2023-11-05','F&B','MONTHLY'),('CTR2024009','C0009','2024-02-01','2029-01-31','2024-02-05','ANCHOR','QUARTERLY'),('CTR2024010','C0010','2024-01-20','2029-01-19','2024-01-25','ANCHOR','QUARTERLY'),('CTR2024011','C0011','2023-12-10','2026-12-09','2023-12-15','LEASE','MONTHLY'),('CTR2024012','C0012','2024-01-05','2027-01-04','2024-01-10','LEASE','MONTHLY'),('CTR2024013','C0013','2023-11-15','2026-11-14','2023-11-20','F&B','MONTHLY'),('CTR2024014','C0014','2024-02-10','2027-02-09','2024-02-15','LEASE','MONTHLY'),('CTR2024015','C0015','2023-12-20','2028-12-19','2023-12-25','ANCHOR','QUARTERLY'),('CTR2024016','C0016','2024-01-10','2027-01-09','2024-01-15','LEASE','MONTHLY'),('CTR2024017','C0017','2023-11-20','2026-11-19','2023-11-25','F&B','MONTHLY'),('CTR2024018','C0018','2024-02-15','2029-02-14','2024-02-20','ANCHOR','QUARTERLY'),('CTR2024019','C0019','2024-01-15','2027-01-14','2024-01-20','LEASE','MONTHLY'),('CTR2024020','C0020','2023-12-05','2028-12-04','2023-12-10','ANCHOR','QUARTERLY'),('CTR2024021','C0021','2024-02-01','2027-01-31','2024-02-05','F&B','MONTHLY'),('CTR2024022','C0022','2023-11-25','2026-11-24','2023-11-30','LEASE','MONTHLY'),('CTR2024023','C0023','2024-01-20','2027-01-19','2024-01-25','LEASE','MONTHLY'),('CTR2024024','C0024','2023-12-15','2026-12-14','2023-12-20','LEASE','MONTHLY'),('CTR2024025','C0025','2024-02-05','2029-02-04','2024-02-10','ANCHOR','QUARTERLY'),('CTR2024026','C0026','2023-11-10','2028-11-09','2023-11-15','ANCHOR','QUARTERLY'),('CTR2024027','C0027','2024-01-25','2029-01-24','2024-01-30','ANCHOR','QUARTERLY'),('CTR2024028','C0028','2023-12-01','2026-11-30','2023-12-05','F&B','MONTHLY'),('CTR2024029','C0029','2024-02-10','2027-02-09','2024-02-15','LEASE','MONTHLY'),('CTR2024030','C0030','2023-11-30','2026-11-29','2023-12-05','LEASE','MONTHLY'),('CTR2024031','C0031','2024-02-10','2027-02-09','2024-02-15','SERVICE','MONTHLY'),('CTR2024032','C0032','2023-11-30','2026-11-29','2023-12-05','SERVICE','MONTHLY');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` char(10) NOT NULL,
  `firstName` varchar(10) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `gender` varchar(3) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C000000001','Nguyễn','Văn Nam','M','1990-01-15','45 Lê Lợi, Quận Hoàn Kiếm, Hà Nội','nam.nguyen@example.com'),('C000000002','Trần','Thị Mai','F','1985-05-22','78 Cầu Giấy, Quận Cầu Giấy, Hà Nội','mai.tran@example.com'),('C000000003','Lê','Hoàng Sơn','M','1992-08-10','34 Điện Biên Phủ, Quận Ba Đình, Hà Nội','son.le@example.com'),('C000000004','Phạm','Minh Hương','F','1995-11-05','56 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','huong.pham@example.com'),('C000000005','Vũ','Quang Hải','M','1980-12-18','90 Lý Nam Đế, Quận Hoàn Kiếm, Hà Nội','hai.vu@example.com'),('C000000006','Đỗ','Ngọc Lan','F','1998-03-25','12 Nguyễn Thái Học, Quận Ba Đình, Hà Nội','lan.do@example.com'),('C000000007','Bùi','Thế Anh','M','2000-06-14','67 Xã Đàn, Quận Đống Đa, Hà Nội','anh.bui@example.com'),('C000000008','Ngô','Kim Chi','F','1997-02-22','78 Trần Hưng Đạo, Quận Hoàn Kiếm, Hà Nội','chi.ngo@example.com'),('C000000009','Lê','Minh Tuấn','M','1988-07-15','34 Phố Huế, Quận Hai Bà Trưng, Hà Nội','tuan.le@example.com'),('C000000010','Nguyễn','Quỳnh Anh','F','1996-10-12','45 Kim Mã, Quận Ba Đình, Hà Nội','anh.nguyen@example.com'),('C000000011','Lý','Thị Hoa','F','1999-05-17','78 Bà Triệu, Quận Hoàn Kiếm, Hà Nội','hoa.ly@example.com'),('C000000012','Phan','Anh Tuấn','M','1983-11-02','123 Hoàng Quốc Việt, Quận Cầu Giấy, Hà Nội','tuan.phan@example.com'),('C000000013','Hồ','Ngọc Hà','F','1994-04-18','89 Chùa Bộc, Quận Đống Đa, Hà Nội','ha.ho@example.com'),('C000000014','Đặng','Thị Hương','F','1989-06-22','45 Tây Sơn, Quận Đống Đa, Hà Nội','huong.dang@example.com'),('C000000015','Vũ','Thanh Tùng','M','1984-01-09','78 Nguyễn Văn Cừ, Quận Long Biên, Hà Nội','tung.vu@example.com'),('C000000016','Lê','Ngọc Hùng','M','1981-02-14','34 Hàng Bông, Quận Hoàn Kiếm, Hà Nội','hung.le@example.com'),('C000000017','Đỗ','Thái Dương','F','1999-08-24','23 Nguyễn Khuyến, Quận Đống Đa, Hà Nội','duong.do@example.com'),('C000000018','Trần','Mạnh Cường','M','1983-03-03','56 Hàng Gai, Quận Hoàn Kiếm, Hà Nội','cuong.tran@example.com'),('C000000019','Nguyễn','Kim Oanh','F','1990-01-09','34 Nguyễn Du, Quận Hai Bà Trưng, Hà Nội','oanh.nguyen@example.com'),('C000000020','Lê','Đức Minh','M','1986-09-11','78 Hàng Đào, Quận Hoàn Kiếm, Hà Nội','minh.le@example.com'),('C000000021','Trịnh','Thị Thảo','F','1996-10-30','123 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','thao.trinh@example.com'),('C000000022','Nguyễn','Cẩm Tú','F','1991-05-20','45 Cầu Giấy, Quận Cầu Giấy, Hà Nội','tu.nguyen@example.com'),('C000000023','Hoàng','Nhật Tân','M','1990-12-15','89 Nguyễn Văn Huyên, Quận Cầu Giấy, Hà Nội','tan.hoang@example.com'),('C000000024','Phan','Quang Vinh','M','1993-04-27','56 Hoàng Hoa Thám, Quận Tây Hồ, Hà Nội','vinh.phan@example.com'),('C000000025','Bùi','Thảo Vy','F','1982-07-01','23 Lê Duẩn, Quận Hai Bà Trưng, Hà Nội','vy.bui@example.com'),('C000000026','Vũ','Ngọc Thảo','F','1995-11-18','45 Hàng Cót, Quận Hoàn Kiếm, Hà Nội','thao.vu@example.com'),('C000000027','Hồ','Trọng Nhân','M','1988-03-05','78 Ngô Quyền, Quận Hoàn Kiếm, Hà Nội','nhan.ho@example.com'),('C000000028','Trương','Thành Công','M','1985-06-14','34 Trần Phú, Quận Hà Đông, Hà Nội','cong.truong@example.com'),('C000000029','Lương','Lê Minh','M','1991-01-30','89 Nguyễn Chí Thanh, Quận Đống Đa, Hà Nội','minh.luong@example.com'),('C000000030','Nguyễn','Vân Anh','F','1984-10-10','56 Hàng Cót, Quận Hoàn Kiếm, Hà Nội','anh.nguyen@example.com'),('C000000031','Nguyễn','Văn Phúc','M','1992-03-15','78 Nguyễn Hữu Thọ, Quận Hoàng Mai, Hà Nội','phuc.nguyen@example.com'),('C000000032','Trần','Thị Thanh','F','1989-08-12','45 Phạm Hùng, Quận Nam Từ Liêm, Hà Nội','thanh.tran@example.com'),('C000000033','Lê','Minh Hải','M','1994-06-10','34 Vũ Trọng Phụng, Quận Thanh Xuân, Hà Nội','hai.le@example.com'),('C000000034','Phạm','Mai Hoa','F','1997-09-19','123 Trung Kính, Quận Cầu Giấy, Hà Nội','hoa.pham@example.com'),('C000000035','Vũ','Tiến Dũng','M','1991-11-05','45 Đại Cồ Việt, Quận Hai Bà Trưng, Hà Nội','dung.vu@example.com'),('C000000036','Đỗ','Ngọc Mai','F','1990-05-22','56 Lạc Long Quân, Quận Tây Hồ, Hà Nội','mai.do@example.com'),('C000000037','Bùi','Quốc Anh','M','1983-02-14','78 Hồ Tùng Mậu, Quận Nam Từ Liêm, Hà Nội','anh.bui@example.com'),('C000000038','Ngô','Thị Hằng','F','1996-07-25','23 Trần Bình, Quận Cầu Giấy, Hà Nội','hang.ngo@example.com'),('C000000039','Nguyễn','Huy Hoàng','M','1987-10-07','34 Võ Chí Công, Quận Tây Hồ, Hà Nội','hoang.nguyen@example.com'),('C000000040','Lý','Thị Ngọc','F','1995-04-09','67 Kim Đồng, Quận Hoàng Mai, Hà Nội','ngoc.ly@example.com'),('C000000041','Trần','Mỹ Linh','F','1994-08-20','89 Văn Cao, Quận Ba Đình, Hà Nội','linh.tran@example.com'),('C000000042','Phan','Tiến Đạt','M','1993-11-02','45 Đội Cấn, Quận Ba Đình, Hà Nội','dat.phan@example.com'),('C000000043','Vũ','Thanh Hằng','F','1996-12-19','78 Yên Phụ, Quận Tây Hồ, Hà Nội','hang.vu@example.com'),('C000000044','Ngô','Hữu Minh','M','1988-02-10','123 Hoàng Hoa Thám, Quận Ba Đình, Hà Nội','minh.ngo@example.com'),('C000000045','Trịnh','Cẩm Nhung','F','1992-05-03','34 Định Công, Quận Hoàng Mai, Hà Nội','nhung.trinh@example.com'),('C000000046','Phạm','Việt Hùng','M','1984-01-12','67 Thụy Khuê, Quận Tây Hồ, Hà Nội','hung.pham@example.com'),('C000000047','Nguyễn','Thái Hòa','F','1990-09-22','78 Hoàng Quốc Việt, Quận Cầu Giấy, Hà Nội','hoa.nguyen@example.com'),('C000000048','Lê','Ngọc Tú','F','1998-07-15','23 Thanh Xuân Bắc, Quận Thanh Xuân, Hà Nội','tu.le@example.com'),('C000000049','Hồ','Mạnh Quân','M','1989-03-08','123 Trần Duy Hưng, Quận Cầu Giấy, Hà Nội','quan.ho@example.com'),('C000000050','Đỗ','Thanh Hương','F','1994-06-30','45 Láng Hạ, Quận Đống Đa, Hà Nội','huong.do@example.com'),('C000000051','Nguyễn','Thanh Phong','M','1993-01-15','12 Nguyễn Khuyến, Quận Đống Đa, Hà Nội','phong.nguyen@example.com'),('C000000052','Trần','Mỹ Linh','F','1995-07-12','34 Nguyễn Văn Huyên, Quận Cầu Giấy, Hà Nội','linh.tran@example.com'),('C000000053','Phạm','Quang Huy','M','1992-05-23','45 Hoàng Hoa Thám, Quận Ba Đình, Hà Nội','huy.pham@example.com'),('C000000054','Lê','Thị Mai','F','1997-03-30','78 Bạch Mai, Quận Hai Bà Trưng, Hà Nội','mai.le@example.com'),('C000000055','Đỗ','Hoàng Long','M','1990-08-18','89 Kim Mã, Quận Ba Đình, Hà Nội','long.do@example.com'),('C000000056','Bùi','Ngọc Lan','F','1991-12-05','56 Tây Sơn, Quận Đống Đa, Hà Nội','lan.bui@example.com'),('C000000057','Ngô','Minh Dũng','M','1994-06-21','45 Đặng Thai Mai, Quận Tây Hồ, Hà Nội','dung.ngo@example.com'),('C000000058','Phan','Thị Hạnh','F','1996-09-14','23 Phố Huế, Quận Hai Bà Trưng, Hà Nội','hanh.phan@example.com'),('C000000059','Vũ','Hữu Lộc','M','1992-04-25','78 Nguyễn Thị Định, Quận Cầu Giấy, Hà Nội','loc.vu@example.com'),('C000000060','Hồ','Mai Hương','F','1998-01-12','34 Đội Cấn, Quận Ba Đình, Hà Nội','huong.ho@example.com'),('C000000061','Trịnh','Thanh Tú','F','1995-10-19','67 Phạm Văn Đồng, Quận Bắc Từ Liêm, Hà Nội','tu.trinh@example.com'),('C000000062','Nguyễn','Hữu Tài','M','1988-06-15','56 Trung Kính, Quận Cầu Giấy, Hà Nội','tai.nguyen@example.com'),('C000000063','Lê','Văn Đức','M','1994-11-11','78 Cầu Giấy, Quận Cầu Giấy, Hà Nội','duc.le@example.com'),('C000000064','Phạm','Ngọc Yến','F','1991-08-09','34 Phan Đình Phùng, Quận Ba Đình, Hà Nội','yen.pham@example.com'),('C000000065','Bùi','Thanh Bình','M','1989-12-22','45 Láng Hạ, Quận Đống Đa, Hà Nội','binh.bui@example.com'),('C000000066','Trần','Thị Dung','F','1993-02-14','89 Hàng Gai, Quận Hoàn Kiếm, Hà Nội','dung.tran@example.com'),('C000000067','Vũ','Minh Khang','M','1990-05-17','12 Hàng Bông, Quận Hoàn Kiếm, Hà Nội','khang.vu@example.com'),('C000000068','Đỗ','Thu Hà','F','1995-04-08','45 Tôn Đức Thắng, Quận Đống Đa, Hà Nội','ha.do@example.com'),('C000000069','Ngô','Tiến Lợi','M','1988-09-30','78 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','loi.ngo@example.com'),('C000000070','Phan','Ngọc Bích','F','1992-01-19','56 Nguyễn Văn Cừ, Quận Long Biên, Hà Nội','bich.phan@example.com'),('C000000071','Hồ','Văn Phước','M','1993-06-22','23 Đào Tấn, Quận Ba Đình, Hà Nội','phuoc.ho@example.com'),('C000000072','Nguyễn','Cẩm Ly','F','1996-11-25','34 Ngọc Khánh, Quận Ba Đình, Hà Nội','ly.nguyen@example.com'),('C000000073','Trần','Quang Nhật','M','1994-03-17','12 Nguyễn Du, Quận Hai Bà Trưng, Hà Nội','nhat.tran@example.com'),('C000000074','Lê','Thị Phượng','F','1998-12-01','45 Lê Duẩn, Quận Hai Bà Trưng, Hà Nội','phuong.le@example.com'),('C000000075','Phạm','Hữu Nghĩa','M','1991-07-08','89 Nguyễn Chí Thanh, Quận Đống Đa, Hà Nội','nghia.pham@example.com'),('C000000076','Đặng','Thị Ngọc','F','1997-09-05','78 Ngô Quyền, Quận Hoàn Kiếm, Hà Nội','ngoc.dang@example.com'),('C000000077','Bùi','Đức Anh','M','1993-02-25','34 Tây Sơn, Quận Đống Đa, Hà Nội','anh.bui@example.com'),('C000000078','Vũ','Thị Hồng','F','1995-06-30','56 Hàng Bài, Quận Hoàn Kiếm, Hà Nội','hong.vu@example.com'),('C000000079','Nguyễn','Quang Minh','M','1992-08-19','12 Trần Duy Hưng, Quận Cầu Giấy, Hà Nội','minh.nguyen@example.com'),('C000000080','Trần','Thị Thanh Huyền','F','1990-04-05','23 Bà Triệu, Quận Hai Bà Trưng, Hà Nội','huyen.tran@example.com'),('C000000081','Phạm','Đức Hạnh','M','1993-01-01','67 Hàng Đường, Quận Hoàn Kiếm, Hà Nội','hanh.pham@example.com'),('C000000082','Lê','Ngọc Hương','F','1996-02-28','45 Cầu Giấy, Quận Cầu Giấy, Hà Nội','huong.le@example.com'),('C000000083','Đỗ','Thanh Phúc','M','1994-07-11','89 Nguyễn Khuyến, Quận Đống Đa, Hà Nội','phuc.do@example.com'),('C000000084','Ngô','Thị Hương Giang','F','1998-10-25','34 Điện Biên Phủ, Quận Ba Đình, Hà Nội','giang.ngo@example.com'),('C000000085','Phan','Minh Triết','M','1991-05-01','56 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','triet.phan@example.com'),('C000000086','Hồ','Thị Nguyệt','F','1995-08-18','78 Ngọc Hồi, Quận Thanh Trì, Hà Nội','nguyet.ho@example.com'),('C000000087','Trịnh','Đình Hùng','M','1992-09-09','12 Phạm Hùng, Quận Nam Từ Liêm, Hà Nội','hung.trinh@example.com'),('C000000088','Nguyễn','Phương Thảo','F','1997-03-22','34 Vạn Phúc, Quận Ba Đình, Hà Nội','thao.nguyen@example.com'),('C000000089','Trần','Đức Vinh','M','1993-12-19','45 Chùa Bộc, Quận Đống Đa, Hà Nội','vinh.tran@example.com'),('C000000090','Lê','Thị Ánh Tuyết','F','1996-01-10','89 Đại Cồ Việt, Quận Hai Bà Trưng, Hà Nội','tuyet.le@example.com'),('C000000091','Phạm','Minh Hiếu','M','1991-04-15','56 Lý Nam Đế, Quận Hoàn Kiếm, Hà Nội','hieu.pham@example.com'),('C000000092','Đặng','Văn Thành','M','1994-07-30','78 Trung Kính, Quận Cầu Giấy, Hà Nội','thanh.dang@example.com'),('C000000093','Bùi','Ngọc Ánh','F','1995-02-08','34 Ngọc Hà, Quận Ba Đình, Hà Nội','anh.bui@example.com'),('C000000094','Vũ','Thanh Tâm','F','1997-11-02','45 Phố Huế, Quận Hai Bà Trưng, Hà Nội','tam.vu@example.com'),('C000000095','Nguyễn','Hoàng Phúc','M','1993-09-14','89 Phan Bội Châu, Quận Hoàn Kiếm, Hà Nội','phuc.nguyen@example.com'),('C000000096','Trần','Ngọc Hiền','F','1996-10-18','23 Hàng Mành, Quận Hoàn Kiếm, Hà Nội','hien.tran@example.com'),('C000000097','Phạm','Thanh Tùng','M','1992-03-11','56 Ngọc Lâm, Quận Long Biên, Hà Nội','tung.pham@example.com'),('C000000098','Đỗ','Hải Yến','F','1994-06-25','12 Hàng Đào, Quận Hoàn Kiếm, Hà Nội','yen.do@example.com'),('C000000099','Ngô','Tiến Hùng','M','1991-07-20','45 Kim Mã, Quận Ba Đình, Hà Nội','hung.ngo@example.com'),('C000000100','Phan','Văn Lâm','M','1993-01-08','34 Trần Hưng Đạo, Quận Hoàn Kiếm, Hà Nội','lam.phan@example.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_phonenumber`
--

DROP TABLE IF EXISTS `customer_phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_phonenumber` (
  `customerID` char(10) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`customerID`,`phoneNumber`),
  CONSTRAINT `customer_phonenumber_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_phonenumber`
--

LOCK TABLES `customer_phonenumber` WRITE;
/*!40000 ALTER TABLE `customer_phonenumber` DISABLE KEYS */;
INSERT INTO `customer_phonenumber` VALUES ('C000000001','0971234567'),('C000000001','0981234567'),('C000000002','0938123456'),('C000000002','0948123456'),('C000000003','0912345678'),('C000000003','0969123456'),('C000000004','0927123456'),('C000000004','0971234567'),('C000000005','0967123456'),('C000000005','0987123456'),('C000000006','0928123456'),('C000000006','0946123456'),('C000000007','0909123456'),('C000000007','0919123456'),('C000000008','0939123456'),('C000000008','0989123456'),('C000000009','0941234567'),('C000000009','0976123456'),('C000000010','0918123456'),('C000000010','0988123456'),('C000000011','0935123456'),('C000000012','0978123456'),('C000000013','0969123456'),('C000000014','0948123456'),('C000000015','0905123456'),('C000000016','0939123456'),('C000000017','0986123456'),('C000000018','0976123456'),('C000000019','0917123456'),('C000000020','0929123456'),('C000000021','0968123456'),('C000000022','0947123456'),('C000000023','0908123456'),('C000000024','0977123456'),('C000000025','0985123456'),('C000000026','0919123456'),('C000000027','0937123456'),('C000000028','0926123456'),('C000000029','0907123456'),('C000000030','0949123456'),('C000000031','0979123456'),('C000000032','0987123456'),('C000000033','0915123456'),('C000000034','0946123456'),('C000000035','0909123456'),('C000000036','0925123456'),('C000000037','0936123456'),('C000000038','0984123456'),('C000000039','0975123456'),('C000000040','0913123456'),('C000000041','0943123456'),('C000000042','0903123456'),('C000000043','0983123456'),('C000000044','0933123456'),('C000000045','0923123456'),('C000000046','0902123456'),('C000000047','0912123456'),('C000000048','0963123456'),('C000000049','0972123456'),('C000000050','0982123456'),('C000000051','0961234567'),('C000000051','0987654321'),('C000000052','0912345678'),('C000000052','0971234567'),('C000000053','0919123456'),('C000000053','0931234567'),('C000000054','0947123456'),('C000000054','0989123456'),('C000000055','0918123456'),('C000000055','0939123456'),('C000000056','0927123456'),('C000000056','0928123456'),('C000000057','0907123456'),('C000000057','0961234567'),('C000000058','0971234567'),('C000000058','0976123456'),('C000000059','0938123456'),('C000000059','0968123456'),('C000000060','0937123456'),('C000000060','0981234567'),('C000000061','0941234567'),('C000000062','0901234567'),('C000000063','0939123456'),('C000000064','0967123456'),('C000000065','0978123456'),('C000000066','0917123456'),('C000000067','0909123456'),('C000000068','0988123456'),('C000000069','0937123456'),('C000000070','0929123456'),('C000000071','0915123456'),('C000000072','0908123456'),('C000000073','0979123456'),('C000000074','0969123456'),('C000000075','0948123456'),('C000000076','0918123456'),('C000000077','0907123456'),('C000000078','0987123456'),('C000000079','0936123456'),('C000000080','0968123456'),('C000000081','0928123456'),('C000000082','0978123456'),('C000000083','0905123456'),('C000000084','0947123456'),('C000000085','0986123456'),('C000000086','0938123456'),('C000000087','0919123456'),('C000000088','0929123456'),('C000000089','0965123456'),('C000000090','0948123456'),('C000000091','0976123456'),('C000000092','0908123456'),('C000000093','0989123456'),('C000000094','0918123456'),('C000000095','0946123456'),('C000000096','0909123456'),('C000000097','0935123456'),('C000000098','0987123456'),('C000000099','0967123456'),('C000000100','0928123456');
/*!40000 ALTER TABLE `customer_phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` char(5) NOT NULL,
  `firstName` varchar(10) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `gender` varchar(3) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E0001','Nguyễn','Văn An','1985-04-15','123 Lê Lợi, Quận Hoàn Kiếm, Hà Nội','M','an.nguyen@example.com'),('E0002','Trần','Thị Bích','1990-09-22','45 Nguyễn Huệ, Quận Hai Bà Trưng, Hà Nội','F','bich.tran@example.com'),('E0003','Lê','Hoàng Duy','1988-06-10','78 Điện Biên Phủ, Quận Ba Đình, Hà Nội','M','duy.le@example.com'),('E0004','Phạm','Minh Châu','1995-12-05','89 Lý Thái Tổ, Quận Hoàn Kiếm, Hà Nội','F','chau.pham@example.com'),('E0005','Vũ','Quang Hải','1978-02-18','56 Phan Chu Trinh, Quận Hoàng Mai, Hà Nội','M','hai.vu@example.com'),('E0006','Đỗ','Ngọc Hoa','1982-11-25','77 Phố Huế, Quận Hai Bà Trưng, Hà Nội','F','hoa.do@example.com'),('E0007','Bùi','Thế Anh','1993-03-14','123 Xã Đàn, Quận Đống Đa, Hà Nội','M','anh.bui@example.com'),('E0008','Ngô','Kim Liên','1998-07-30','45 Lý Nam Đế, Quận Hoàn Kiếm, Hà Nội','F','lien.ngo@example.com'),('E0009','Lê','Minh Tuấn','1986-01-22','89 Trần Hưng Đạo, Quận Hoàn Kiếm, Hà Nội','M','tuan.le@example.com'),('E0010','Nguyễn','Quỳnh Anh','1992-08-12','34 Kim Mã, Quận Ba Đình, Hà Nội','F','anh.nguyen@example.com'),('E0011','Lý','Thị Mai','1991-05-17','56 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','F','mai.ly@example.com'),('E0012','Phan','Anh Tuấn','1987-10-02','89 Láng Hạ, Quận Đống Đa, Hà Nội','M','tuan.phan@example.com'),('E0013','Hồ','Ngọc Lan','1994-04-08','23 Đại Cổ Việt, Quận Hai Bà Trưng, Hà Nội','F','lan.ho@example.com'),('E0014','Đặng','Bảo Hân','1989-06-22','67 Nguyễn Trường Tộ, Quận Ba Đình, Hà Nội','F','han.dang@example.com'),('E0015','Vũ','Thanh Sơn','1997-11-19','89 Bà Triệu, Quận Hoàn Kiếm, Hà Nội','M','son.vu@example.com'),('E0016','Lê','Ngọc Hùng','1984-02-14','56 Nguyễn Chí Thanh, Quận Đống Đa, Hà Nội','M','hung.le@example.com'),('E0017','Đỗ','Thái Dương','1999-08-24','23 Nguyễn Thái Học, Quận Ba Đình, Hà Nội','F','duong.do@example.com'),('E0018','Trần','Mạnh Cường','1983-03-03','12 Hàng Bài, Quận Hoàn Kiếm, Hà Nội','M','cuong.tran@example.com'),('E0019','Nguyễn','Kim Oanh','1980-01-09','21 Phan Đình Phùng, Quận Ba Đình, Hà Nội','F','oanh.nguyen@example.com'),('E0020','Lê','Đức Minh','1986-09-11','56 Vạn Bảo, Quận Ba Đình, Hà Nội','M','minh.le@example.com'),('E0021','Trịnh','Thị Bảo','1996-10-30','34 Trần Phú, Quận Hà Đông, Hà Nội','F','bao.trinh@example.com'),('E0022','Nguyễn','Cẩm Tú','1981-05-20','78 Cầu Giấy, Quận Cầu Giấy, Hà Nội','F','tu.nguyen@example.com'),('E0023','Hoàng','Nhật Tân','1990-12-15','23 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','M','tan.hoang@example.com'),('E0024','Phan','Quang Vinh','1993-04-27','78 Chùa Bộc, Quận Đống Đa, Hà Nội','M','vinh.phan@example.com'),('E0025','Bùi','Thảo Vy','1982-07-01','56 Tây Sơn, Quận Đống Đa, Hà Nội','F','vy.bui@example.com'),('E0026','Vũ','Ngọc Thảo','1995-11-18','45 Quang Trung, Quận Hoàn Kiếm, Hà Nội','F','thao.vu@example.com'),('E0027','Hồ','Trọng Nhân','1988-03-05','89 Phố Huế, Quận Hai Bà Trưng, Hà Nội','M','nhan.ho@example.com'),('E0028','Trương','Thành Công','1985-06-14','90 Láng, Quận Đống Đa, Hà Nội','M','cong.truong@example.com'),('E0029','Lương','Lê Minh','1991-01-30','56 Hoàng Hoa Thám, Quận Tây Hồ, Hà Nội','M','minh.luong@example.com'),('E0030','Nguyễn','Vân Anh','1984-10-10','34 Bùi Thị Xuân, Quận Hai Bà Trưng, Hà Nội','F','anh.nguyen@example.com'),('E0031','Nguyễn','Hồng Phúc','2000-02-15','12 Hàng Đào, Quận Hoàn Kiếm, Hà Nội','M','phuc.nguyen@example.com'),('E0032','Trần','Thảo Nguyên','2001-07-19','56 Hàng Bông, Quận Hoàn Kiếm, Hà Nội','F','nguyen.tran@example.com'),('E0033','Lê','Hữu Đạt','1999-10-30','89 Thái Hà, Quận Đống Đa, Hà Nội','M','dat.le@example.com'),('E0034','Phạm','Hà Linh','2002-01-22','34 Hàng Mã, Quận Hoàn Kiếm, Hà Nội','F','linh.pham@example.com'),('E0035','Vũ','Tiến Thành','2000-06-05','77 Láng Hạ, Quận Đống Đa, Hà Nội','M','thanh.vu@example.com'),('E0036','Đỗ','Thanh Trúc','2003-08-18','45 Tôn Đức Thắng, Quận Đống Đa, Hà Nội','F','truc.do@example.com'),('E0037','Bùi','Ngọc Minh','1999-12-01','23 Đội Cấn, Quận Ba Đình, Hà Nội','M','minh.bui@example.com'),('E0038','Ngô','Thảo Vy','2002-04-15','67 Hàng Bài, Quận Hoàn Kiếm, Hà Nội','F','vy.ngo@example.com'),('E0039','Lý','Huy Hoàng','2000-11-09','89 Phố Huế, Quận Hai Bà Trưng, Hà Nội','M','hoang.ly@example.com'),('E0040','Phan','Thu Hà','2001-02-25','123 Hàng Gai, Quận Hoàn Kiếm, Hà Nội','F','ha.phan@example.com'),('E0041','Hồ','Quốc Huy','1999-05-12','56 Ngô Quyền, Quận Hoàn Kiếm, Hà Nội','M','huy.ho@example.com'),('E0042','Đặng','Ngọc Bảo','2002-09-17','78 Lý Nam Đế, Quận Hoàn Kiếm, Hà Nội','M','bao.dang@example.com'),('E0043','Vũ','Cẩm Tú','2003-12-10','45 Hàng Cót, Quận Hoàn Kiếm, Hà Nội','F','tu.vu@example.com'),('E0044','Trịnh','Minh Anh','2001-06-14','90 Trần Hưng Đạo, Quận Hoàn Kiếm, Hà Nội','F','anh.trinh@example.com'),('E0045','Nguyễn','Hải Nam','1999-03-03','12 Cầu Giấy, Quận Cầu Giấy, Hà Nội','M','nam.nguyen@example.com'),('E0046','Lê','Thanh Tùng','2000-07-28','78 Tây Sơn, Quận Đống Đa, Hà Nội','M','tung.le@example.com'),('E0047','Bùi','Ngọc Hoa','2002-11-05','34 Hoàng Hoa Thám, Quận Tây Hồ, Hà Nội','F','hoa.bui@example.com'),('E0048','Hồ','Huyền Trang','2003-01-18','67 Nguyễn Trãi, Quận Thanh Xuân, Hà Nội','F','trang.ho@example.com'),('E0049','Nguyễn','Đức Bình','2001-09-22','89 Đinh Tiên Hoàng, Quận Hoàn Kiếm, Hà Nội','M','binh.nguyen@example.com'),('E0050','Phạm','Khánh Linh','2000-03-30','123 Nguyễn Khuyến, Quận Đống Đa, Hà Nội','F','linh.pham@example.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_phonenumber`
--

DROP TABLE IF EXISTS `employee_phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_phonenumber` (
  `employeeID` char(5) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`employeeID`,`phoneNumber`),
  CONSTRAINT `employee_phonenumber_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_phonenumber`
--

LOCK TABLES `employee_phonenumber` WRITE;
/*!40000 ALTER TABLE `employee_phonenumber` DISABLE KEYS */;
INSERT INTO `employee_phonenumber` VALUES ('E0001','0901234567'),('E0001','0911234567'),('E0002','0987654321'),('E0003','0931122334'),('E0004','0945566778'),('E0005','0903344556'),('E0006','0978899001'),('E0007','0967788990'),('E0008','0912233445'),('E0009','0934455667'),('E0010','0946677889'),('E0011','0988997766'),('E0012','0971122334'),('E0013','0919988776'),('E0014','0905566778'),('E0015','0923344556'),('E0016','0968899002'),('E0017','0937788991'),('E0018','0942233446'),('E0019','0904455668'),('E0020','0916677880'),('E0021','0988996655'),('E0022','0931122004'),('E0023','0949988765'),('E0024','0925566778'),('E0025','0973344559'),('E0026','0968899003'),('E0027','0907788992'),('E0028','0912233447'),('E0029','0984455669'),('E0030','0976677881'),('E0031','0938995544'),('E0032','0941122335'),('E0033','0867772881'),('E0033','0909988777'),('E0034','0915566779'),('E0035','0923344560'),('E0036','0968899004'),('E0037','0977788993'),('E0038','0932233448'),('E0039','0904455669'),('E0040','0916677882'),('E0041','0988996656'),('E0042','0931122005'),('E0043','0949988766'),('E0044','0925566780'),('E0045','0973344561'),('E0046','0968899005'),('E0047','0907788994'),('E0048','0912233449'),('E0049','0984455670'),('E0050','0976677883');
/*!40000 ALTER TABLE `employee_phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fulltimeemployee`
--

DROP TABLE IF EXISTS `fulltimeemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fulltimeemployee` (
  `employeeID_F` char(5) NOT NULL,
  `benefitsPackage` varchar(255) DEFAULT NULL,
  `annualLeave` int DEFAULT NULL,
  PRIMARY KEY (`employeeID_F`),
  CONSTRAINT `fulltimeemployee_ibfk_1` FOREIGN KEY (`employeeID_F`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fulltimeemployee`
--

LOCK TABLES `fulltimeemployee` WRITE;
/*!40000 ALTER TABLE `fulltimeemployee` DISABLE KEYS */;
INSERT INTO `fulltimeemployee` VALUES ('E0001','Health Insurance, Retirement Plan, Paid Sick Leave',20),('E0002','Health Insurance, Life Insurance, Paid Vacation',25),('E0003','Health Insurance, Retirement Plan, Paid Sick Leave',22),('E0004','Health Insurance, Life Insurance, Paid Vacation',18),('E0005','Dental Insurance, Paid Leave, Retirement Plan',30),('E0006','Health Insurance, Paid Sick Leave, Disability Insurance',15),('E0007','Health Insurance, Paid Leave, Annual Bonus',12),('E0008','Retirement Plan, Paid Vacation, Paid Sick Leave',20),('E0009','Health Insurance, Wellness Program, Paid Leave',25),('E0010','Life Insurance, Paid Sick Leave, Flexible Hours',28),('E0011','Health Insurance, Paid Leave, Annual Bonus',20),('E0012','Dental Insurance, Paid Vacation, Paid Sick Leave',18),('E0013','Health Insurance, Retirement Plan, Paid Sick Leave',24),('E0014','Life Insurance, Paid Sick Leave, Paid Vacation',20),('E0015','Health Insurance, Wellness Program, Paid Sick Leave',30),('E0016','Paid Sick Leave, Paid Leave, Health Insurance',18),('E0017','Health Insurance, Retirement Plan, Paid Leave',22),('E0018','Health Insurance, Paid Sick Leave, Paid Vacation',26),('E0019','Life Insurance, Retirement Plan, Paid Sick Leave',20),('E0020','Health Insurance, Paid Leave, Retirement Plan',24),('E0021','Paid Vacation, Paid Sick Leave, Health Insurance',20),('E0022','Health Insurance, Wellness Program, Retirement Plan',28),('E0023','Health Insurance, Paid Sick Leave, Paid Vacation',15),('E0024','Dental Insurance, Paid Sick Leave, Retirement Plan',18),('E0025','Health Insurance, Paid Leave, Annual Bonus',25),('E0026','Life Insurance, Paid Sick Leave, Paid Vacation',22),('E0027','Health Insurance, Wellness Program, Paid Leave',30),('E0028','Health Insurance, Paid Sick Leave, Retirement Plan',20),('E0029','Paid Vacation, Paid Sick Leave, Life Insurance',18),('E0030','Health Insurance, Paid Leave, Flexible Hours',20),('E0031','Health Insurance, Paid Sick Leave, Paid Leave',28),('E0032','Retirement Plan, Paid Vacation, Life Insurance',24),('E0033','Health Insurance, Paid Sick Leave, Wellness Program',22),('E0034','Life Insurance, Paid Vacation, Retirement Plan',18),('E0035','Dental Insurance, Paid Sick Leave, Paid Leave',20),('E0036','Health Insurance, Flexible Hours, Paid Sick Leave',15),('E0037','Paid Sick Leave, Paid Vacation, Retirement Plan',25),('E0038','Health Insurance, Paid Leave, Life Insurance',30),('E0039','Dental Insurance, Paid Sick Leave, Wellness Program',22),('E0040','Retirement Plan, Paid Sick Leave, Paid Vacation',28);
/*!40000 ALTER TABLE `fulltimeemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoiceID` char(10) NOT NULL,
  `contractID` char(10) DEFAULT NULL,
  `dateOfIssue` date DEFAULT NULL,
  `issuedTo` varchar(255) DEFAULT NULL,
  `issuedBy` varchar(255) DEFAULT NULL,
  `totalAmount` int DEFAULT NULL,
  PRIMARY KEY (`invoiceID`),
  KEY `contractID` (`contractID`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`contractID`) REFERENCES `contract` (`contractID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('INV0000001','CTR2024001','2023-12-16','My Shopping Center','Highlands Coffee Vietnam',2500),('INV0000002','CTR2024002','2024-01-01','My Shopping Center','Phuc Long Heritage JSC',1500),('INV0000003','CTR2024002','2024-01-01','My Shopping Center','Phuc Long Heritage JSC',1500),('INV0000004','CTR2024003','2023-11-30','My Shopping Center','Uniqlo Vietnam',6000),('INV0000005','CTR2024004','2023-10-15','My Shopping Center','CGV Vietnam',10000),('INV0000006','CTR2024006','2024-01-10','My Shopping Center','The Face Shop Vietnam',1000),('INV0000007','CTR2024007','2023-12-01','My Shopping Center','Pizza Hut Vietnam',1200),('INV0000008','CTR2024008','2024-01-15','My Shopping Center','Jollibee Vietnam',1500),('INV0000009','CTR2024009','2023-11-01','My Shopping Center','Nike Vietnam',3000),('INV0000010','CTR2024010','2024-02-01','My Shopping Center','Adidas Vietnam',2500),('INV0000011','CTR2024011','2024-01-20','My Shopping Center','Tran Anh Mobile',1500),('INV0000012','CTR2024012','2023-12-10','My Shopping Center','TheFaceShop Vietnam',1000),('INV0000013','CTR2024013','2024-01-05','My Shopping Center','KFC Vietnam',1900),('INV0000014','CTR2024014','2023-11-15','My Shopping Center','Vascara',1500),('INV0000015','CTR2024015','2024-02-10','My Shopping Center','Lotte Cinema',10000),('INV0000016','CTR2024016','2023-12-20','My Shopping Center','Fahasa Book Store',3500),('INV0000017','CTR2024017','2024-01-10','My Shopping Center','Starbucks Vietnam',2500),('INV0000018','CTR2024018','2024-01-15','My Shopping Center','Puma Vietnam',4000),('INV0000019','CTR2024019','2024-02-15','My Shopping Center','Miniso Vietnam',2800),('INV0000020','CTR2024020','2024-01-15','My Shopping Center','The Gioi Di Dong Store',4500),('INV0000021','CTR2024021','2023-12-05','My Shopping Center','Paris Baguette',2500),('INV0000022','CTR2024022','2024-02-01','My Shopping Center','Mumuso Vietnam',2500),('INV0000023','CTR2024023','2023-11-25','My Shopping Center','Innisfree Vietnam',2500),('INV0000024','CTR2024024','2024-01-20','My Shopping Center','Guardian Vietnam',3000),('INV0000025','CTR2024025','2023-12-15','My Shopping Center','Watsons Vietnam',2000),('INV0000026','CTR2024026','2024-02-05','My Shopping Center','H&M Vietnam',7000),('INV0000027','CTR2024027','2023-11-10','My Shopping Center','Zara Vietnam',7500),('INV0000028','CTR2024028','2024-01-25','My Shopping Center','Lotteria Vietnam',2500),('INV0000029','CTR2024029','2024-03-10','My Shopping Center','Lock&Lock Vietnam',2500),('INV0000030','CTR2024029','2024-02-10','My Shopping Center','Lock&Lock Vietnam',2500),('INV0000031','CTR2024030','2023-11-30','My Shopping Center','Xiaomi Store Vietnam',2000),('INV0000032','CTR2024030','2023-12-30','My Shopping Center','Xiaomi Store Vietnam',2000),('INV0000033','CTR2024031','2024-02-10','Cleaning Vietnam','My Shopping Center',4000),('INV0000034','CTR2024031','2024-03-10','Cleaning Vietnam','My Shopping Center',4000),('INV0000035','CTR2024032','2024-01-01','Delivery Vietnam','My Shopping Center',3000),('INV0000036','CTR2024032','2024-02-01','Delivery Vietnam','My Shopping Center',3000),('INV0000037','CTR2024005','2024-01-20','My Shopping Center','Nguyen Kim',7000);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `jobID` char(5) NOT NULL,
  `jobTitle` varchar(20) DEFAULT NULL,
  `jobType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES ('J001','Security Guard','part-time'),('J002','Janitor','part-time'),('J003','Manager','full-time'),('J004','Accountant','full-time'),('J005','Office employee','full-time'),('J006','Marketing employee','full-time'),('J007','IT employee','full-time'),('J008','Shipper','part-time'),('J009','Shipper','full-time'),('J010','Center care employee','part-time'),('J011','Center care employee','full-time');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `customerID` char(10) NOT NULL,
  `membershipNumber` char(10) NOT NULL,
  `dateOfIssue` date DEFAULT NULL,
  `expiredDate` date DEFAULT NULL,
  `totalPoints` int DEFAULT NULL,
  `membershipLevel` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customerID`,`membershipNumber`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES ('C000000001','M000000001','2022-05-01','2023-05-01',150,'Silver'),('C000000002','M000000002','2023-01-15','2024-01-15',200,'Gold'),('C000000003','M000000003','2021-07-20','2022-07-20',100,'Bronze'),('C000000004','M000000004','2022-03-12','2023-03-12',250,'Gold'),('C000000005','M000000005','2023-09-01','2024-09-01',120,'Silver'),('C000000006','M000000006','2022-11-11','2023-11-11',180,'Silver'),('C000000007','M000000007','2021-02-25','2022-02-25',50,'Bronze'),('C000000008','M000000008','2023-05-05','2024-05-05',220,'Gold'),('C000000009','M000000009','2022-08-15','2023-08-15',90,'Bronze'),('C000000010','M000000010','2023-03-01','2024-03-01',160,'Silver'),('C000000011','M000000011','2022-07-30','2023-07-30',210,'Gold'),('C000000012','M000000012','2023-01-05','2024-01-05',130,'Silver'),('C000000013','M000000013','2022-10-10','2023-10-10',250,'Gold'),('C000000014','M000000014','2023-06-25','2024-06-25',95,'Bronze'),('C000000015','M000000015','2023-08-01','2024-08-01',200,'Gold'),('C000000016','M000000016','2022-12-19','2023-12-19',110,'Silver'),('C000000017','M000000017','2023-04-30','2024-04-30',180,'Silver'),('C000000018','M000000018','2022-05-10','2023-05-10',160,'Silver'),('C000000019','M000000019','2023-02-15','2024-02-15',240,'Gold'),('C000000020','M000000020','2021-11-03','2022-11-03',60,'Bronze'),('C000000021','M000000021','2023-07-01','2024-07-01',170,'Silver'),('C000000022','M000000022','2023-04-25','2024-04-25',100,'Bronze'),('C000000023','M000000023','2022-09-10','2023-09-10',180,'Silver'),('C000000024','M000000024','2023-11-15','2024-11-15',150,'Silver'),('C000000025','M000000025','2022-12-22','2023-12-22',200,'Gold'),('C000000026','M000000026','2021-10-11','2022-10-11',80,'Bronze'),('C000000027','M000000027','2023-05-17','2024-05-17',230,'Gold'),('C000000028','M000000028','2023-06-06','2024-06-06',220,'Gold'),('C000000029','M000000029','2022-04-18','2023-04-18',120,'Silver'),('C000000030','M000000030','2023-10-30','2024-10-30',250,'Gold'),('C000000031','M000000031','2022-02-20','2023-02-20',140,'Silver'),('C000000032','M000000032','2022-01-12','2023-01-12',50,'Bronze'),('C000000033','M000000033','2023-07-05','2024-07-05',180,'Silver'),('C000000034','M000000034','2023-08-25','2024-08-25',100,'Bronze'),('C000000035','M000000035','2022-06-30','2023-06-30',210,'Gold'),('C000000036','M000000036','2023-03-20','2024-03-20',180,'Silver'),('C000000037','M000000037','2022-08-01','2023-08-01',90,'Bronze'),('C000000038','M000000038','2023-02-05','2024-02-05',150,'Silver'),('C000000039','M000000039','2023-09-30','2024-09-30',170,'Silver'),('C000000040','M000000040','2022-07-05','2023-07-05',130,'Silver'),('C000000041','M000000041','2023-05-23','2024-05-23',100,'Bronze'),('C000000042','M000000042','2023-01-18','2024-01-18',180,'Silver'),('C000000043','M000000043','2023-06-12','2024-06-12',230,'Gold'),('C000000044','M000000044','2022-11-25','2023-11-25',220,'Gold'),('C000000045','M000000045','2023-04-10','2024-04-10',110,'Silver'),('C000000046','M000000046','2023-01-30','2024-01-30',200,'Gold'),('C000000047','M000000047','2022-10-25','2023-10-25',150,'Silver'),('C000000048','M000000048','2023-07-15','2024-07-15',120,'Silver'),('C000000049','M000000049','2022-03-15','2023-03-15',170,'Silver'),('C000000050','M000000050','2022-05-05','2023-05-05',80,'Bronze'),('C000000051','M000000051','2023-02-01','2024-02-01',110,'Silver'),('C000000052','M000000052','2023-07-10','2024-07-10',120,'Silver'),('C000000053','M000000053','2023-01-01','2024-01-01',250,'Gold'),('C000000054','M000000054','2022-05-15','2023-05-15',200,'Gold'),('C000000055','M000000055','2023-04-10','2024-04-10',95,'Bronze'),('C000000056','M000000056','2023-03-05','2024-03-05',180,'Silver'),('C000000057','M000000057','2022-08-20','2023-08-20',60,'Bronze'),('C000000058','M000000058','2023-07-15','2024-07-15',220,'Gold'),('C000000059','M000000059','2023-01-10','2024-01-10',150,'Silver'),('C000000060','M000000060','2023-06-12','2024-06-12',250,'Gold'),('C000000061','M000000061','2023-03-18','2024-03-18',100,'Silver'),('C000000062','M000000062','2022-07-25','2023-07-25',120,'Silver'),('C000000063','M000000063','2023-04-30','2024-04-30',200,'Gold'),('C000000064','M000000064','2022-11-01','2023-11-01',110,'Silver'),('C000000065','M000000065','2023-05-15','2024-05-15',180,'Silver'),('C000000066','M000000066','2022-09-30','2023-09-30',240,'Gold'),('C000000067','M000000067','2023-02-25','2024-02-25',220,'Gold'),('C000000068','M000000068','2023-06-20','2024-06-20',80,'Bronze'),('C000000069','M000000069','2023-05-01','2024-05-01',130,'Silver'),('C000000070','M000000070','2023-07-01','2024-07-01',160,'Silver'),('C000000071','M000000071','2023-03-25','2024-03-25',90,'Bronze'),('C000000072','M000000072','2022-06-01','2023-06-01',50,'Bronze'),('C000000073','M000000073','2023-04-05','2024-04-05',150,'Silver'),('C000000074','M000000074','2022-12-10','2023-12-10',130,'Silver'),('C000000075','M000000075','2023-01-18','2024-01-18',210,'Gold'),('C000000076','M000000076','2022-07-01','2023-07-01',180,'Silver'),('C000000077','M000000077','2023-05-25','2024-05-25',250,'Gold'),('C000000078','M000000078','2022-09-05','2023-09-05',220,'Gold'),('C000000079','M000000079','2023-02-15','2024-02-15',170,'Silver'),('C000000080','M000000080','2023-03-28','2024-03-28',100,'Silver'),('C000000081','M000000081','2023-04-01','2024-04-01',90,'Bronze'),('C000000082','M000000082','2022-10-11','2023-10-11',60,'Bronze'),('C000000083','M000000083','2023-08-15','2024-08-15',150,'Silver'),('C000000084','M000000084','2023-02-20','2024-02-20',80,'Bronze'),('C000000085','M000000085','2023-01-08','2024-01-08',230,'Gold'),('C000000086','M000000086','2022-12-15','2023-12-15',250,'Gold'),('C000000087','M000000087','2023-03-10','2024-03-10',120,'Silver'),('C000000088','M000000088','2023-06-05','2024-06-05',200,'Gold'),('C000000089','M000000089','2022-11-30','2023-11-30',210,'Gold'),('C000000090','M000000090','2023-01-22','2024-01-22',130,'Silver'),('C000000091','M000000091','2023-08-01','2024-08-01',220,'Gold'),('C000000092','M000000092','2022-09-20','2023-09-20',240,'Gold'),('C000000093','M000000093','2023-02-01','2024-02-01',250,'Gold'),('C000000094','M000000094','2022-08-05','2023-08-05',160,'Silver'),('C000000095','M000000095','2023-05-30','2024-05-30',200,'Gold'),('C000000096','M000000096','2023-01-14','2024-01-14',170,'Silver'),('C000000097','M000000097','2023-06-17','2024-06-17',130,'Silver'),('C000000098','M000000098','2022-04-11','2023-04-11',90,'Bronze'),('C000000099','M000000099','2023-07-01','2024-07-01',180,'Silver'),('C000000100','M000000100','2023-03-30','2024-03-30',50,'Bronze');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_privilegepackage`
--

DROP TABLE IF EXISTS `membership_privilegepackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_privilegepackage` (
  `customerID` char(10) NOT NULL,
  `membershipNumber` char(10) NOT NULL,
  `privilegePackage` varchar(50) NOT NULL,
  PRIMARY KEY (`customerID`,`membershipNumber`,`privilegePackage`),
  CONSTRAINT `membership_privilegepackage_ibfk_1` FOREIGN KEY (`customerID`, `membershipNumber`) REFERENCES `membership` (`customerID`, `membershipNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_privilegepackage`
--

LOCK TABLES `membership_privilegepackage` WRITE;
/*!40000 ALTER TABLE `membership_privilegepackage` DISABLE KEYS */;
INSERT INTO `membership_privilegepackage` VALUES ('C000000001','M000000001','Basic Reward Points'),('C000000001','M000000001','Exclusive Discounts'),('C000000001','M000000001','Free Shipping'),('C000000001','M000000001','Priority Support'),('C000000002','M000000002','Basic Reward Points'),('C000000002','M000000002','Exclusive Discounts'),('C000000002','M000000002','Free Shipping'),('C000000002','M000000002','Premium Support'),('C000000002','M000000002','Priority Support'),('C000000002','M000000002','VIP Access'),('C000000003','M000000003','Basic Reward Points'),('C000000004','M000000004','Basic Reward Points'),('C000000004','M000000004','Exclusive Discounts'),('C000000004','M000000004','Free Shipping'),('C000000004','M000000004','Premium Support'),('C000000004','M000000004','Priority Support'),('C000000004','M000000004','VIP Access'),('C000000005','M000000005','Basic Reward Points'),('C000000005','M000000005','Exclusive Discounts'),('C000000005','M000000005','Free Shipping'),('C000000005','M000000005','Priority Support'),('C000000006','M000000006','Basic Reward Points'),('C000000006','M000000006','Exclusive Discounts'),('C000000006','M000000006','Free Shipping'),('C000000006','M000000006','Priority Support'),('C000000007','M000000007','Basic Reward Points'),('C000000008','M000000008','Basic Reward Points'),('C000000008','M000000008','Exclusive Discounts'),('C000000008','M000000008','Free Shipping'),('C000000008','M000000008','Premium Support'),('C000000008','M000000008','Priority Support'),('C000000008','M000000008','VIP Access'),('C000000009','M000000009','Basic Reward Points'),('C000000010','M000000010','Basic Reward Points'),('C000000010','M000000010','Exclusive Discounts'),('C000000010','M000000010','Free Shipping'),('C000000010','M000000010','Priority Support'),('C000000011','M000000011','Basic Reward Points'),('C000000011','M000000011','Exclusive Discounts'),('C000000011','M000000011','Free Shipping'),('C000000011','M000000011','Premium Support'),('C000000011','M000000011','Priority Support'),('C000000011','M000000011','VIP Access'),('C000000012','M000000012','Basic Reward Points'),('C000000012','M000000012','Exclusive Discounts'),('C000000012','M000000012','Free Shipping'),('C000000012','M000000012','Priority Support'),('C000000013','M000000013','Basic Reward Points'),('C000000013','M000000013','Exclusive Discounts'),('C000000013','M000000013','Free Shipping'),('C000000013','M000000013','Premium Support'),('C000000013','M000000013','Priority Support'),('C000000013','M000000013','VIP Access'),('C000000014','M000000014','Basic Reward Points'),('C000000015','M000000015','Basic Reward Points'),('C000000015','M000000015','Exclusive Discounts'),('C000000015','M000000015','Free Shipping'),('C000000015','M000000015','Premium Support'),('C000000015','M000000015','Priority Support'),('C000000015','M000000015','VIP Access'),('C000000016','M000000016','Basic Reward Points'),('C000000016','M000000016','Exclusive Discounts'),('C000000016','M000000016','Free Shipping'),('C000000016','M000000016','Priority Support'),('C000000017','M000000017','Basic Reward Points'),('C000000017','M000000017','Exclusive Discounts'),('C000000017','M000000017','Free Shipping'),('C000000017','M000000017','Priority Support'),('C000000018','M000000018','Basic Reward Points'),('C000000018','M000000018','Exclusive Discounts'),('C000000018','M000000018','Free Shipping'),('C000000018','M000000018','Priority Support'),('C000000019','M000000019','Basic Reward Points'),('C000000019','M000000019','Exclusive Discounts'),('C000000019','M000000019','Free Shipping'),('C000000019','M000000019','Premium Support'),('C000000019','M000000019','Priority Support'),('C000000019','M000000019','VIP Access'),('C000000020','M000000020','Basic Reward Points'),('C000000021','M000000021','Basic Reward Points'),('C000000021','M000000021','Exclusive Discounts'),('C000000021','M000000021','Free Shipping'),('C000000021','M000000021','Priority Support'),('C000000022','M000000022','Basic Reward Points'),('C000000023','M000000023','Basic Reward Points'),('C000000023','M000000023','Exclusive Discounts'),('C000000023','M000000023','Free Shipping'),('C000000023','M000000023','Priority Support'),('C000000024','M000000024','Basic Reward Points'),('C000000024','M000000024','Exclusive Discounts'),('C000000024','M000000024','Free Shipping'),('C000000024','M000000024','Priority Support'),('C000000025','M000000025','Basic Reward Points'),('C000000025','M000000025','Exclusive Discounts'),('C000000025','M000000025','Free Shipping'),('C000000025','M000000025','Premium Support'),('C000000025','M000000025','Priority Support'),('C000000025','M000000025','VIP Access'),('C000000026','M000000026','Basic Reward Points'),('C000000026','M000000026','Exclusive Discounts'),('C000000026','M000000026','Free Shipping'),('C000000026','M000000026','Priority Support'),('C000000027','M000000027','Basic Reward Points'),('C000000027','M000000027','Exclusive Discounts'),('C000000027','M000000027','Free Shipping'),('C000000027','M000000027','Premium Support'),('C000000027','M000000027','Priority Support'),('C000000027','M000000027','VIP Access'),('C000000028','M000000028','Basic Reward Points'),('C000000028','M000000028','Exclusive Discounts'),('C000000028','M000000028','Free Shipping'),('C000000028','M000000028','Premium Support'),('C000000028','M000000028','Priority Support'),('C000000028','M000000028','VIP Access'),('C000000029','M000000029','Basic Reward Points'),('C000000029','M000000029','Exclusive Discounts'),('C000000029','M000000029','Free Shipping'),('C000000029','M000000029','Priority Support'),('C000000030','M000000030','Basic Reward Points'),('C000000030','M000000030','Exclusive Discounts'),('C000000030','M000000030','Free Shipping'),('C000000030','M000000030','Premium Support'),('C000000030','M000000030','Priority Support'),('C000000030','M000000030','VIP Access'),('C000000031','M000000031','Basic Reward Points'),('C000000031','M000000031','Exclusive Discounts'),('C000000031','M000000031','Free Shipping'),('C000000031','M000000031','Priority Support'),('C000000032','M000000032','Basic Reward Points'),('C000000033','M000000033','Basic Reward Points'),('C000000033','M000000033','Exclusive Discounts'),('C000000033','M000000033','Free Shipping'),('C000000033','M000000033','Priority Support'),('C000000034','M000000034','Basic Reward Points'),('C000000034','M000000034','Exclusive Discounts'),('C000000034','M000000034','Free Shipping'),('C000000034','M000000034','Priority Support'),('C000000035','M000000035','Basic Reward Points'),('C000000035','M000000035','Exclusive Discounts'),('C000000035','M000000035','Free Shipping'),('C000000035','M000000035','Premium Support'),('C000000035','M000000035','Priority Support'),('C000000035','M000000035','VIP Access'),('C000000036','M000000036','Basic Reward Points'),('C000000036','M000000036','Exclusive Discounts'),('C000000036','M000000036','Free Shipping'),('C000000036','M000000036','Priority Support'),('C000000037','M000000037','Basic Reward Points'),('C000000037','M000000037','Exclusive Discounts'),('C000000037','M000000037','Free Shipping'),('C000000037','M000000037','Priority Support'),('C000000038','M000000038','Basic Reward Points'),('C000000038','M000000038','Exclusive Discounts'),('C000000038','M000000038','Free Shipping'),('C000000038','M000000038','Priority Support'),('C000000039','M000000039','Basic Reward Points'),('C000000039','M000000039','Exclusive Discounts'),('C000000039','M000000039','Free Shipping'),('C000000039','M000000039','Priority Support'),('C000000040','M000000040','Basic Reward Points'),('C000000040','M000000040','Exclusive Discounts'),('C000000040','M000000040','Free Shipping'),('C000000040','M000000040','Priority Support'),('C000000041','M000000041','Basic Reward Points'),('C000000041','M000000041','Exclusive Discounts'),('C000000041','M000000041','Free Shipping'),('C000000041','M000000041','Priority Support'),('C000000042','M000000042','Basic Reward Points'),('C000000042','M000000042','Exclusive Discounts'),('C000000042','M000000042','Free Shipping'),('C000000042','M000000042','Priority Support'),('C000000043','M000000043','Basic Reward Points'),('C000000043','M000000043','Exclusive Discounts'),('C000000043','M000000043','Free Shipping'),('C000000043','M000000043','Premium Support'),('C000000043','M000000043','Priority Support'),('C000000043','M000000043','VIP Access'),('C000000044','M000000044','Basic Reward Points'),('C000000044','M000000044','Exclusive Discounts'),('C000000044','M000000044','Free Shipping'),('C000000044','M000000044','Premium Support'),('C000000044','M000000044','Priority Support'),('C000000044','M000000044','VIP Access'),('C000000045','M000000045','Basic Reward Points'),('C000000045','M000000045','Exclusive Discounts'),('C000000045','M000000045','Free Shipping'),('C000000045','M000000045','Priority Support'),('C000000046','M000000046','Basic Reward Points'),('C000000046','M000000046','Exclusive Discounts'),('C000000046','M000000046','Free Shipping'),('C000000046','M000000046','Premium Support'),('C000000046','M000000046','Priority Support'),('C000000046','M000000046','VIP Access'),('C000000047','M000000047','Basic Reward Points'),('C000000047','M000000047','Exclusive Discounts'),('C000000047','M000000047','Free Shipping'),('C000000047','M000000047','Priority Support'),('C000000048','M000000048','Basic Reward Points'),('C000000048','M000000048','Exclusive Discounts'),('C000000048','M000000048','Free Shipping'),('C000000048','M000000048','Priority Support'),('C000000049','M000000049','Basic Reward Points'),('C000000049','M000000049','Exclusive Discounts'),('C000000049','M000000049','Free Shipping'),('C000000049','M000000049','Priority Support'),('C000000050','M000000050','Basic Reward Points'),('C000000050','M000000050','Exclusive Discounts'),('C000000050','M000000050','Free Shipping'),('C000000050','M000000050','Priority Support'),('C000000051','M000000051','Basic Reward Points'),('C000000051','M000000051','Exclusive Discounts'),('C000000051','M000000051','Free Shipping'),('C000000051','M000000051','Priority Support'),('C000000052','M000000052','Basic Reward Points'),('C000000052','M000000052','Exclusive Discounts'),('C000000052','M000000052','Free Shipping'),('C000000052','M000000052','Priority Support'),('C000000053','M000000053','Basic Reward Points'),('C000000053','M000000053','Exclusive Discounts'),('C000000053','M000000053','Free Shipping'),('C000000053','M000000053','Premium Support'),('C000000053','M000000053','Priority Support'),('C000000053','M000000053','VIP Access'),('C000000054','M000000054','Basic Reward Points'),('C000000054','M000000054','Exclusive Discounts'),('C000000054','M000000054','Free Shipping'),('C000000054','M000000054','Premium Support'),('C000000054','M000000054','Priority Support'),('C000000054','M000000054','VIP Access'),('C000000055','M000000055','Basic Reward Points'),('C000000055','M000000055','Exclusive Discounts'),('C000000055','M000000055','Free Shipping'),('C000000055','M000000055','Priority Support'),('C000000056','M000000056','Basic Reward Points'),('C000000056','M000000056','Exclusive Discounts'),('C000000056','M000000056','Free Shipping'),('C000000056','M000000056','Priority Support'),('C000000057','M000000057','Basic Reward Points'),('C000000057','M000000057','Exclusive Discounts'),('C000000057','M000000057','Free Shipping'),('C000000057','M000000057','Priority Support'),('C000000058','M000000058','Basic Reward Points'),('C000000058','M000000058','Exclusive Discounts'),('C000000058','M000000058','Free Shipping'),('C000000058','M000000058','Premium Support'),('C000000058','M000000058','Priority Support'),('C000000058','M000000058','VIP Access'),('C000000059','M000000059','Basic Reward Points'),('C000000059','M000000059','Exclusive Discounts'),('C000000059','M000000059','Free Shipping'),('C000000059','M000000059','Priority Support'),('C000000060','M000000060','Basic Reward Points'),('C000000060','M000000060','Exclusive Discounts'),('C000000060','M000000060','Free Shipping'),('C000000060','M000000060','Premium Support'),('C000000060','M000000060','Priority Support'),('C000000060','M000000060','VIP Access'),('C000000061','M000000061','Basic Reward Points'),('C000000061','M000000061','Exclusive Discounts'),('C000000061','M000000061','Free Shipping'),('C000000061','M000000061','Priority Support'),('C000000062','M000000062','Basic Reward Points'),('C000000062','M000000062','Exclusive Discounts'),('C000000062','M000000062','Free Shipping'),('C000000062','M000000062','Priority Support'),('C000000063','M000000063','Basic Reward Points'),('C000000063','M000000063','Exclusive Discounts'),('C000000063','M000000063','Free Shipping'),('C000000063','M000000063','Premium Support'),('C000000063','M000000063','Priority Support'),('C000000063','M000000063','VIP Access'),('C000000064','M000000064','Basic Reward Points'),('C000000064','M000000064','Exclusive Discounts'),('C000000064','M000000064','Free Shipping'),('C000000064','M000000064','Priority Support'),('C000000065','M000000065','Basic Reward Points'),('C000000065','M000000065','Exclusive Discounts'),('C000000065','M000000065','Free Shipping'),('C000000065','M000000065','Priority Support'),('C000000066','M000000066','Basic Reward Points'),('C000000066','M000000066','Exclusive Discounts'),('C000000066','M000000066','Free Shipping'),('C000000066','M000000066','Premium Support'),('C000000066','M000000066','Priority Support'),('C000000066','M000000066','VIP Access'),('C000000067','M000000067','Basic Reward Points'),('C000000067','M000000067','Exclusive Discounts'),('C000000067','M000000067','Free Shipping'),('C000000067','M000000067','Premium Support'),('C000000067','M000000067','Priority Support'),('C000000067','M000000067','VIP Access'),('C000000068','M000000068','Basic Reward Points'),('C000000069','M000000069','Basic Reward Points'),('C000000069','M000000069','Exclusive Discounts'),('C000000069','M000000069','Free Shipping'),('C000000069','M000000069','Priority Support'),('C000000070','M000000070','Basic Reward Points'),('C000000070','M000000070','Exclusive Discounts'),('C000000070','M000000070','Free Shipping'),('C000000070','M000000070','Priority Support'),('C000000071','M000000071','Basic Reward Points'),('C000000072','M000000072','Basic Reward Points'),('C000000072','M000000072','Exclusive Discounts'),('C000000072','M000000072','Free Shipping'),('C000000072','M000000072','Priority Support'),('C000000073','M000000073','Basic Reward Points'),('C000000073','M000000073','Exclusive Discounts'),('C000000073','M000000073','Free Shipping'),('C000000073','M000000073','Priority Support'),('C000000074','M000000074','Basic Reward Points'),('C000000074','M000000074','Exclusive Discounts'),('C000000074','M000000074','Free Shipping'),('C000000074','M000000074','Priority Support'),('C000000075','M000000075','Basic Reward Points'),('C000000075','M000000075','Exclusive Discounts'),('C000000075','M000000075','Free Shipping'),('C000000075','M000000075','Premium Support'),('C000000075','M000000075','Priority Support'),('C000000075','M000000075','VIP Access'),('C000000076','M000000076','Basic Reward Points'),('C000000076','M000000076','Exclusive Discounts'),('C000000076','M000000076','Free Shipping'),('C000000076','M000000076','Priority Support'),('C000000077','M000000077','Basic Reward Points'),('C000000077','M000000077','Exclusive Discounts'),('C000000077','M000000077','Free Shipping'),('C000000077','M000000077','Premium Support'),('C000000077','M000000077','Priority Support'),('C000000077','M000000077','VIP Access'),('C000000078','M000000078','Basic Reward Points'),('C000000078','M000000078','Exclusive Discounts'),('C000000078','M000000078','Free Shipping'),('C000000078','M000000078','Premium Support'),('C000000078','M000000078','Priority Support'),('C000000078','M000000078','VIP Access'),('C000000079','M000000079','Basic Reward Points'),('C000000079','M000000079','Exclusive Discounts'),('C000000079','M000000079','Free Shipping'),('C000000079','M000000079','Priority Support'),('C000000080','M000000080','Basic Reward Points'),('C000000080','M000000080','Exclusive Discounts'),('C000000080','M000000080','Free Shipping'),('C000000080','M000000080','Priority Support'),('C000000081','M000000081','Basic Reward Points'),('C000000081','M000000081','Exclusive Discounts'),('C000000081','M000000081','Free Shipping'),('C000000081','M000000081','Priority Support'),('C000000082','M000000082','Basic Reward Points'),('C000000083','M000000083','Basic Reward Points'),('C000000083','M000000083','Exclusive Discounts'),('C000000083','M000000083','Free Shipping'),('C000000083','M000000083','Priority Support'),('C000000084','M000000084','Basic Reward Points'),('C000000085','M000000085','Basic Reward Points'),('C000000085','M000000085','Exclusive Discounts'),('C000000085','M000000085','Free Shipping'),('C000000085','M000000085','Premium Support'),('C000000085','M000000085','Priority Support'),('C000000085','M000000085','VIP Access'),('C000000086','M000000086','Basic Reward Points'),('C000000086','M000000086','Exclusive Discounts'),('C000000086','M000000086','Free Shipping'),('C000000086','M000000086','Premium Support'),('C000000086','M000000086','Priority Support'),('C000000086','M000000086','VIP Access'),('C000000087','M000000087','Basic Reward Points'),('C000000087','M000000087','Exclusive Discounts'),('C000000087','M000000087','Free Shipping'),('C000000087','M000000087','Priority Support'),('C000000088','M000000088','Basic Reward Points'),('C000000088','M000000088','Exclusive Discounts'),('C000000088','M000000088','Free Shipping'),('C000000088','M000000088','Premium Support'),('C000000088','M000000088','Priority Support'),('C000000088','M000000088','VIP Access'),('C000000089','M000000089','Basic Reward Points'),('C000000089','M000000089','Exclusive Discounts'),('C000000089','M000000089','Free Shipping'),('C000000089','M000000089','Premium Support'),('C000000089','M000000089','Priority Support'),('C000000089','M000000089','VIP Access'),('C000000090','M000000090','Basic Reward Points'),('C000000090','M000000090','Exclusive Discounts'),('C000000090','M000000090','Free Shipping'),('C000000090','M000000090','Priority Support'),('C000000091','M000000091','Basic Reward Points'),('C000000091','M000000091','Exclusive Discounts'),('C000000091','M000000091','Free Shipping'),('C000000091','M000000091','Premium Support'),('C000000091','M000000091','Priority Support'),('C000000091','M000000091','VIP Access'),('C000000092','M000000092','Basic Reward Points'),('C000000092','M000000092','Exclusive Discounts'),('C000000092','M000000092','Free Shipping'),('C000000092','M000000092','Premium Support'),('C000000092','M000000092','Priority Support'),('C000000092','M000000092','VIP Access'),('C000000093','M000000093','Basic Reward Points'),('C000000093','M000000093','Exclusive Discounts'),('C000000093','M000000093','Free Shipping'),('C000000093','M000000093','Premium Support'),('C000000093','M000000093','Priority Support'),('C000000093','M000000093','VIP Access'),('C000000094','M000000094','Basic Reward Points'),('C000000094','M000000094','Exclusive Discounts'),('C000000094','M000000094','Free Shipping'),('C000000094','M000000094','Priority Support'),('C000000095','M000000095','Basic Reward Points'),('C000000095','M000000095','Exclusive Discounts'),('C000000095','M000000095','Free Shipping'),('C000000095','M000000095','Premium Support'),('C000000095','M000000095','Priority Support'),('C000000095','M000000095','VIP Access'),('C000000096','M000000096','Basic Reward Points'),('C000000096','M000000096','Exclusive Discounts'),('C000000096','M000000096','Free Shipping'),('C000000096','M000000096','Priority Support'),('C000000097','M000000097','Basic Reward Points'),('C000000097','M000000097','Exclusive Discounts'),('C000000097','M000000097','Free Shipping'),('C000000097','M000000097','Priority Support'),('C000000098','M000000098','Basic Reward Points'),('C000000099','M000000099','Basic Reward Points'),('C000000099','M000000099','Exclusive Discounts'),('C000000099','M000000099','Free Shipping'),('C000000099','M000000099','Priority Support'),('C000000100','M000000100','Basic Reward Points');
/*!40000 ALTER TABLE `membership_privilegepackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parttimeemployee`
--

DROP TABLE IF EXISTS `parttimeemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parttimeemployee` (
  `employeeID_P` char(5) NOT NULL,
  `hoursPerWeek` int DEFAULT NULL,
  PRIMARY KEY (`employeeID_P`),
  CONSTRAINT `parttimeemployee_ibfk_1` FOREIGN KEY (`employeeID_P`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parttimeemployee`
--

LOCK TABLES `parttimeemployee` WRITE;
/*!40000 ALTER TABLE `parttimeemployee` DISABLE KEYS */;
INSERT INTO `parttimeemployee` VALUES ('E0031',15),('E0032',20),('E0033',10),('E0034',18),('E0035',12),('E0036',22),('E0037',14),('E0038',16),('E0039',16),('E0040',25);
/*!40000 ALTER TABLE `parttimeemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceoncontract`
--

DROP TABLE IF EXISTS `serviceoncontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceoncontract` (
  `serviceID` char(5) NOT NULL,
  `contractID` char(10) NOT NULL,
  `centerID` char(5) DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`contractID`),
  KEY `contractID` (`contractID`),
  KEY `centerID` (`centerID`),
  CONSTRAINT `serviceoncontract_ibfk_1` FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`),
  CONSTRAINT `serviceoncontract_ibfk_2` FOREIGN KEY (`contractID`) REFERENCES `contract` (`contractID`),
  CONSTRAINT `serviceoncontract_ibfk_3` FOREIGN KEY (`centerID`) REFERENCES `shoppingcenter` (`centerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceoncontract`
--

LOCK TABLES `serviceoncontract` WRITE;
/*!40000 ALTER TABLE `serviceoncontract` DISABLE KEYS */;
INSERT INTO `serviceoncontract` VALUES ('S001','CTR2024031','C01'),('S004','CTR2024032','C01');
/*!40000 ALTER TABLE `serviceoncontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceID` char(5) NOT NULL,
  `serviceType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`serviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('S001','Cleaning'),('S002','Repairing'),('S003','Maintain'),('S004','Delivery'),('S005','Install');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `shiftID` char(5) NOT NULL,
  `shiftType` varchar(10) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`shiftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES ('S001','Full-Time','09:00:00','17:00:00'),('S002','Part-Time','09:00:00','13:00:00'),('S003','Part-Time','13:00:00','17:00:00'),('S004','Part-Time','17:00:00','22:00:00');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcenter`
--

DROP TABLE IF EXISTS `shoppingcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcenter` (
  `centerID` char(5) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`centerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcenter`
--

LOCK TABLES `shoppingcenter` WRITE;
/*!40000 ALTER TABLE `shoppingcenter` DISABLE KEYS */;
INSERT INTO `shoppingcenter` VALUES ('C01','Ha Dong A Center','99A Tran Phu, Ha Dong, Ha Noi','myshoppingcenter@gmail.com');
/*!40000 ALTER TABLE `shoppingcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcenter_phonenumber`
--

DROP TABLE IF EXISTS `shoppingcenter_phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcenter_phonenumber` (
  `centerID` char(5) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`centerID`,`phoneNumber`),
  CONSTRAINT `shoppingcenter_phonenumber_ibfk_1` FOREIGN KEY (`centerID`) REFERENCES `shoppingcenter` (`centerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcenter_phonenumber`
--

LOCK TABLES `shoppingcenter_phonenumber` WRITE;
/*!40000 ALTER TABLE `shoppingcenter_phonenumber` DISABLE KEYS */;
INSERT INTO `shoppingcenter_phonenumber` VALUES ('C01','0123456789'),('C01','0987654321');
/*!40000 ALTER TABLE `shoppingcenter_phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `storeID` char(5) NOT NULL,
  `centerID` char(5) DEFAULT NULL,
  `contractID` char(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `activeStatus` tinyint(1) DEFAULT NULL,
  `activeDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `totalArea` int DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `floor` varchar(2) DEFAULT NULL,
  `businessActivity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`storeID`),
  KEY `centerID` (`centerID`),
  KEY `contractID` (`contractID`),
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`centerID`) REFERENCES `shoppingcenter` (`centerID`),
  CONSTRAINT `store_ibfk_2` FOREIGN KEY (`contractID`) REFERENCES `contract` (`contractID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES ('S0001','C01','CTR2024001','Highlands Coffee',1,'2024-01-01','2026-12-14',120,'CORNER','G','CAFE'),('S0002','C01','CTR2024002','Phuc Long',1,'2024-01-15','2028-12-31',85,'INLINE','1','CAFE'),('S0003','C01','CTR2024003','Uniqlo',1,'2023-12-15','2026-11-29',1200,'ANCHOR','L1','FASHION'),('S0004','C01','CTR2024004','CGV Cinema',1,'2023-11-01','2028-10-14',2500,'ANCHOR','3','ENTERTAINMENT'),('S0005','C01','CTR2024005','Nguyen Kim',1,'2024-01-20','2029-01-09',1800,'ANCHOR','2','ELECTRONICS'),('S0006','C01','CTR2024006','The Face Shop',1,'2023-12-15','2025-11-30',65,'INLINE','1','COSMETICS'),('S0007','C01','CTR2024007','Pizza Hut',1,'2024-02-01','2027-01-14',150,'CORNER','3','RESTAURANT'),('S0008','C01','CTR2024008','Jollibee',1,'2023-11-15','2026-10-31',180,'CORNER','G','RESTAURANT'),('S0009','C01','CTR2024009','Nike',1,'2024-02-15','2029-01-31',450,'ANCHOR','1','SPORTSWEAR'),('S0010','C01','CTR2024010','Adidas',1,'2024-02-01','2029-01-19',400,'ANCHOR','2','SPORTSWEAR'),('S0011','C01','CTR2024011','Tran Anh Mobile',1,'2023-12-20','2026-12-09',120,'INLINE','G','ELECTRONICS'),('S0012','C01','CTR2024012','TheFaceShop',1,'2024-01-15','2027-01-04',70,'INLINE','1','COSMETICS'),('S0013','C01','CTR2024013','KFC',1,'2023-12-01','2026-11-14',160,'CORNER','3','RESTAURANT'),('S0014','C01','CTR2024014','Vascara',1,'2024-02-20','2027-02-09',85,'INLINE','1','FASHION'),('S0015','C01','CTR2024015','Lotte Cinema',1,'2024-01-05','2028-12-19',2800,'ANCHOR','4','ENTERTAINMENT'),('S0016','C01','CTR2024016','Fahasa',1,'2024-01-20','2027-01-09',350,'INLINE','2','BOOKS'),('S0017','C01','CTR2024017','Starbucks',1,'2023-12-01','2026-11-19',140,'CORNER','G','CAFE'),('S0018','C01','CTR2024018','Puma',1,'2024-03-01','2029-02-14',380,'ANCHOR','2','SPORTSWEAR'),('S0019','C01','CTR2024019','Miniso',1,'2024-02-01','2027-01-14',200,'INLINE','1','LIFESTYLE'),('S0020','C01','CTR2024020','TGDD',1,'2023-12-15','2028-12-04',300,'CORNER','G','ELECTRONICS'),('S0021','C01','CTR2024021','Paris Baguette',1,'2024-02-15','2027-01-31',110,'INLINE','G','BAKERY'),('S0022','C01','CTR2024022','Mumuso',1,'2023-12-10','2026-11-24',180,'INLINE','1','LIFESTYLE'),('S0023','C01','CTR2024023','Innisfree',1,'2024-02-01','2027-01-19',75,'INLINE','1','COSMETICS'),('S0024','C01','CTR2024024','Guardian',1,'2024-01-01','2026-12-14',200,'CORNER','G','PHARMACY'),('S0025','C01','CTR2024025','Watsons',1,'2024-02-15','2029-02-04',250,'CORNER','1','PHARMACY'),('S0026','C01','CTR2024026','H&M',1,'2023-12-01','2028-11-09',1500,'ANCHOR','L2','FASHION'),('S0027','C01','CTR2024027','Zara',1,'2024-02-01','2029-01-24',1800,'ANCHOR','L1','FASHION'),('S0028','C01','CTR2024028','Lotteria',1,'2023-12-15','2026-11-30',140,'INLINE','3','RESTAURANT'),('S0029','C01','CTR2024029','Lock&Lock',1,'2024-02-20','2027-02-09',150,'INLINE','2','HOMEWARE'),('S0030','C01','CTR2024030','Xiaomi Store',1,'2023-12-15','2026-11-29',180,'INLINE','G','ELECTRONICS'),('S0031','C01',NULL,'CTR2024031',0,NULL,NULL,140,'INLINE','L1',NULL),('S0032','C01',NULL,'CTR2024032',0,NULL,NULL,150,'INLINE','G',NULL),('S0033','C01',NULL,'CTR2024033',0,NULL,NULL,200,'INLINE','G',NULL),('S0034','C01',NULL,'CTR2024034',0,NULL,NULL,250,'INLINE','2',NULL),('S0035','C01',NULL,'CTR2024035',0,NULL,NULL,300,'INLINE','3',NULL),('S0036','C01',NULL,'CTR2024036',0,NULL,NULL,420,'INLINE','4',NULL),('S0037','C01',NULL,'CTR2024035',0,NULL,NULL,600,'CORNER','3',NULL),('S0038','C01',NULL,'CTR2024036',0,NULL,NULL,800,'ANCHOR','2',NULL);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `customerID` char(10) DEFAULT NULL,
  `storeID` char(5) DEFAULT NULL,
  `amountsBought` int DEFAULT NULL,
  `visitedDate` date DEFAULT NULL,
  `pointsEarned` int DEFAULT NULL,
  `visitID` char(10) NOT NULL,
  PRIMARY KEY (`visitID`),
  KEY `customerID` (`customerID`),
  KEY `storeID` (`storeID`),
  CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES ('C000000001','S0001',1560000,'2024-01-03',16,'V000000001'),('C000000002','S0003',890000,'2024-01-03',9,'V000000002'),('C000000003','S0002',2340000,'2024-01-04',23,'V000000003'),('C000000004','S0001',670000,'2024-01-05',7,'V000000004'),('C000000001','S0002',1890000,'2024-01-07',19,'V000000005'),('C000000005','S0004',4450000,'2024-01-08',45,'V000000006'),('C000000002','S0003',1230000,'2024-01-10',12,'V000000007'),('C000000006','S0001',780000,'2024-01-12',8,'V000000008'),('C000000007','S0005',2560000,'2024-01-15',26,'V000000009'),('C000000003','S0002',1670000,'2024-01-18',17,'V000000010'),('C000000008','S0004',3450000,'2024-01-20',35,'V000000011'),('C000000009','S0003',890000,'2024-01-22',9,'V000000012'),('C000000001','S0001',2780000,'2024-01-25',28,'V000000013'),('C000000010','S0005',1560000,'2024-01-28',16,'V000000014'),('C000000011','S0002',4450000,'2024-01-30',45,'V000000015'),('C000000012','S0004',2340000,'2024-02-01',23,'V000000016'),('C000000013','S0003',1670000,'2024-02-03',17,'V000000017'),('C000000014','S0001',890000,'2024-02-05',9,'V000000018'),('C000000015','S0005',3450000,'2024-02-07',35,'V000000019'),('C000000001','S0002',1230000,'2024-02-09',12,'V000000020'),('C000000002','S0004',2780000,'2024-02-11',28,'V000000021'),('C000000016','S0003',1560000,'2024-02-13',16,'V000000022'),('C000000017','S0001',4450000,'2024-02-15',45,'V000000023'),('C000000018','S0005',2340000,'2024-02-17',23,'V000000024'),('C000000019','S0002',1670000,'2024-02-19',17,'V000000025'),('C000000003','S0004',890000,'2024-02-21',9,'V000000026'),('C000000020','S0003',3450000,'2024-02-23',35,'V000000027'),('C000000001','S0001',1230000,'2024-02-25',12,'V000000028'),('C000000021','S0005',2780000,'2024-02-27',28,'V000000029'),('C000000022','S0002',1560000,'2024-02-29',16,'V000000030'),('C000000002','S0004',4450000,'2024-03-02',45,'V000000031'),('C000000023','S0003',2340000,'2024-03-04',23,'V000000032'),('C000000024','S0001',1670000,'2024-03-06',17,'V000000033'),('C000000025','S0005',890000,'2024-03-08',9,'V000000034'),('C000000001','S0002',3450000,'2024-03-10',35,'V000000035'),('C000000026','S0004',1230000,'2024-03-12',12,'V000000036'),('C000000027','S0003',2780000,'2024-03-14',28,'V000000037'),('C000000028','S0001',1560000,'2024-03-16',16,'V000000038'),('C000000029','S0005',4450000,'2024-03-18',45,'V000000039'),('C000000002','S0002',2340000,'2024-03-20',23,'V000000040'),('C000000030','S0004',1670000,'2024-03-22',17,'V000000041'),('C000000001','S0003',890000,'2024-03-24',9,'V000000042'),('C000000031','S0001',3450000,'2024-03-26',35,'V000000043'),('C000000032','S0005',1230000,'2024-03-28',12,'V000000044'),('C000000033','S0002',2780000,'2024-03-30',28,'V000000045'),('C000000002','S0004',1560000,'2024-04-01',16,'V000000046'),('C000000034','S0003',4450000,'2024-04-03',45,'V000000047'),('C000000035','S0001',2340000,'2024-04-05',23,'V000000048'),('C000000001','S0005',1670000,'2024-04-07',17,'V000000049'),('C000000036','S0002',890000,'2024-04-09',9,'V000000050'),('C000000037','S0004',3450000,'2024-04-11',35,'V000000051'),('C000000038','S0003',1230000,'2024-04-13',12,'V000000052'),('C000000039','S0001',2780000,'2024-04-15',28,'V000000053'),('C000000002','S0005',1560000,'2024-04-17',16,'V000000054'),('C000000040','S0002',4450000,'2024-04-19',45,'V000000055'),('C000000001','S0004',2340000,'2024-04-21',23,'V000000056'),('C000000041','S0003',1670000,'2024-04-23',17,'V000000057'),('C000000042','S0001',890000,'2024-04-25',9,'V000000058'),('C000000043','S0005',3450000,'2024-04-27',35,'V000000059'),('C000000002','S0002',1230000,'2024-04-29',12,'V000000060'),('C000000044','S0004',2780000,'2024-05-01',28,'V000000061'),('C000000001','S0003',1560000,'2024-05-03',16,'V000000062'),('C000000045','S0001',4450000,'2024-05-05',45,'V000000063'),('C000000046','S0005',2340000,'2024-05-07',23,'V000000064'),('C000000047','S0002',1670000,'2024-05-09',17,'V000000065'),('C000000002','S0004',890000,'2024-05-11',9,'V000000066'),('C000000048','S0003',3450000,'2024-05-13',35,'V000000067'),('C000000001','S0001',1230000,'2024-05-15',12,'V000000068'),('C000000049','S0005',2780000,'2024-05-17',28,'V000000069'),('C000000050','S0002',1560000,'2024-05-19',16,'V000000070'),('C000000002','S0004',4450000,'2024-05-21',45,'V000000071'),('C000000051','S0003',2340000,'2024-05-23',23,'V000000072'),('C000000052','S0001',1670000,'2024-05-25',17,'V000000073'),('C000000053','S0005',890000,'2024-05-27',9,'V000000074'),('C000000001','S0002',3450000,'2024-05-29',35,'V000000075'),('C000000054','S0004',1230000,'2024-05-31',12,'V000000076'),('C000000055','S0003',2780000,'2024-06-02',28,'V000000077'),('C000000056','S0001',1560000,'2024-06-04',16,'V000000078'),('C000000057','S0005',4450000,'2024-06-06',45,'V000000079'),('C000000002','S0002',2340000,'2024-06-08',23,'V000000080'),('C000000058','S0004',1670000,'2024-06-10',17,'V000000081'),('C000000001','S0003',890000,'2024-06-12',9,'V000000082'),('C000000059','S0001',3450000,'2024-06-14',35,'V000000083'),('C000000060','S0005',1230000,'2024-06-16',12,'V000000084'),('C000000061','S0002',2780000,'2024-06-18',28,'V000000085'),('C000000002','S0004',1560000,'2024-06-20',16,'V000000086'),('C000000062','S0003',4450000,'2024-06-22',45,'V000000087'),('C000000063','S0001',2340000,'2024-06-24',23,'V000000088'),('C000000001','S0005',1670000,'2024-06-26',17,'V000000089'),('C000000064','S0002',890000,'2024-06-28',9,'V000000090'),('C000000065','S0004',3450000,'2024-06-30',35,'V000000091'),('C000000066','S0003',1230000,'2024-07-02',12,'V000000092'),('C000000067','S0001',2780000,'2024-07-04',28,'V000000093'),('C000000002','S0005',1560000,'2024-07-06',16,'V000000094'),('C000000068','S0002',4450000,'2024-07-08',45,'V000000095'),('C000000001','S0004',2340000,'2024-07-10',23,'V000000096'),('C000000069','S0003',1670000,'2024-07-12',17,'V000000097'),('C000000070','S0001',890000,'2024-07-14',9,'V000000098'),('C000000071','S0005',3450000,'2024-07-16',35,'V000000099'),('C000000002','S0002',1230000,'2024-07-18',12,'V000000100'),('C000000072','S0004',2780000,'2024-07-20',28,'V000000101'),('C000000001','S0003',1560000,'2024-07-22',16,'V000000102'),('C000000073','S0001',4450000,'2024-07-24',45,'V000000103'),('C000000074','S0005',2340000,'2024-07-26',23,'V000000104'),('C000000075','S0002',1670000,'2024-07-28',17,'V000000105'),('C000000002','S0004',890000,'2024-07-30',9,'V000000106'),('C000000076','S0003',3450000,'2024-08-01',35,'V000000107'),('C000000001','S0001',1230000,'2024-08-03',12,'V000000108'),('C000000077','S0005',2780000,'2024-08-05',28,'V000000109'),('C000000078','S0002',1560000,'2024-08-07',16,'V000000110'),('C000000002','S0004',4450000,'2024-08-09',45,'V000000111'),('C000000079','S0003',2340000,'2024-08-11',23,'V000000112'),('C000000080','S0001',1670000,'2024-08-13',17,'V000000113'),('C000000081','S0005',890000,'2024-08-15',9,'V000000114'),('C000000001','S0002',3450000,'2024-08-17',35,'V000000115'),('C000000082','S0004',1230000,'2024-08-19',12,'V000000116'),('C000000083','S0003',2780000,'2024-08-21',28,'V000000117'),('C000000084','S0003',2780000,'2024-08-21',28,'V000000118'),('C000000009','S0001',1000000,'2024-08-21',9,'V000000119'),('C000000019','S0002',2780000,'2024-08-20',28,'V000000120'),('C000000009','S0001',1000000,'2024-08-21',9,'V000000121'),('C000000019','S0002',2780000,'2024-08-20',28,'V000000122'),('C000000009','S0003',1500000,'2024-08-21',15,'V000000123'),('C000000009','S0004',1200000,'2024-08-21',12,'V000000124'),('C000000010','S0005',1800000,'2024-08-22',18,'V000000125'),('C000000019','S0001',800000,'2024-08-20',8,'V000000126'),('C000000009','S0002',2200000,'2024-08-21',22,'V000000127'),('C000000011','S0003',1400000,'2024-08-23',14,'V000000128'),('C000000012','S0004',1700000,'2024-08-24',17,'V000000129'),('C000000019','S0005',2600000,'2024-08-20',26,'V000000130'),('C000000013','S0001',1900000,'2024-08-25',19,'V000000131'),('C000000014','S0002',1200000,'2024-08-26',12,'V000000132'),('C000000009','S0003',2500000,'2024-08-21',25,'V000000133'),('C000000015','S0004',3000000,'2024-08-27',30,'V000000134'),('C000000016','S0005',3200000,'2024-08-28',32,'V000000135'),('C000000019','S0001',2800000,'2024-08-20',28,'V000000136'),('C000000010','S0002',2200000,'2024-08-22',22,'V000000137'),('C000000017','S0003',2400000,'2024-08-29',24,'V000000138'),('C000000018','S0004',1800000,'2024-08-30',18,'V000000139'),('C000000009','S0005',3300000,'2024-08-21',33,'V000000140'),('C000000019','S0001',2500000,'2024-08-20',25,'V000000141'),('C000000012','S0002',1100000,'2024-08-24',11,'V000000142'),('C000000009','S0003',2300000,'2024-08-21',23,'V000000143'),('C000000013','S0004',1500000,'2024-08-25',15,'V000000144'),('C000000011','S0005',2700000,'2024-08-23',27,'V000000145'),('C000000019','S0001',3000000,'2024-08-20',30,'V000000146'),('C000000009','S0002',2100000,'2024-08-21',21,'V000000147'),('C000000010','S0003',1700000,'2024-08-22',17,'V000000148'),('C000000018','S0004',1200000,'2024-08-30',12,'V000000149'),('C000000019','S0005',3400000,'2024-08-20',34,'V000000150'),('C000000014','S0001',1300000,'2024-08-26',13,'V000000151'),('C000000009','S0002',2800000,'2024-08-21',28,'V000000152'),('C000000016','S0003',2900000,'2024-08-28',29,'V000000153'),('C000000017','S0004',1900000,'2024-08-29',19,'V000000154'),('C000000010','S0005',2100000,'2024-08-22',21,'V000000155'),('C000000009','S0001',3200000,'2024-08-21',32,'V000000156'),('C000000019','S0002',2500000,'2024-08-20',25,'V000000157'),('C000000011','S0003',1800000,'2024-08-23',18,'V000000158'),('C000000013','S0004',1400000,'2024-08-25',14,'V000000159'),('C000000018','S0005',3600000,'2024-08-30',36,'V000000160'),('C000000086','S0005',1000000,'2024-10-31',10,'V000000161'),('C000000032','S0002',1000000,'2024-11-11',10,'V000000162'),('C000000037','S0004',1100000,'2024-12-11',11,'V000000163'),('C000000087','S0006',1200000,'2024-11-21',12,'V000000164'),('C000000069','S0005',2500000,'2024-08-25',25,'V000000165'),('C000000085','S0001',1900000,'2024-08-26',19,'V000000166'),('C000000004','S0002',1200000,'2024-08-27',12,'V000000167'),('C000000021','S0003',2100000,'2024-08-28',21,'V000000168'),('C000000033','S0004',2800000,'2024-08-29',28,'V000000169'),('C000000048','S0005',2300000,'2024-08-30',23,'V000000170'),('C000000069','S0001',1600000,'2024-08-21',16,'V000000171'),('C000000085','S0002',3000000,'2024-08-22',30,'V000000172');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workson`
--

DROP TABLE IF EXISTS `workson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workson` (
  `centerID` char(5) DEFAULT NULL,
  `employeeID` char(5) NOT NULL,
  `shiftID` char(5) NOT NULL,
  `jobID` char(5) NOT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`employeeID`,`shiftID`,`jobID`),
  KEY `centerID` (`centerID`),
  KEY `shiftID` (`shiftID`),
  KEY `jobID` (`jobID`),
  CONSTRAINT `workson_ibfk_1` FOREIGN KEY (`centerID`) REFERENCES `shoppingcenter` (`centerID`),
  CONSTRAINT `workson_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `workson_ibfk_3` FOREIGN KEY (`shiftID`) REFERENCES `shift` (`shiftID`),
  CONSTRAINT `workson_ibfk_4` FOREIGN KEY (`jobID`) REFERENCES `job` (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workson`
--

LOCK TABLES `workson` WRITE;
/*!40000 ALTER TABLE `workson` DISABLE KEYS */;
INSERT INTO `workson` VALUES ('C01','E0001','S001','J003',30000000),('C01','E0002','S001','J003',31000000),('C01','E0003','S001','J003',29000000),('C01','E0004','S001','J004',15000000),('C01','E0005','S001','J004',15000000),('C01','E0006','S001','J004',16000000),('C01','E0007','S001','J007',20000000),('C01','E0008','S001','J007',21000000),('C01','E0009','S001','J007',19000000),('C01','E0010','S001','J007',20000000),('C01','E0011','S001','J007',21000000),('C01','E0012','S001','J007',19000000),('C01','E0013','S001','J003',20000000),('C01','E0014','S001','J009',10000000),('C01','E0015','S001','J009',11000000),('C01','E0016','S001','J009',9000000),('C01','E0017','S001','J009',9400000),('C01','E0018','S001','J009',9500000),('C01','E0019','S001','J005',15000000),('C01','E0020','S001','J005',16000000),('C01','E0021','S001','J005',15500000),('C01','E0022','S001','J005',15550000),('C01','E0023','S001','J005',16500000),('C01','E0024','S001','J005',17000000),('C01','E0025','S001','J005',13000000),('C01','E0026','S001','J006',13000000),('C01','E0027','S001','J006',12000000),('C01','E0028','S001','J006',14000000),('C01','E0029','S001','J006',13500000),('C01','E0030','S001','J006',12500000),('C01','E0031','S001','J006',14000000),('C01','E0032','S001','J006',15000000),('C01','E0033','S001','J006',14000000),('C01','E0034','S001','J006',13000000),('C01','E0035','S001','J005',16500000),('C01','E0036','S001','J005',14500000),('C01','E0037','S001','J005',15500000),('C01','E0038','S001','J005',15500000),('C01','E0039','S001','J006',13500000),('C01','E0040','S003','J003',3000000),('C01','E0041','S002','J003',4000000),('C01','E0042','S003','J003',1500000),('C01','E0043','S002','J003',3200000),('C01','E0044','S003','J003',4800000),('C01','E0045','S004','J003',2000000),('C01','E0046','S002','J003',4200000),('C01','E0047','S003','J003',2000000),('C01','E0048','S004','J003',2400000),('C01','E0049','S002','J003',2400000),('C01','E0050','S003','J003',4200000);
/*!40000 ALTER TABLE `workson` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-18 21:42:21
