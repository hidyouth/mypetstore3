/*
 Navicat MySQL Data Transfer

 Source Server         : PetStore
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : mypetstore

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 29/12/2022 21:18:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `firstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `lastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `addr2` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `account` VALUES ('2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2');
INSERT INTO `account` VALUES ('3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3');
INSERT INTO `account` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('CHS', '1198451301@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15560125287');
INSERT INTO `account` VALUES ('j2ee', 'yourname@yourdomain.com', 'ABC', 'XY', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (0, 'j2ee', 'Cui Haosen', 'Hunan', 'Changsha', 'Yuhua', 'Railway College');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
  `favcategory` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `bannername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `itemId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `productName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `listprice` decimal(10, 2) NULL DEFAULT NULL,
  `total_cost` decimal(10, 2) NULL DEFAULT NULL,
  `productId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', '<image src=\"images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `category` VALUES ('CATS', 'Cats', '<image src=\"images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', '<image src=\"images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `category` VALUES ('FISH', 'Fish', '<image src=\"images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', '<image src=\"images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `itemid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', 10000);
INSERT INTO `inventory` VALUES ('EST-10', 10000);
INSERT INTO `inventory` VALUES ('EST-11', 10000);
INSERT INTO `inventory` VALUES ('EST-12', 10000);
INSERT INTO `inventory` VALUES ('EST-13', 10000);
INSERT INTO `inventory` VALUES ('EST-14', 10000);
INSERT INTO `inventory` VALUES ('EST-15', 10000);
INSERT INTO `inventory` VALUES ('EST-16', 10000);
INSERT INTO `inventory` VALUES ('EST-17', 10000);
INSERT INTO `inventory` VALUES ('EST-18', 10000);
INSERT INTO `inventory` VALUES ('EST-19', 10000);
INSERT INTO `inventory` VALUES ('EST-2', 10000);
INSERT INTO `inventory` VALUES ('EST-20', 10000);
INSERT INTO `inventory` VALUES ('EST-21', 10000);
INSERT INTO `inventory` VALUES ('EST-22', 10000);
INSERT INTO `inventory` VALUES ('EST-23', 10000);
INSERT INTO `inventory` VALUES ('EST-24', 10000);
INSERT INTO `inventory` VALUES ('EST-25', 10000);
INSERT INTO `inventory` VALUES ('EST-26', 10000);
INSERT INTO `inventory` VALUES ('EST-27', 10000);
INSERT INTO `inventory` VALUES ('EST-28', 10000);
INSERT INTO `inventory` VALUES ('EST-3', 10000);
INSERT INTO `inventory` VALUES ('EST-4', 10000);
INSERT INTO `inventory` VALUES ('EST-5', 10000);
INSERT INTO `inventory` VALUES ('EST-6', 10000);
INSERT INTO `inventory` VALUES ('EST-7', 10000);
INSERT INTO `inventory` VALUES ('EST-8', 10000);
INSERT INTO `inventory` VALUES ('EST-9', 10000);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `productid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `listprice` decimal(10, 2) NULL DEFAULT NULL,
  `unitcost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier` int NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr3` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr4` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `attr5` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_item_2`(`supplier` ASC) USING BTREE,
  INDEX `itemProd`(`productid` ASC) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Large', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotted Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Venomless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Rattleless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', 18.50, 12.00, 1, 'P', 'Green Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', 58.50, 12.00, 1, 'P', 'Tailless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', 23.50, 12.00, 1, 'P', 'With tail', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', 193.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', 15.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Small', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', 5.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', 5.29, 1.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', 135.50, 100.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', 145.49, 100.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', 255.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', 325.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', 125.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', 18.50, 12.00, 1, 'P', 'Toothless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotted', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Male Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Female Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', 18.50, 12.00, 1, 'P', 'Male Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotless Male Puppy', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `itemid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `quantity` int NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lineitem
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int NOT NULL,
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipaddr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `shipcity` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipstate` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipzip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shipcountry` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billaddr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billaddr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `billcity` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billstate` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billzip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billcountry` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `courier` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `totalprice` decimal(10, 2) NOT NULL,
  `billtofirstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `billtolastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shiptofirstname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `shiptolastname` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `creditcard` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `exprdate` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cardtype` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `locale` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `orderid` int NOT NULL,
  `linenum` int NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `category` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descnn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productCat`(`category` ASC) USING BTREE,
  INDEX `productName`(`name` ASC) USING BTREE,
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', '<image src=\"image/amazonparrot.png\">', 'Great companion for up to 75 years');
INSERT INTO `product` VALUES ('AV-SB-02', 'BIRDS', 'Finch', '<image src=\"image/finch.jpg\">', 'Great stress reliever');
INSERT INTO `product` VALUES ('FI-FW-01', 'FISH', 'Koi', '<image src=\"image/koi.jpg\">', 'Fresh Water fish from Japan');
INSERT INTO `product` VALUES ('FI-FW-02', 'FISH', 'Goldfish', '<image src=\"image/goldfish.jpg\">', 'Fresh Water fish from China');
INSERT INTO `product` VALUES ('FI-SW-01', 'FISH', 'Angelfish', '<image src=\"image/angelfish.jpg\">', 'Salt Water fish from Australia');
INSERT INTO `product` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', '<image src=\"image/tigershark.jpg\">', 'Salt Water fish from Australia');
INSERT INTO `product` VALUES ('FL-DLH-02', 'CATS', 'Persian', '<image src=\"image/persian.jpg\">', 'Friendly house cat, doubles as a princess');
INSERT INTO `product` VALUES ('FL-DSH-01', 'CATS', 'Manx', '<image src=\"image/manx.jpg\">', 'Great for reducing mouse populations');
INSERT INTO `product` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', '<image src=\"image/bulldog.jpg\">', 'Friendly dog from England');
INSERT INTO `product` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', '<image src=\"image/chihuahua.jpg\">', 'Great companion dog');
INSERT INTO `product` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', '<image src=\"image/dalmation.jpg\">', 'Great dog for a Fire Station');
INSERT INTO `product` VALUES ('K9-PO-02', 'DOGS', 'Poodle', '<image src=\"image/poodle.jpg\">', 'Cute dog from France');
INSERT INTO `product` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', '<image src=\"image/goldenretriever.jpg\">', 'Great family dog');
INSERT INTO `product` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', '<image src=\"image/labradorretriever.jpg\">', 'Great hunting dog');
INSERT INTO `product` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', '<image src=\"image/iguana.jpg\">', 'Friendly green friend');
INSERT INTO `product` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', '<image src=\"image/rattlesnake.jpg\">', 'Doubles as a watch dog');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `userid` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `langpref` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `favcategory` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `mylistopt` int NULL DEFAULT NULL,
  `banneropt` int NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('ACID', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('j2ee', 'english', 'DOGS', 1, 1);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `userid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `records` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `isitem` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('j2ee', 'EST-4 -----------------------------------------------------------------------------2022-11-13 at 02:22:35 CST', 1);
INSERT INTO `record` VALUES ('j2ee', 'EST-5 -----------------------------------------------------------------------------2022-11-13 at 02:22:55 CST', 1);
INSERT INTO `record` VALUES ('2', 'EST-6 -----------------------------------------------------------------------------2022-11-13 at 14:20:32 CST', 1);
INSERT INTO `record` VALUES ('2', 'EST-6 -----------------------------------------------------------------------------2022-11-13 at 14:28:09 CST', 1);
INSERT INTO `record` VALUES ('2', 'EST-6 -----------------------------------------------------------------------------2022-11-13 at 14:30:25 CST', 1);
INSERT INTO `record` VALUES ('2', 'EST-26 -----------------------------------------------------------------------------2022-11-13 at 14:34:31 CST', 1);
INSERT INTO `record` VALUES ('j2ee', 'EST-4 -----------------------------------------------------------------------------2022-11-13 at 14:36:26 CST', 1);
INSERT INTO `record` VALUES ('j2ee', 'EST-6 -----------------------------------------------------------------------------2022-11-13 at 14:45:37 CST', 1);
INSERT INTO `record` VALUES ('j2ee', '登录', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览DOGS', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览K9-PO-02', 0);
INSERT INTO `record` VALUES ('j2ee', 'EST-8 -----------------------------------------------------------------------------2022-11-13 at 15:15:15 CST', 1);
INSERT INTO `record` VALUES ('j2ee', '登录', 0);
INSERT INTO `record` VALUES ('3', '登录 -----------------------------2022-11-13 at 15:24:20 CST', 0);
INSERT INTO `record` VALUES ('3', '浏览FISH -----------------------------2022-11-13 at 15:24:36 CST', 0);
INSERT INTO `record` VALUES ('3', '浏览FI-FW-01 -----------------------------2022-11-13 at 15:24:38 CST', 0);
INSERT INTO `record` VALUES ('3', 'EST-4 -----------------------------2022-11-13 at 15:24:39 CST', 1);
INSERT INTO `record` VALUES ('3', '加入购物车EST-4 -----------------------------2022-11-13 at 15:24:46 CST', 0);
INSERT INTO `record` VALUES ('3', '浏览FISH -----------------------------2022-11-13 at 15:25:04 CST', 0);
INSERT INTO `record` VALUES ('3', '浏览FI-FW-01 -----------------------------2022-11-13 at 15:25:06 CST', 0);
INSERT INTO `record` VALUES ('3', 'EST-4 -----------------------------2022-11-13 at 15:25:07 CST', 1);
INSERT INTO `record` VALUES ('3', '下单EST-4 -----------------------------2022-11-13 at 15:25:22 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-26 at 20:20:42 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 11:56:11 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 11:56:13 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:01:37 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:01:40 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:02:04 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:02:47 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:02:54 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:04:02 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:05:57 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:06:00 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:10:53 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:10:55 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:20:20 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:20:22 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:23:33 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:23:35 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:24:16 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 12:24:17 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 12:44:52 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 14:00:01 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 15:52:08 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 15:52:10 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 15:59:33 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 15:59:36 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:15:27 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 16:15:29 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 16:16:01 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:16:29 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 16:16:30 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:18:34 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 16:18:35 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:19:21 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-28 at 16:19:25 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:39:04 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 16:39:06 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:39:40 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 16:39:41 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:43:47 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 16:43:49 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:51:43 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 16:51:45 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 16:59:13 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 16:59:14 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 16:59:59 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 17:05:53 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 17:05:54 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 17:08:05 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 17:08:16 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 17:08:18 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 17:14:28 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 17:14:30 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-17 -----------------------------2022-12-28 at 17:14:36 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 17:15:45 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 17:15:46 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-17 -----------------------------2022-12-28 at 17:15:49 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-17 -----------------------------2022-12-28 at 17:16:54 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 17:20:14 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-17 -----------------------------2022-12-28 at 17:20:14 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-28 at 17:20:26 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-28 at 17:20:27 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-17 -----------------------------2022-12-28 at 17:20:39 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 14:37:46 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-29 at 14:37:48 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-16 -----------------------------2022-12-29 at 14:37:50 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-16 -----------------------------2022-12-29 at 14:37:51 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-16 -----------------------------2022-12-29 at 14:37:52 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-16 -----------------------------2022-12-29 at 14:41:53 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 14:42:11 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-29 at 14:42:12 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-16 -----------------------------2022-12-29 at 14:42:14 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 15:23:15 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 15:33:29 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-29 at 15:33:31 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-14 -----------------------------2022-12-29 at 15:33:34 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:15:40 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:19:52 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:21:43 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:23:01 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:23:42 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:26:03 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:29:21 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:31:26 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:34:05 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:44:26 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:48:46 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:55:02 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-29 at 16:55:04 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-29 at 16:55:16 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-16 -----------------------------2022-12-29 at 16:55:17 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 16:57:35 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-29 at 16:57:39 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-29 at 16:58:34 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:00:50 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-29 at 17:00:52 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:04:50 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DLH-02 -----------------------------2022-12-29 at 17:04:52 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-17 -----------------------------2022-12-29 at 17:04:53 CST', 0);
INSERT INTO `record` VALUES ('j2ee', 'EST-17 -----------------------------2022-12-29 at 17:05:30 CST', 1);
INSERT INTO `record` VALUES ('j2ee', 'EST-17 -----------------------------2022-12-29 at 17:05:35 CST', 1);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:08:51 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:11:07 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:12:39 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:15:03 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:15:42 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:16:22 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:17:32 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:24:59 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:25:56 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 17:32:44 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:00:22 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:05:57 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:08:41 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-14 -----------------------------2022-12-29 at 19:09:13 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:13:39 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-14 -----------------------------2022-12-29 at 19:13:48 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:15:06 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:17:05 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-14 -----------------------------2022-12-29 at 19:17:57 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-14 -----------------------------2022-12-29 at 19:18:40 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:20:00 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:35:54 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 19:37:03 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-16 -----------------------------2022-12-29 at 19:37:13 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 20:04:13 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-29 at 20:04:20 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-14 -----------------------------2022-12-29 at 20:04:22 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-14 -----------------------------2022-12-29 at 20:04:26 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 20:06:17 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-29 at 20:06:19 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-15 -----------------------------2022-12-29 at 20:06:22 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-15 -----------------------------2022-12-29 at 20:06:26 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-15 -----------------------------2022-12-29 at 20:06:29 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-29 at 20:08:49 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-15 -----------------------------2022-12-29 at 20:10:47 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '登录 -----------------------------2022-12-29 at 20:11:01 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览FL-DSH-01 -----------------------------2022-12-29 at 20:11:07 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-14 -----------------------------2022-12-29 at 20:11:12 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-14 -----------------------------2022-12-29 at 20:12:23 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '加入购物车EST-15 -----------------------------2022-12-29 at 20:12:32 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '下单EST-15 -----------------------------2022-12-29 at 20:13:58 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览REPTILES -----------------------------2022-12-29 at 20:14:12 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览CATS -----------------------------2022-12-29 at 20:14:16 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览BIRDS -----------------------------2022-12-29 at 20:14:18 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览DOGS -----------------------------2022-12-29 at 20:14:23 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览K9-PO-02 -----------------------------2022-12-29 at 20:14:55 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览K9-RT-02 -----------------------------2022-12-29 at 20:14:59 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览BIRDS -----------------------------2022-12-29 at 20:15:07 CST', 0);
INSERT INTO `record` VALUES ('j2ee', '浏览CATS -----------------------------2022-12-29 at 20:15:11 CST', 0);
INSERT INTO `record` VALUES ('CHS', '登录 -----------------------------2022-12-29 at 21:12:57 CST', 0);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `nextid` int NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('ordernum', 1000);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
  `username` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('1', '1');
INSERT INTO `signon` VALUES ('2', '2');
INSERT INTO `signon` VALUES ('3', '3');
INSERT INTO `signon` VALUES ('ACID', 'ACID');
INSERT INTO `signon` VALUES ('CHS', 'cuihaosen');
INSERT INTO `signon` VALUES ('j2ee', 'j2ee');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `suppid` int NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `addr2` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `zip` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

-- ----------------------------
-- Table structure for userorder
-- ----------------------------
DROP TABLE IF EXISTS `userorder`;
CREATE TABLE `userorder`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `productid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `itemId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `num` int NULL DEFAULT NULL,
  `total_cost` decimal(10, 2) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `productname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userorder
-- ----------------------------
INSERT INTO `userorder` VALUES (12, 'j2ee', '<image src=\"image/manx.jpg\">', 'FL-DSH-01', 'EST-15', 2, 47.00, 'Hunan,Changsha,Yuhua,Railway College,Cui Haosen', 'Manx');

SET FOREIGN_KEY_CHECKS = 1;
