-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.21-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE vape;
DROP DATABASE vape;
CREATE DATAbase vape;

-- vape 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `vape`;
CREATE DATABASE IF NOT EXISTS `vape` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vape`;

-- 테이블 vape.board 구조 내보내기
DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `BNum` int(11) NOT NULL,
  `BTitle` varchar(1000) NOT NULL,
  `BContent` varchar(3000) NOT NULL,
  `BDate` datetime NOT NULL,
  `id` varchar(1000) NOT NULL,
  `authority` int(11) NOT NULL,
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`BNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 vape.board:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT IGNORE INTO `board` (`BNum`, `BTitle`, `BContent`, `BDate`, `id`, `authority`, `views`) VALUES
(1,"Lorem ipsum dolor","Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat","05/03/2022","Jonah",1,1),(2,"Lorem","diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae,","14/08/2021","Christian",1,1),(3,"Lorem ipsum dolor sit","Proin non massa non ante bibendum ullamcorper. Duis cursus, diam","05/08/2020","Kelly",1,1),(4,"Lorem ipsum dolor","posuere, enim nisl elementum purus, accumsan interdum libero dui nec","04/10/2021","Chancellor",1,1),(5,"Lorem ipsum dolor sit","non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum.","31/01/2022","Lane",1,1),(6,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","tellus faucibus leo, in lobortis tellus justo sit amet nulla.","17/11/2020","Bruce",1,1),(7,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec","05/01/2022","Ryan",1,1),(8,"Lorem ipsum dolor","risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed","24/04/2021","Kieran",1,1),(9,"Lorem ipsum dolor sit amet,","Aenean gravida nunc sed pede. Cum sociis natoque penatibus et","28/01/2022","Yardley",1,1),(10,"Lorem ipsum dolor sit amet,","augue id ante dictum cursus. Nunc mauris elit, dictum eu,","05/09/2021","Geoffrey",1,1),(11,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus.","12/07/2021","Uriah",1,1),(12,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus","18/07/2020","Hu",1,1),(13,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","a, auctor non, feugiat nec, diam. Duis mi enim, condimentum","30/07/2020","Logan",1,1),(14,"Lorem ipsum dolor sit amet,","fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit.","06/02/2021","Cameron",1,1),(15,"Lorem ipsum","mauris ut mi. Duis risus odio, auctor vitae, aliquet nec,","26/11/2021","Calvin",1,1),(16,"Lorem ipsum","primis in faucibus orci luctus et ultrices posuere cubilia Curae;","13/05/2021","Oliver",1,1),(17,"Lorem","eget mollis lectus pede et risus. Quisque libero lacus, varius","06/03/2021","Cairo",1,1),(18,"Lorem ipsum","leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor","14/04/2021","Samuel",1,1),(19,"Lorem ipsum dolor sit amet, consectetuer adipiscing","nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet.","09/10/2020","Merrill",1,1),(20,"Lorem ipsum dolor","Cras eget nisi dictum augue malesuada malesuada. Integer id magna","08/11/2020","Michael",1,1),(21,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem,","18/07/2021","Cruz",1,1),(22,"Lorem","aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,","22/10/2021","Amir",1,1),(23,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","tortor at risus. Nunc ac sem ut dolor dapibus gravida.","22/05/2020","Beau",1,1),(24,"Lorem ipsum dolor sit amet,","eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce","29/05/2021","George",1,1),(25,"Lorem ipsum dolor sit amet, consectetuer adipiscing","Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper","11/07/2020","Uriah",1,1),(26,"Lorem ipsum dolor sit","neque. In ornare sagittis felis. Donec tempor, est ac mattis","26/09/2021","Troy",1,1),(27,"Lorem ipsum dolor sit amet, consectetuer","a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris","08/10/2021","Carlos",1,1),(28,"Lorem ipsum dolor sit amet,","orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit","11/08/2020","Hector",1,1),(29,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit","03/08/2020","Adam",1,1),(30,"Lorem ipsum dolor sit amet, consectetuer","bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum,","05/01/2021","Rashad",1,1),(31,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit","12/05/2020","Barclay",1,1),(32,"Lorem ipsum dolor sit amet,","leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,","22/10/2021","Bruno",1,1),(33,"Lorem ipsum dolor","lorem eu metus. In lorem. Donec elementum, lorem ut aliquam","18/01/2021","Blaze",1,1),(34,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis","09/12/2020","Byron",1,1),(35,"Lorem ipsum dolor sit amet, consectetuer adipiscing","dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu","26/07/2020","Amir",1,1),(36,"Lorem ipsum dolor sit","dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et","30/07/2020","Eagan",1,1),(37,"Lorem ipsum dolor sit amet, consectetuer","magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec","04/05/2020","Thor",1,1),(38,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.","17/11/2021","Wing",1,1),(39,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.","30/05/2020","Colorado",1,1),(40,"Lorem ipsum dolor sit amet, consectetuer adipiscing","lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus","11/06/2021","Cain",1,1),(41,"Lorem ipsum","sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis","11/09/2021","Berk",1,1),(42,"Lorem ipsum","neque. Morbi quis urna. Nunc quis arcu vel quam dignissim","01/12/2021","Eaton",1,1),(43,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu","21/06/2020","Nissim",1,1),(44,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","aptent taciti sociosqu ad litora torquent per conubia nostra, per","12/06/2020","Cade",1,1),(45,"Lorem ipsum dolor sit amet,","eget mollis lectus pede et risus. Quisque libero lacus, varius","11/03/2021","Nero",1,1),(46,"Lorem ipsum dolor sit amet, consectetuer adipiscing","nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,","28/08/2020","Honorato",1,1),(47,"Lorem ipsum dolor sit amet,","vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id","17/09/2020","Talon",1,1),(48,"Lorem ipsum dolor sit","ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper","07/01/2022","Fitzgerald",1,1),(49,"Lorem ipsum dolor sit amet,","at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum","24/11/2021","Patrick",1,1),(50,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue","30/01/2021","Hammett",1,1),(51,"Lorem ipsum dolor","luctus sit amet, faucibus ut, nulla. Cras eu tellus eu","08/03/2020","Bradley",1,1),(52,"Lorem ipsum dolor sit amet, consectetuer adipiscing","ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac","21/02/2022","Price",1,1),(53,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","eleifend, nunc risus varius orci, in consequat enim diam vel","11/03/2020","Brett",1,1),(54,"Lorem ipsum dolor sit amet, consectetuer","pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna.","23/09/2021","Colt",1,1),(55,"Lorem ipsum dolor sit amet,","Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy","18/03/2021","Cedric",1,1),(56,"Lorem ipsum dolor","neque non quam. Pellentesque habitant morbi tristique senectus et netus","18/06/2020","Ryan",1,1),(57,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede.","16/04/2021","Amery",1,1),(58,"Lorem ipsum dolor sit amet, consectetuer adipiscing","ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo","17/08/2020","Malcolm",1,1),(59,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","dui quis accumsan convallis, ante lectus convallis est, vitae sodales","10/05/2021","Wade",1,1),(60,"Lorem ipsum dolor sit amet, consectetuer adipiscing","magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla","08/01/2021","Forrest",1,1),(61,"Lorem ipsum dolor sit amet, consectetuer","erat vitae risus. Duis a mi fringilla mi lacinia mattis.","01/03/2021","Kyle",1,1),(62,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","libero lacus, varius et, euismod et, commodo at, libero. Morbi","16/07/2021","Palmer",1,1),(63,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","mattis ornare, lectus ante dictum mi, ac mattis velit justo","18/01/2022","Emmanuel",1,1),(64,"Lorem ipsum dolor sit amet, consectetuer adipiscing","Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis","19/09/2021","Lester",1,1),(65,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat.","17/07/2020","Mason",1,1),(66,"Lorem ipsum dolor sit amet, consectetuer","scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada","30/12/2020","Sylvester",1,1),(67,"Lorem ipsum dolor sit amet, consectetuer adipiscing","enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin","23/04/2020","Barclay",1,1),(68,"Lorem ipsum dolor sit","mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed","24/06/2020","Yoshio",1,1),(69,"Lorem ipsum","penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean","20/02/2021","Orson",1,1),(70,"Lorem ipsum dolor","viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum","28/07/2021","Peter",1,1),(71,"Lorem ipsum dolor sit","tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi","05/08/2020","Christian",1,1),(72,"Lorem ipsum","placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,","08/05/2020","Steven",1,1),(73,"Lorem ipsum dolor sit","dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu","30/04/2021","Ahmed",1,1),(74,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus","31/01/2021","Edan",1,1),(75,"Lorem ipsum dolor sit","vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus","30/09/2020","David",1,1),(76,"Lorem ipsum dolor","Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum","12/01/2021","Rudyard",1,1),(77,"Lorem ipsum dolor sit","eget metus eu erat semper rutrum. Fusce dolor quam, elementum","24/09/2021","Nathan",1,1),(78,"Lorem ipsum dolor sit amet,","Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero.","01/06/2021","Laith",1,1),(79,"Lorem ipsum dolor sit","Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla","05/08/2021","Odysseus",1,1),(80,"Lorem ipsum dolor sit","dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui.","24/09/2020","Linus",1,1),(81,"Lorem ipsum dolor sit","neque non quam. Pellentesque habitant morbi tristique senectus et netus","13/10/2020","Solomon",1,1),(82,"Lorem ipsum dolor sit amet,","vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque","21/08/2021","Maxwell",1,1),(83,"Lorem ipsum","ornare sagittis felis. Donec tempor, est ac mattis semper, dui","12/10/2021","Colton",1,1),(84,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet","19/02/2022","Chester",1,1),(85,"Lorem ipsum dolor sit amet, consectetuer adipiscing","Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu","10/03/2021","Kieran",1,1),(86,"Lorem","ipsum primis in faucibus orci luctus et ultrices posuere cubilia","26/01/2022","Jameson",1,1),(87,"Lorem ipsum dolor sit amet,","Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat.","15/06/2021","Griffith",1,1),(88,"Lorem ipsum dolor sit amet, consectetuer","ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel","09/07/2020","Clayton",1,1),(89,"Lorem ipsum dolor sit amet,","dui, in sodales elit erat vitae risus. Duis a mi","20/05/2021","Daniel",1,1),(90,"Lorem","lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.","08/04/2020","Clinton",1,1),(91,"Lorem ipsum dolor sit amet, consectetuer adipiscing","sem mollis dui, in sodales elit erat vitae risus. Duis","22/07/2020","Kaseem",1,1),(92,"Lorem ipsum","sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis","02/12/2020","Chaney",1,1),(93,"Lorem ipsum dolor sit amet,","cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin","03/03/2021","Craig",1,1),(94,"Lorem ipsum dolor","magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor","18/09/2021","Bradley",1,1),(95,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,","18/11/2021","Laith",1,1),(96,"Lorem ipsum dolor sit amet, consectetuer","imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at","10/05/2021","Perry",1,1),(97,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed","nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc.","16/04/2020","Lars",1,1),(98,"Lorem","tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec","07/11/2020","Octavius",1,1),(99,"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur","ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et","19/12/2021","Henry",1,1),(100,"Lorem ipsum dolor sit amet, consectetuer adipiscing","luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis.","14/01/2021","Arden",1,1);

/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 vape.orders 구조 내보내기
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `cartID` varchar(1000) NOT NULL,
  `Odate` datetime NOT NULL,
  `id` varchar(1000) NOT NULL,
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 vape.orders:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT IGNORE INTO `orders` (`cartID`, `Odate`, `id`) VALUES
	('1DAB81E1681A92123223D721684DF122', '2021-02-03 12:09:02', '1'),
	('45890569BDE518537544FA1ECC46D12D42039529', '2021-02-05 14:26:44', 'satelite54'),
	('6488834A2900504CD11BCB833B4C9D3F', '2021-02-03 11:39:17', '1'),
	('71514BCEED194C9B5D8424DD127B9DAB', '2021-02-03 11:52:38', '1'),
	('787E5DB053825892D2B1CC218F0C32A0', '2021-02-03 12:11:26', '1'),
	('996DBC2D0806C66E4317B2460354A8A9', '2021-02-03 14:11:58', '1'),
	('C0CEB564985A8B5ECDF737F4B9A07074', '2021-02-03 12:54:22', '1'),
	('DDA8FBA0C69050DDD2D4598EDB592FD7', '2021-02-03 11:55:08', '1');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 테이블 vape.products 구조 내보내기
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pname` varchar(500) NOT NULL,
  `code` varchar(500) NOT NULL,
  `manufacturer` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `imgname` varchar(1000) NOT NULL,
  `adddate` datetime NOT NULL,
  `producttype` varchar(1000) NOT NULL,
  `detailedimgpath` varchar(1000) NOT NULL,
  PRIMARY KEY (`pname`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 vape.products:~42 rows (대략적) 내보내기
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT IGNORE INTO `products` (`pname`, `code`, `manufacturer`, `price`, `stock`, `imgname`, `adddate`, `producttype`, `detailedimgpath`) VALUES
	('100ml Juice Co. 레몬 타르트 100ml  Lemon', 'P0000HCW', '브랙퍼스트', 35000, 112, '레몬.jpg', '2021-02-03 19:45:47', 'liquid', '레몬.png'),
	('100ml Juice Co. 브랙퍼스트 카놀리 100ml - Breakfast Cannoli (원본액상)', 'P0000HCU', '브랙퍼스트', 35000, 102, '카놀리.jpg', '2021-02-03 19:45:47', 'liquid', '카놀리.png'),
	('100ml Juice Co. 스트로베리 크림 100ml - Strawberry Cream (원본액상)', 'P0000HCV', '브랙퍼스트', 35000, 91, '딸기.jpg', '2021-02-03 19:45:47', 'liquid', '딸기.png'),
	('DNA 250 박스모드', 'A010PRK', 'Vapor Shark', 298000, 40, 'a10.jpg', '2021-02-05 11:46:28', 'hardware', 'a10d.png'),
	('Goon Two Post Clamp Style RDA', 'A007PRK', '528Customs', 79400, 120, 'a7.jpg', '2021-02-05 11:46:28', 'hardware', 'a7d.png'),
	('Istick 60W Temperature Control by Eleaf', 'P0000EYO', 'Eleaf', 48000, 22, 'Istick 60W Temperature Control by Eleaf.jpg', '2021-02-03 19:45:47', 'hardware', 'Istick 60W Temperature Control by Eleaf.png'),
	('OCC Ceramic Coil by Kangertech', 'P0000DQQ', 'OCC', 3800, 985, 'OCC Ceramic Coil by Kangertech.jpg', '2021-02-03 19:45:47', 'coil', 'OCC Ceramic Coil by Kangertech.png'),
	('Skar DNA 75 by Lost Vape', 'P0000EYZ', 'Skar', 142800, 62, 'Skar DNA 75 by Lost Vape.jpg', '2021-02-03 19:45:47', 'hardware', 'Skar DNA 75 by Lost Vape.png'),
	('V8 RBA (TFV8 RBA 데크)', 'C004PRK', 'SMOK Tech', 15000, 50, 'c4.jpg', '2021-02-05 11:46:28', 'coil', 'blank.png'),
	('VCC 프리미엄 코튼', 'A008PRK', 'Vapors Choice Cotton', 12000, 430, 'a8.jpg', '2021-02-05 11:46:28', 'hardware', 'blank.png'),
	('Xtar VC2', 'A011PRK', '더베이퍼', 31500, 3000, 'a11.jpg', '2021-02-05 11:46:28', 'hardware', 'a11d.png'),
	('ㅇㅈㅁㅇㅈㅁ', 'ㅇㅈㅁㅇㅈㅁ', 'ㅇㅈㅁㅇㅈㅁ', 123, 123, 'Cloud.PNG', '2021-02-09 01:06:23', 'hardware', 'img001.jpg'),
	('나이트코어 D2', 'A012PRK', 'Nitecore', 25000, 2000, 'a12.jpg', '2021-02-05 11:46:28', 'hardware', 'a12d.png'),
	('노틸러스', 'A001prk', 'Aspire', 34000, 62, 'a1.jpg', '2021-02-05 11:46:27', 'hardware', 'a1d.png'),
	('데리온 DNA 166 Therion DNA 166 by Lost Vape', 'P0000EYP', '데리온', 204000, 61, '데리온 DNA 166 Therion DNA 166 by Lost Vape.jpg', '2021-02-03 19:45:47', 'hardware', '데리온 DNA 166 Therion DNA 166 by Lost Vape.png'),
	('멜론 스플래쉬 60ml', 'B0010PRK', 'Take Off', 32000, 11, 'b10.jpg', '2021-02-05 11:46:28', 'liquid', 'b10d.png'),
	('바나나 아이스 100ml', 'B005PRK', 'Frozen Fruit Monster', 35000, 9, 'b5.jpg', '2021-02-05 11:46:28', 'liquid', 'b5d.png'),
	('버터스카치 100ml', 'B002PRK', 'The Custard Shoppe', 35000, 11, 'b2.jpg', '2021-02-05 11:46:28', 'liquid', 'b2d.png'),
	('베이프 펜 22 스타터 킷', 'A003PRK', 'SMOK Tech', 23000, 48, 'a3.jpg', '2021-02-05 11:46:27', 'hardware', 'a3d.png'),
	('서브탱크 OCC 코일', 'C005PRK', '더베이퍼', 3000, 100, 'c5.jpg', '2021-02-05 11:46:28', 'coil', 'c5d.png'),
	('서브탱크 니켈 OCC 코일', 'C006PRK', 'Kangertech', 3500, 70, 'c6.jpg', '2021-02-05 11:46:28', 'coil', 'c6d.png'),
	('싸이클론 Cream 60ml', 'B001PRK', 'Aqua', 22000, 9, 'b1.jpg', '2021-02-05 11:46:28', 'liquid', 'b1d.png'),
	('아이저스트 S 스타터 킷', 'A005PRK', 'Eleaf', 44000, 97, 'a5.png', '2021-02-05 11:46:28', 'hardware', 'a5d.png'),
	('아이저스트2 스타터 킷', 'A004PRK', 'Eleaf', 38000, 110, 'a4.jpg', '2021-02-05 11:46:28', 'hardware', 'a4d.png'),
	('아이콘200', 'A002prk', 'CKS', 137500, 28, 'a2.jpg', '2021-02-05 11:46:27', 'hardware', 'a2d.png'),
	('아틱 터보 코일', 'C007PRK', 'Horizon Tech', 35000, 50, 'c7.jpg', '2021-02-05 11:46:28', 'coil', 'blank.png'),
	('아틱 터보 코일 Arctic Turbo Replacement Coils by Horizontech', 'P0000DSB', '아틱', 3500, 502, '아틱 터보 코일 Arctic Turbo Replacement Coils by Horizontech.jpg', '2021-02-03 19:45:47', 'coil', '아틱 터보 코일 Arctic Turbo Replacement Coils by Horizontech.png'),
	('우드#02 510 드립팁', 'A009PRK', '더베이퍼', 5500, 800, 'a9.jpg', '2021-02-05 11:46:28', 'hardware', 'a9d.png'),
	('워터멜론 라임 30ml 9.5mg/ml', 'B007PRK', 'Juice Head Freeze', 21000, 3, 'b7.jpg', '2021-02-05 11:46:28', 'liquid', 'b7d.png'),
	('워터멜론 아이스 30ml', 'B006PRK', 'BLVK', 30000, 5, 'b6.jpg', '2021-02-05 11:46:28', 'liquid', 'b6d.png'),
	('월탱크 코일 1개', 'C001PRK', 'UWELL', 3000, 350, 'c1.jpg', '2021-02-05 11:46:28', 'coil', 'c1d.png'),
	('이고원 CL 코일', 'C008PRK', '더베이퍼', 3000, 200, 'c8.jpg', '2021-02-05 11:46:28', 'coil', 'c8d.png'),
	('저스트원 코일', 'C0010PRK', 'Justfog', 4000, 300, 'c10.jpg', '2021-02-05 11:46:28', 'coil', 'c10d.png'),
	('저스트포그 하부코일', 'C003PRK', 'justfog', 3000, 50, 'c3.jpg', '2021-02-05 11:46:28', 'coil', 'c3d.png'),
	('져 드라퍼 100ml', 'B004PRK', 'Treat Factory', 35000, 7, 'b4.jpg', '2021-02-05 11:46:28', 'liquid', 'b4d.png'),
	('초코민트 60ml x 1병', 'B009PRK', 'MINTS Vape Co.', 28000, 5, 'b9.jpg', '2021-02-05 11:46:28', 'liquid', 'b9d.png'),
	('코브라 코일 5개', 'C009PRK', 'ASvape', 19000, 150, 'c9.jpg', '2021-02-05 11:46:28', 'coil', 'blank.png'),
	('큐비스 RBA 코일 Cubis RBA Coil by Joyetech', 'P0000DSA', '큐비스', 9800, 985, '큐비스 RBA 코일 Cubis RBA Coil by Joyetech.jpg', '2021-02-03 19:45:47', 'coil', '큐비스 RBA 코일 Cubis RBA Coil by Joyetech.png'),
	('트랩퀸 하이민트 60ml 3mg', 'B008PRK', 'Nasty Juice', 34000, 8, 'b8.jpg', '2021-02-05 11:46:28', 'liquid', 'b8d.png'),
	('파인애플 100ml', 'B003PRK', 'Final Fantasy', 32000, 7, 'b3.jpg', '2021-02-05 11:46:28', 'liquid', 'b3d.png'),
	('팔콘 코일 1개', 'C002PRK', 'Horizon Tech', 4500, 500, 'c2.jpg', '2021-02-05 11:46:28', 'coil', 'blank.png'),
	('피쉬본', 'A006PRK', '더베이퍼', 14400, 130, 'a6.jpg', '2021-02-05 11:46:28', 'hardware', 'a6d.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- 테이블 vape.tblpollitem 구조 내보내기
DROP TABLE IF EXISTS `tblpollitem`;
CREATE TABLE IF NOT EXISTS `tblpollitem` (
  `listnum` int(11) NOT NULL,
  `itemnum` smallint(6) NOT NULL DEFAULT '0',
  `item` varchar(50) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`listnum`,`itemnum`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- 테이블 데이터 vape.tblpollitem:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tblpollitem` DISABLE KEYS */;
INSERT IGNORE INTO `tblpollitem` (`listnum`, `itemnum`, `item`, `count`) VALUES
	(1, 0, 'JAVA', 0),
	(1, 1, '안드로이드', 0);
/*!40000 ALTER TABLE `tblpollitem` ENABLE KEYS */;

-- 테이블 vape.tblpolllist 구조 내보내기
DROP TABLE IF EXISTS `tblpolllist`;
CREATE TABLE IF NOT EXISTS `tblpolllist` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `sdate` date DEFAULT NULL,
  `edate` date DEFAULT NULL,
  `wdate` date DEFAULT NULL,
  `type` smallint(6) DEFAULT '1',
  `active` smallint(6) DEFAULT '1',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=euckr;

-- 테이블 데이터 vape.tblpolllist:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tblpolllist` DISABLE KEYS */;
INSERT IGNORE INTO `tblpolllist` (`num`, `question`, `sdate`, `edate`, `wdate`, `type`, `active`) VALUES
	(1, '취업하고 싶은 분야는', '2020-01-01', '2020-01-01', '2021-02-02', 1, 1);
/*!40000 ALTER TABLE `tblpolllist` ENABLE KEYS */;

-- 테이블 vape.users 구조 내보내기
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(650) NOT NULL,
  `pw` varchar(1000) NOT NULL,
  `zip` varchar(1000) NOT NULL,
  `street` varchar(1000) NOT NULL,
  `building` varchar(1000) NOT NULL,
  `mobile` varchar(1000) NOT NULL,
  `authority` int(11) NOT NULL,
  `birthday` varchar(1000) NOT NULL,
  `admin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 vape.users:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `pw`, `zip`, `street`, `building`, `mobile`, `authority`, `birthday`, `admin`) VALUES
	('1', '1', '08275', 'ãìë©ãë§ãããë§ã', '1', '07081155222', 1, '1994-09-25', 0),
	('321321321', '32132132', '321321321', '321321321', '321321321', '321321321', 0, '321321321', 0),
	('dw', 'dw', 'dw', 'dw', 'dw', 'dw', 0, 'dw', 0),
	('dwadwadwadwa', 'dwadwadwadwa', 'dwadwadwa', 'dwadwadwadwa', 'dwadwadwa', 'dwadwadwa', 0, 'dwadwadwa', 0),
	('satelite54', 'rhkdwo9079@', '48532', '부산 남구 홍곡로 360', '112동 1703호', '07081155222', 0, '1994-09-25', 1),
	('WOOJ', '1', '1', '1', '1', '1', 0, '1994-09-25', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
