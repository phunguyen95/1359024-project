/*
Navicat MySQL Data Transfer

Source Server         : database
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : myproduct

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-07-30 13:07:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Manual transmission');
INSERT INTO `category` VALUES ('2', 'Auto transmission');
INSERT INTO `category` VALUES ('3', 'Sports motorbike');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `sku` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'EXCITER 150GP 2015', '45490000', '6', '1', '2015-04-26 23:59:30', '20', 'exciter-150gb-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('2', 'EXCITER 150 RC 2015', '44990000', '10', '1', '2015-04-26 23:59:30', '2', 'Exciter-150rc-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('3', 'EXCITER R 2014', '37000000', '6', '1', '2015-04-26 23:59:30', '2', 'exciter-r-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('4', 'JUPITER FI RC 2015', '28900000', '2', '1', '2015-04-26 23:59:30', null, 'jupiter-rc-2015.png', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('5', 'JUPITER GRAVITA FI 2015', '28600000', '4', '1', '2015-04-26 23:59:30', null, 'jupiter-gravity-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('6', 'JUPITER FI GRAVITA GREEN 2014', '28600000', '1', '1', '2015-04-26 23:59:30', null, 'JUPITER_FI_GRAVITA_GREEN_ 2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('7', 'JUPITER GP FI 2014', '29500000', '3', '1', '2015-04-26 23:59:30', null, 'Jupiter-gp-fi-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('8', 'SIRIUS PHANH CO 2015', '18100000', '2', '1', '2015-04-26 23:59:30', '2', 'sirius-phanhco-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('9', 'SIRIUS PHANH DIA 2015', '19100000', '5', '1', '2015-04-26 23:59:30', '1', 'sirius-phanhdia-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('10', 'SIRIUS FI VANH DUC 2015', '22990000', '5', '1', '2015-04-26 23:59:30', null, 'sirius-fivangduc-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('11', 'SIRIUS FI PHANH CO 2015', '19990000', '5', '1', '2015-04-26 23:59:30', '2', 'sirius-fiphanhco-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('12', 'SIRIUS FI PHANH DIA 2015', '20990000', '5', '1', '2015-04-26 23:59:30', '1', 'sirius-fiphanhdia-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('13', 'SIRIUS PHANH DIA 2014', '19100000', '5', '1', '2015-04-26 23:59:30', null, 'sirius-phanhdia-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('14', 'SIRIUS VANH DUC 2014', '21100000', '5', '1', '2015-04-26 23:59:30', null, 'sirius-vangduc-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('15', 'JUPITER FI RC 2014', '28900000', '5', '1', '2015-04-26 23:59:30', null, 'jupiter-rc-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('16', 'GRANDE DELUXE 2014', '41990000', '5', '2', '2015-04-26 23:59:30', '2', 'grande-deluxe-2014.png', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('17', 'GRANDE STD 2014', '39990000', '5', '2', '2015-05-06 00:00:17', null, 'grande-std-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('18', 'NOZZA 2014', '28900000', '5', '2', '2015-05-06 00:00:17', null, 'nozza-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('19', 'NOUVO FI SX 2015', '33900000', '5', '2', '2015-05-06 00:00:17', '1', 'nouvo-fi-sx-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('20', 'NOUVO FI RC 2015', '35900000', '5', '2', '2015-05-06 00:00:17', null, 'nouvo-fi-rc-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('21', 'NOUVO FI GP 2015', '36400000', '5', '2', '2015-05-06 00:00:17', null, 'nouvo-fi-gp-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('22', 'LUVIAS FI 2015', '27900000', '5', '2', '2015-05-06 00:00:17', null, 'luvias-fi-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('23', 'LUVIAS FI 2014', '27900000', '0', '2', '2015-05-06 00:00:17', '10', 'luvias-fi-2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('24', 'NOUVO SX GP 2014', '37200000', '7', '2', '2015-05-06 00:00:17', '11', 'Nouvo_SX_GP_2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('25', 'AIR BLADE 125CC', '51000000', '5', '2', '2015-05-06 00:00:17', '4', 'ab-125cc.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('26', 'SH 125cc', '65990000', '5', '2', '2015-05-06 00:00:17', null, 'sh-125.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('27', 'SH 150cc', '79990000', '5', '2', '2015-05-06 00:00:17', null, 'sh-150.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('28', 'SH MODE', '50490000', '5', '2', '2015-05-06 00:00:17', null, 'sh-mode.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('29', 'LEAD 2015', '38490000', '5', '2', '2015-05-06 00:00:17', '3', 'lead-2015.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('30', 'PCX 125cc', '54490000', '5', '2', '2015-05-06 00:00:17', null, 'pcx-125.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('31', 'MSX 125', '59990000', '5', '2', '2015-05-06 00:00:17', '6', 'msx-125.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('32', 'FZ150I GP 2014', '68900000', '5', '2', '2015-05-19 13:00:39', '2', 'fz150.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('33', 'FZ150I 2014', '67500000', '5', '2', '2015-05-19 13:00:39', '3', 'fz150i.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('34', 'Ducati Diavel Carbon', '787500000', '1', '3', '2015-05-19 13:00:39', '5', 'diavel-carbon-black.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('35', 'Honda CBR150R', '110000000', '1', '3', '2015-05-19 13:00:39', '2', 'hondacbr150.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('36', 'HONDA CBR1000 2015 ', '875000000', '1', '3', '2015-05-19 13:00:39', null, 'honda-cbr1000rr.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('37', 'HONDA CB1100 EX 2015', '510000000', '1', '3', '2015-05-19 13:00:39', null, 'honda-cb1100ex.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('38', 'Kawasaki Z1000 ABS 2014', '550000000', '1', '3', '2015-05-19 13:00:39', null, 'z1000.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('39', 'YAMAHA YZF R1 2015', '300000000', '3', '3', '2015-05-19 13:00:39', null, 'yzf-r1.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('40', 'Honda CBR300R 2014', '290000000', '3', '3', '2015-05-19 13:00:39', null, '2014-honda-cbr300r-white1.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('41', 'Vision 2014', '29900000', '5', '2', '2015-05-19 13:00:39', null, 'vision2014.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('42', 'Future 125', '30990000', '5', '1', '2015-05-19 13:00:39', null, 'future-125.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('43', 'Wave RSX ', '23990000', '5', '1', '2015-05-19 13:00:39', null, 'wave-rsx.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('44', 'Blade 110', '18100000', '5', '1', '2015-05-19 13:00:39', '1', 'blade-110.jpg', 'Powerful, smooth, flexible and characterful engine\r\nBrilliantly light, compact, agile and well braked chassis\r\nRefined and rider-friendly MotoGP-sourced electronics');
INSERT INTO `product` VALUES ('45', 'Super Dream', '18700000', '10', '1', '2015-05-19 13:00:39', '1', 'superdream.jpg', 'Reliable and cheap The dream has a flat seat which is great for loading luggage on. A short stocky design gives these motorbikes a good weight distribution with luggage. They have a rugged beaten up look that appeals to some people!');

-- ----------------------------
-- Table structure for receipt
-- ----------------------------
DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt` (
  `ReceiptID` int(11) NOT NULL AUTO_INCREMENT,
  `Client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TotalPrice` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `datestatus` datetime DEFAULT NULL,
  PRIMARY KEY (`ReceiptID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of receipt
-- ----------------------------
INSERT INTO `receipt` VALUES ('2', 'long', '250780000', '2015-06-02 13:36:49', '1', '2015-06-17 00:00:00');
INSERT INTO `receipt` VALUES ('3', 'long', '262080000', '2015-06-02 14:21:22', '1', '2015-06-16 00:00:00');
INSERT INTO `receipt` VALUES ('4', 'long', '61390000', '2015-06-03 01:06:07', '1', '2015-06-15 00:00:00');
INSERT INTO `receipt` VALUES ('5', 'long', '136470000', '2015-06-03 01:30:42', '0', null);
INSERT INTO `receipt` VALUES ('6', 'long', '111390000', '2015-06-03 01:34:07', '1', '2015-06-03 00:00:00');
INSERT INTO `receipt` VALUES ('7', 'long', '58400000', '2015-06-03 01:36:15', '0', null);
INSERT INTO `receipt` VALUES ('8', 'long', '348760000', '2015-06-03 02:05:40', '1', '2015-06-15 00:00:00');
INSERT INTO `receipt` VALUES ('9', 'long', '45490000', '2015-06-03 02:06:40', '1', '2015-06-15 00:00:00');
INSERT INTO `receipt` VALUES ('10', 'long', '44990000', '2015-06-03 02:07:40', '1', '2015-06-15 00:00:00');
INSERT INTO `receipt` VALUES ('11', 'long', '109800000', '2015-06-13 00:00:44', '0', null);
INSERT INTO `receipt` VALUES ('12', 'long', '127900000', '2015-06-12 23:02:39', '0', null);
INSERT INTO `receipt` VALUES ('13', 'long', '18100000', '2015-06-12 23:06:40', '1', '2015-06-15 00:00:00');
INSERT INTO `receipt` VALUES ('14', 'long', '55500000', '2015-06-12 23:23:31', '0', null);
INSERT INTO `receipt` VALUES ('15', 'long', '73600000', '2015-06-12 23:24:31', '0', null);
INSERT INTO `receipt` VALUES ('16', 'long', '18100000', '2015-06-12 23:29:31', '0', null);
INSERT INTO `receipt` VALUES ('17', 'long', '19100000', '2015-06-12 23:35:50', '0', null);
INSERT INTO `receipt` VALUES ('18', 'long', '37200000', '2015-06-12 23:51:20', '0', null);
INSERT INTO `receipt` VALUES ('19', 'long', '96280000', '2015-06-13 23:10:55', '0', null);
INSERT INTO `receipt` VALUES ('20', 'long', '217560000', '2015-06-04 01:22:19', '1', '2015-06-04 00:00:00');
INSERT INTO `receipt` VALUES ('21', 'vanlong2712', '2300000000', '2015-06-17 01:49:32', null, null);
INSERT INTO `receipt` VALUES ('22', 'vanlong2712', '90500000', '2015-06-17 01:52:33', null, null);
INSERT INTO `receipt` VALUES ('23', 'vanlong2712', '2762500000', '2015-06-17 16:34:49', null, null);
INSERT INTO `receipt` VALUES ('24', 'phu', '55500000', '2015-07-28 23:56:36', null, null);

-- ----------------------------
-- Table structure for receiptdetail
-- ----------------------------
DROP TABLE IF EXISTS `receiptdetail`;
CREATE TABLE `receiptdetail` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `ReceiptID` int(11) DEFAULT NULL,
  `SKU` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of receiptdetail
-- ----------------------------
INSERT INTO `receiptdetail` VALUES ('1', '2', '3', '37000000', '2', '74000000');
INSERT INTO `receiptdetail` VALUES ('2', '2', '1', '45490000', '2', '90980000');
INSERT INTO `receiptdetail` VALUES ('3', '2', '5', '28600000', '3', '85800000');
INSERT INTO `receiptdetail` VALUES ('4', '3', '1', '45490000', '1', '45490000');
INSERT INTO `receiptdetail` VALUES ('5', '3', '2', '44990000', '1', '44990000');
INSERT INTO `receiptdetail` VALUES ('6', '3', '5', '28600000', '5', '143000000');
INSERT INTO `receiptdetail` VALUES ('7', '3', '6', '28600000', '1', '28600000');
INSERT INTO `receiptdetail` VALUES ('8', '4', '45', '18700000', '2', '37400000');
INSERT INTO `receiptdetail` VALUES ('9', '4', '43', '23990000', '1', '23990000');
INSERT INTO `receiptdetail` VALUES ('10', '5', '1', '45490000', '3', '136470000');
INSERT INTO `receiptdetail` VALUES ('11', '6', '1', '45490000', '1', '45490000');
INSERT INTO `receiptdetail` VALUES ('12', '6', '3', '37000000', '1', '37000000');
INSERT INTO `receiptdetail` VALUES ('13', '6', '4', '28900000', '1', '28900000');
INSERT INTO `receiptdetail` VALUES ('14', '7', '7', '29500000', '1', '29500000');
INSERT INTO `receiptdetail` VALUES ('15', '7', '4', '28900000', '1', '28900000');
INSERT INTO `receiptdetail` VALUES ('16', '8', '2', '44990000', '4', '179960000');
INSERT INTO `receiptdetail` VALUES ('17', '8', '3', '37000000', '3', '111000000');
INSERT INTO `receiptdetail` VALUES ('18', '8', '4', '28900000', '2', '57800000');
INSERT INTO `receiptdetail` VALUES ('19', '9', '1', '45490000', '1', '45490000');
INSERT INTO `receiptdetail` VALUES ('20', '10', '2', '44990000', '1', '44990000');
INSERT INTO `receiptdetail` VALUES ('21', '11', '45', '18700000', '2', '37400000');
INSERT INTO `receiptdetail` VALUES ('22', '11', '44', '18100000', '2', '36200000');
INSERT INTO `receiptdetail` VALUES ('23', '11', '8', '18100000', '2', '36200000');
INSERT INTO `receiptdetail` VALUES ('24', '12', '45', '18700000', '2', '37400000');
INSERT INTO `receiptdetail` VALUES ('25', '12', '44', '18100000', '2', '36200000');
INSERT INTO `receiptdetail` VALUES ('26', '12', '8', '18100000', '3', '54300000');
INSERT INTO `receiptdetail` VALUES ('27', '13', '8', '18100000', '1', '18100000');
INSERT INTO `receiptdetail` VALUES ('28', '14', '8', '18100000', '1', '18100000');
INSERT INTO `receiptdetail` VALUES ('29', '14', '45', '18700000', '2', '37400000');
INSERT INTO `receiptdetail` VALUES ('30', '15', '8', '18100000', '2', '36200000');
INSERT INTO `receiptdetail` VALUES ('31', '15', '45', '18700000', '2', '37400000');
INSERT INTO `receiptdetail` VALUES ('32', '16', '8', '18100000', '1', '18100000');
INSERT INTO `receiptdetail` VALUES ('33', '17', '9', '19100000', '1', '19100000');
INSERT INTO `receiptdetail` VALUES ('34', '18', '44', '18100000', '1', '18100000');
INSERT INTO `receiptdetail` VALUES ('35', '18', '13', '19100000', '1', '19100000');
INSERT INTO `receiptdetail` VALUES ('36', '19', '44', '18100000', '3', '54300000');
INSERT INTO `receiptdetail` VALUES ('37', '19', '12', '20990000', '2', '41980000');
INSERT INTO `receiptdetail` VALUES ('38', '20', '31', '59990000', '1', '59990000');
INSERT INTO `receiptdetail` VALUES ('39', '20', '1', '45490000', '3', '136470000');
INSERT INTO `receiptdetail` VALUES ('40', '20', '14', '21100000', '1', '21100000');
INSERT INTO `receiptdetail` VALUES ('41', '21', '38', '550000000', '1', '550000000');
INSERT INTO `receiptdetail` VALUES ('42', '21', '36', '875000000', '2', '1750000000');
INSERT INTO `receiptdetail` VALUES ('43', '22', '44', '18100000', '5', '90500000');
INSERT INTO `receiptdetail` VALUES ('44', '23', '34', '787500000', '1', '787500000');
INSERT INTO `receiptdetail` VALUES ('45', '23', '36', '875000000', '1', '875000000');
INSERT INTO `receiptdetail` VALUES ('46', '23', '38', '550000000', '2', '1100000000');
INSERT INTO `receiptdetail` VALUES ('47', '24', '44', '18100000', '1', '18100000');
INSERT INTO `receiptdetail` VALUES ('48', '24', '45', '18700000', '2', '37400000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '1', 'admin', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'phu', 'phu', '2', 'phu', 'nguyen', '1995-09-09', 'Male', '0925404004', '21 Tran Quang Dieu ', 'phu.nguyen09995@gmail.com');
