-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: brew_bloom
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(30) CHARACTER SET utf8mb3 NOT NULL,
  `LastName` varchar(40) CHARACTER SET utf8mb3 NOT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb3 DEFAULT NULL,
  `Phone` varchar(15) CHARACTER SET utf8mb3 DEFAULT NULL,
  `CustomerType` varchar(30) CHARACTER SET utf8mb3 DEFAULT NULL,
  `StreetAdress` varchar(60) CHARACTER SET utf8mb3 DEFAULT NULL,
  `ZipID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `FK_ZipID_idx` (`ZipID`),
  CONSTRAINT `FK_ZipID` FOREIGN KEY (`ZipID`) REFERENCES `zipcode` (`ZipID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Alice','Nguyen','alice@example.com','1234567890','Regular','757 north street','12345'),(2,'Bob','Lee','bob@example.com','1234567891','Subscriber','885 west street','12345'),(3,'Clara','Kim','clara@example.com','1234567892','Regular','873 east street','67890'),(4,'David','Chen','david@example.com','1234567893','Subscriber','974 south street','13579'),(5,'Ella','Smith','ella@example.com','1234567894','Regular','864 turtle ave','13579'),(6,'Frank','Park','frank@example.com','1234567895','Subscriber','863 cow ave','67890'),(7,'Grace','Liu','grace@example.com','1234567896','Regular','863 dog ave','24680'),(8,'Henry','Patel','henry@example.com','1234567897','Subscriber','975 plainfield ave','24680'),(9,'Isla','Lopez','isla@example.com','1234567898','Regular','262 plank street','09876'),(10,'Jack','Brown','jack@example.com','1234567899','Subscriber','363 tank ave','54321');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_total`
--

