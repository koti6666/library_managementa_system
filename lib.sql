DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `ISBN_Number` varchar(13) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Book_Title` varchar(255) NOT NULL,
  `Language` varchar(50) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `Publisher_ID` int DEFAULT NULL,
  `library_id` int DEFAULT NULL,
  PRIMARY KEY (`ISBN_Number`),
  KEY `Publisher_ID` (`Publisher_ID`),
  KEY `library_id` (`library_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Publisher_ID`) REFERENCES `publisher` (`Publisher_ID`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`library_id`) REFERENCES `library` (`Library_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `book` WRITE;
INSERT INTO `book` VALUES 
('103','S L Bhyrappa','Grihabhanga','Kannada','Historical, Fiction',10,1),
('105','S L Bhyrappa','Vamshavriksha','Kannada','Fiction',10,1),
('12345','JK R','HP DH','ENG','horror',1,1),
('4444','Babu mosai','Shrilok homeless','Bengali','Adventure, mystery',3,3),
('500','H G Wells','Invisible Man','English','Adventure',4,1),
('5555','Agatha Christae','ABC Murders','English','Horror, Mystery',7,1),
('784653123','ANUTer','ITITLE','ENlisgh','horror,comedy',2,2),
('888','shiva','dbms','kannada','educational',7,1),
('999999','Rick ','PJO','ENG','Comedy,fantasy',1,1);
UNLOCK TABLES;

DROP TABLE IF EXISTS `book_copies`;

CREATE TABLE `book_copies` (
  `ISBN_Number` varchar(13) DEFAULT NULL,
  `number_available` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `book_copies` WRITE;
INSERT INTO `book_copies` VALUES 
('12345',1),('784653123',4),('999999',12),('666',-2),('4444',16),
('5555',4),('500',3),('888',5),('101',4),('102',5),('103',5),('105',5);
UNLOCK TABLES;

DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `ISBN_Number` varchar(13) NOT NULL,
  `Member_ID` int NOT NULL,
  `Return_Date` date DEFAULT NULL,
  `Due_Date` date DEFAULT NULL,
  `Fine` decimal(10,2) DEFAULT NULL,
  `date_lent` date DEFAULT NULL,
  PRIMARY KEY (`ISBN_Number`,`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `borrow` WRITE;
INSERT INTO `borrow` VALUES 
('101',7,NULL,'2023-11-24',NULL,'2023-11-21'),
('4444',1,'2023-11-20','2023-11-23',NULL,'2023-11-20'),
('500',3,'2023-11-26','2023-11-23',30.00,'2023-11-20'),
('5555',1,NULL,'2023-11-23',NULL,'2023-11-20'),
('666',3,'2023-11-30','2023-11-19',110.00,'2023-11-16'),
('888',1,'2023-11-28','2023-11-23',50.00,'2023-11-20');
UNLOCK TABLES;

DROP TABLE IF EXISTS `library`;

CREATE TABLE `library` (
  `Library_ID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Library_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `library` WRITE;
INSERT INTO `library` VALUES 
(1,'Central Library','Main Street, City Center'),
(2,'West Branch','West Avenue, Suburbia'),
(3,'East Branch','East Boulevard, Suburbia');
UNLOCK TABLES;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `Member_ID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Member_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `member` WRITE;
INSERT INTO `member` VALUES 
(1,'John Smith','john.smith@example.com'),
(2,'Alice Johnson','alice.johnson@example.com'),
(3,'Bob Williams','bob.williams@example.com'),
(4,'Emma Davis','emma.davis@example.com'),
(5,'Charlie Brown','charlie.brown@example.com'),
(6,'Leo DiCaprio','jackdrowned@sea.com'),
(7,'shaik tabassum','shaiktabassum1606@gmail.com');
UNLOCK TABLES;

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `Publisher_ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Block_No` varchar(10) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Pincode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Publisher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `publisher` WRITE;
INSERT INTO `publisher` VALUES 
(1,'ABC Publications','Block A','Main Street','City Center','12345'),
(2,'XYZ Books','Block B','West Avenue','Suburbia','54321'),
(3,'TechPress','Block C','East Boulevard','Suburbia','98765'),
(4,'Book Haven','Block D','Downtown Street','Downtown','67890'),
(5,'Innovative Publishers','Block E','South Street','South City','45678'),
(6,'Academic Press','Block F','North Avenue','North City','87654'),
(7,'Global Books','Block G','Central Road','Central City','23456'),
(8,'Intellect Publishers','Block H','Sunset Boulevard','Sunset City','78901'),
(9,'Knowledge World','Block I','Moonlight Street','Moonlight City','34567'),
(10,'Digital Press','Block J','Star Avenue','Star City','01234'),
(11,'GoodBook Publications','33','Bookers street','Manchaster',''),
(12,'Madman Books','Block 53','Temple street','Ramnagara','778877');
UNLOCK TABLES;

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `Employee_ID` int NOT NULL,
  `Contact_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `library_id` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_library` (`library_id`),
  CONSTRAINT `fk_library` FOREIGN KEY (`library_id`) REFERENCES `library` (`Library_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `staff` WRITE;
INSERT INTO `staff` VALUES 
(101,'123-456-7890','john.smith@library.com','John Smith','Librarian',NULL),
(102,'987-654-3210','alice.johnson@library.com','Alice Johnson','Assistant Librarian',NULL),
(103,'111-222-3333','bob.williams@library.com','Bob Williams','Library Assistant',NULL),
(104,'333-444-5555','emma.davis@library.com','Emma Davis','Library Clerk',NULL),
(105,'555-666-7777','charlie.brown@library.com','Charlie Brown','Library Technician',NULL);
UNLOCK TABLES;

CREATE FUNCTION update_book_copies(ISBN varchar(13))
RETURNS VOID
BEGIN
  UPDATE book_copies
  SET number_available = number_available - 1
  WHERE ISBN_Number = ISBN;
END;

CREATE FUNCTION return_book(ISBN varchar(13))
RETURNS VOID
BEGIN
  UPDATE book_copies
  SET number_available = number_available + 1
  WHERE ISBN_Number = ISBN;
END;

CREATE FUNCTION calculate_fine(return_date DATE, due_date DATE)
RETURNS DECIMAL(10, 2)
BEGIN
  DECLARE fine_amount DECIMAL(10, 2);
  DECLARE fine_days INT;

  IF return_date > due_date THEN
    SET fine_days = DATEDIFF(return_date, due_date);
    SET fine_amount = fine_days * 10.00;  -- Assuming a fine rate of 10.00 per day
  ELSE
    SET fine_amount = 0.00;
  END IF;

  RETURN fine_amount;
END;
