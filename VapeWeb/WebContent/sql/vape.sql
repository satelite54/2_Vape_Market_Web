DROP DATABASE IF exists vape;
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


-- vape 데이터베이스 구조 내보내기

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
	(1, 'ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ´ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ´ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ´ÃÂ£ÃÂÃÂ', 'dsadsadsadsadawdwadÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ', '2021-02-03 02:08:00', 'WOOJ', 0, 6),
	(2, 'ãã´ããã´ããã´ã', 'ãããããããããããããããã', '2021-02-03 02:08:09', 'WOOJ', 1, 2),
	(3, 'ã´ããã´ããã´ããã´ã', 'ãã´ããã´ããã´ããã´ã', '2021-02-03 02:09:25', 'WOOJ', 0, 3),
	(4, 'Ã£ÂÂ´Ã£ÂÂÃ£ÂÂ´Ã£ÂÂÃ£ÂÂÃ£ÂÂ´Ã£ÂÂÃ£ÂÂÃ£ÂÂ´Ã£ÂÂ', 'Ã£ÂÂÃ£ÂÂ´Ã£ÂÂÃ£ÂÂÃ£ÂÂ´Ã£ÂÂÃ£ÂÂÃ£ÂÂ´Ã£ÂÂÃ£ÂÂÃ£ÂÂ´', '2021-02-03 02:10:20', '1', 1, 6),
	(5, 'ãã´ããã´ããã´ã', 'dsãããããããããããããã', '2021-02-03 14:15:08', '1', 1, 1),
	(6, 'ãã´ããã´ããã´ã', 'dwaddwadwadwadwaãããããããããããããããããããããããããããããã', '2021-02-03 15:07:57', '1', 1, 1),
	(7, 'ãã´ããã´ããã´ã', 'ãã´ããã´ããã´ããã´ããã´ã', '2021-02-03 15:12:46', '1', 1, 4),
	(8, 'ㅇㅈㅁㅇㅈㅁㅇㅈㅁㅇㅈㅁ', 'ㅇㅈㅁㅇㅈㅁㅇㅈㅁㅇㅈㅁ', '2021-02-03 16:12:46', '1', 1, 1),
	(9, '가나다라', '가나다라', '2021-02-05 14:24:56', 'satelite54', 1, 1),
	(10, '가나다라', '가나다라', '2021-02-05 14:24:59', 'satelite54', 1, 1),
	(11, '가나다라', '가나다라', '2021-02-05 14:25:02', 'satelite54', 1, 1),
	(12, '가나다라', '가나다라', '2021-02-05 14:25:04', 'satelite54', 1, 1),
	(13, '가나다라', '가나다라', '2021-02-05 14:25:06', 'satelite54', 1, 1),
	(14, '가나다라', '가나다라', '2021-02-05 14:25:08', 'satelite54', 1, 1),
	(15, '가나다라', '가나다라ㅈㄷㅂㅈㄷㅂㅈㄷ', '2021-02-05 14:25:11', 'satelite54', 0, 3);
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
  `name` varchar(1000) NOT NULL,
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

CREATE TABLE IF NOT EXISTS review (
  RNum int(11) NOT NULL,
  RTitle varchar(1000) NOT NULL,
  RContent varchar(3000) NOT NULL,
  RDate datetime NOT NULL,
  id varchar(1000) NOT NULL,
  authority int(11) NOT NULL,
  views int(11) DEFAULT '0',
  PRIMARY KEY (RNum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS tblQuestion;

CREATE TABLE `tblQuestion` (
	`num`               int(11)              NOT NULL  auto_increment  ,
	`name`              varchar(20)                    ,
	`subject`           varchar(50)                    ,
	`content`           text                                ,
	`pos`                smallint(7) unsigned           ,
	`ref`               smallint(7)                    ,
	`depth`             smallint(7) unsigned           ,
	`regdate`          date                           ,
	`pass`              varchar(15)                    ,
	`ip`                  varchar(15)                    ,
	`count`             smallint(7) unsigned           ,
	`filename`         varchar(30)                    ,
	`filesize`           int(11)                        ,
	PRIMARY KEY ( `num` )
)COLLATE='utf8_general_ci';

DROP TABLE IF EXISTS tblQcomment;

CREATE TABLE `tblQcomment` (
	`cnum` INT(11) NOT NULL AUTO_INCREMENT,
	`num` INT(11) NULL DEFAULT NULL,
	`name` VARCHAR(20) NULL DEFAULT NULL,
	`comment` VARCHAR(200) NULL DEFAULT NULL,
	`regdate` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`cnum`)
)COLLATE='utf8_general_ci';

insert tblQuestion(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)
values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0)