DROP TABLE IF EXISTS `order_total`;
/*!50001 DROP VIEW IF EXISTS `order_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_total` AS SELECT 
 1 AS `OrderID`,
 1 AS `OrderTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `OrderDetailsID` int NOT NULL,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderDetailsID`),
  KEY `FK_OrderID_idx` (`OrderID`),
  KEY `FK_ProductID_idx` (`ProductID`),
  CONSTRAINT `FK_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,1),(4,4,4,2),(5,5,5,4),(6,5,8,2),(7,6,6,4),(8,7,7,7),(9,7,3,2),(10,8,9,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orderinfo_customerinfo`
--

DROP TABLE IF EXISTS `orderinfo_customerinfo`;
/*!50001 DROP VIEW IF EXISTS `orderinfo_customerinfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderinfo_customerinfo` AS SELECT 
 1 AS `OrderID`,
 1 AS `OrderDate`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Phone`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_CustomerID_idx` (`CustomerID`),
  CONSTRAINT `FK_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-01-01',1),(2,'2025-01-02',2),(3,'2025-01-02',1),(4,'2025-01-03',1),(5,'2025-01-03',2),(6,'2025-01-03',3),(7,'2025-01-04',4),(8,'2025-01-04',5),(9,'2025-01-04',6),(10,'2025-01-04',7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(60) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Price` decimal(7,2) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `StockQuantity` int NOT NULL,
  `SupplierID` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_SupplierID_idx` (`SupplierID`),
  CONSTRAINT `FK_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Ethiopia Beans','Floral and citrusy',15.99,'Coffee Beans',100,1),(2,'Colombia Beans','Rich and smooth',14.99,'Coffee Beans',120,2),(3,'French Press','800ml glass press',24.99,'Equipment',30,3),(4,'Mug Set','2 ceramic mugs',12.50,'Merchandise',50,4),(5,'Honduras Beans','Chocolatey flavor',13.99,'Coffee Beans',80,7),(6,'Reusable Filter','For pour-over',9.99,'Equipment',40,3),(7,'Costa Rica Beans','Bright and clean',16.50,'Coffee Beans',60,6),(8,'Cold Brew Kit','All-in-one kit',29.99,'Equipment',25,3),(9,'Tote Bag','Branded eco tote',11.00,'Merchandise',70,4),(10,'Guatemala Beans','Nutty and sweet',14.50,'Coffee Beans',90,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rev_per_product`
--

DROP TABLE IF EXISTS `rev_per_product`;
/*!50001 DROP VIEW IF EXISTS `rev_per_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rev_per_product` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `RevPerProduct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `stock_threshold`
--

DROP TABLE IF EXISTS `stock_threshold`;
/*!50001 DROP VIEW IF EXISTS `stock_threshold`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_threshold` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `StockQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Ethiopia Coffee Co.','alem@ethiopiacc.com','2125551111','Ethiopia'),(2,'Colombia Coffee Group','carlos@colcoffee.com','2125552222','Colombia'),(3,'Brew Gear Inc.','jamie@brewgear.com','2125553333','USA'),(4,'Cafe Merch LLC','lena@cafemerch.com','2125554444','USA'),(5,'GuateCoffee','erick@guatecoffee.com','2125557777','Guatemala'),(6,'Costa Beans Ltd.','laura@costabeans.com','2125556666','Costa Rica'),(7,'Honduras Select','miguel@hondusel.com','2125559999','Honduras'),(8,'Organic Roast','nina@organicroast.com','2125558888','Peru'),(9,'Brazilian Brews','tony@brazilbrew.com','2125550000','Brazil'),(10,'BrewKit Co.','sara@brewkit.com','2125551234','USA');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `totalorderspercustomer`
--

DROP TABLE IF EXISTS `totalorderspercustomer`;
/*!50001 DROP VIEW IF EXISTS `totalorderspercustomer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalorderspercustomer` AS SELECT 
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `TotalOrders`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zipcode`
--

DROP TABLE IF EXISTS `zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipcode` (
  `ZipID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(40) NOT NULL,
  `State` varchar(2) NOT NULL,
  PRIMARY KEY (`ZipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipcode`
--

LOCK TABLES `zipcode` WRITE;
/*!40000 ALTER TABLE `zipcode` DISABLE KEYS */;
INSERT INTO `zipcode` VALUES ('08642','Pen','PA'),('09876','Manhatten','NY'),('12345','Newark','NJ'),('13579','Clifton','OH'),('14793','Budlake','PA'),('24680','Garfiels','AL'),('25795','Chattam','NJ'),('54321','Time Square','NY'),('67890','Otter','NJ'),('97531','Paper','NJ');
/*!40000 ALTER TABLE `zipcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `order_total`
--

/*!50001 DROP VIEW IF EXISTS `order_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_total` AS select `o`.`OrderID` AS `OrderID`,sum((`p`.`Price` * `od`.`Quantity`)) AS `OrderTotal` from ((`orders` `o` join `orderdetails` `od` on((`o`.`OrderID` = `od`.`OrderID`))) join `product` `p` on((`od`.`ProductID` = `p`.`ProductID`))) group by `o`.`OrderID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderinfo_customerinfo`
--

/*!50001 DROP VIEW IF EXISTS `orderinfo_customerinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderinfo_customerinfo` AS select `o`.`OrderID` AS `OrderID`,`o`.`OrderDate` AS `OrderDate`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`c`.`Phone` AS `Phone`,`c`.`Email` AS `Email` from (`orders` `o` join `customer` `c` on((`o`.`CustomerID` = `c`.`CustomerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rev_per_product`
--

/*!50001 DROP VIEW IF EXISTS `rev_per_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rev_per_product` AS select `p`.`ProductID` AS `ProductID`,`p`.`ProductName` AS `ProductName`,sum((`p`.`Price` * `od`.`Quantity`)) AS `RevPerProduct` from (`product` `p` left join `orderdetails` `od` on((`p`.`ProductID` = `od`.`ProductID`))) group by `p`.`ProductID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_threshold`
--

/*!50001 DROP VIEW IF EXISTS `stock_threshold`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_threshold` AS select `product`.`ProductID` AS `ProductID`,`product`.`ProductName` AS `ProductName`,`product`.`StockQuantity` AS `StockQuantity` from `product` where (`product`.`StockQuantity` < 50) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalorderspercustomer`
--

/*!50001 DROP VIEW IF EXISTS `totalorderspercustomer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalorderspercustomer` AS select `c`.`CustomerID` AS `CustomerID`,`c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,count(0) AS `TotalOrders` from (`customer` `c` join `orders` `o` on((`c`.`CustomerID` = `o`.`CustomerID`))) group by `c`.`CustomerID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-06 14:42:29
