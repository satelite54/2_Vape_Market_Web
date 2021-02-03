create database vape;
use vape; -- vape db를 사용하겠다.

DROP TABLE IF EXISTS products;
CREATE TABLE Products (
	pname VARCHAR(500),
    code VARCHAR(500),
    manufacturer VARCHAR(1000) not null,
    price int not null,
    stock int not null,
    imgname VARCHAR(1000) not null,
    adddate DATETIME not null,
    producttype VARCHAR(1000) not null,
    detailedimgpath VARCHAR(1000) not null,
    CONSTRAINT Products_pkname PRIMARY KEY (pname, code)
) DEFAULT CHARSET = utf8;

INSERT INTO products VALUES('노틸러스', 'A001prk', 'Aspire', 34000, 62, 'a1.jpg', NOW(), 'hardware', 'a1d.png');
INSERT INTO products VALUES('아이콘200', 'A002prk', 'CKS', 137500, 28, ' a2.jpg', NOW(), ' hardware ', ' a2d.png ');
INSERT INTO products VALUES('베이프 펜 22 스타터 킷', 'A003PRK', 'SMOK Tech', 23000, 48 , ' a3.jpg', NOW(), ' hardware ', ' a3d.png ');
INSERT INTO products VALUES('아이저스트2 스타터 킷', 'A004PRK', 'Eleaf', 38000, 110, 'a4.jpg', NOW(), 'hardware', 'a4d.png');
INSERT INTO products VALUES('아이저스트 S 스타터 킷', 'A005PRK', 'Eleaf', 44000, 97, 'a5.jpg', NOW(), 'hardware', 'a5d.png');
INSERT INTO products VALUES('피쉬본', 'A006PRK', '더베이퍼', 14400 , 130, 'a6.jpg', NOW(), 'hardware', 'a6d.png');
INSERT INTO products VALUES('Goon Two Post Clamp Style RDA', 'A007PRK', '528Customs', 79400, 120, 'a7.jpg', NOW(), 'hardware', 'a7d.png');
INSERT INTO products VALUES('VCC 프리미엄 코튼', 'A008PRK', 'Vapors Choice Cotton', 12000, 430, 'a8.jpg', NOW(), 'hardware', );
INSERT INTO products VALUES('우드#02 510 드립팁', 'A009PRK', '더베이퍼', 5500, 800, 'a9.jpg', NOW(), 'hardware', 'a9d.png');
INSERT INTO products VALUES('DNA 250 박스모드', 'A010PRK', 'Vapor Shark', 298000, 40, 'a100.jpg', NOW(), 'hardware', 'a10d.png');
INSERT INTO products VALUES('Xtar VC2', 'A011PRK', '더베이퍼', 31500, 3000, 'a11.jpg', NOW(), 'hardware', 'a11d.png');
INSERT INTO products VALUES('나이트코어 D2', 'A012PRK', 'Nitecore', 25000, 2000, 'a12.jpg', NOW(), 'hardware', 'a12d.png');
INSERT INTO products VALUES('싸이클론 Cream 60ml', 'B001PRK', 'Aqua', 22000, 9, 'b1.jpg', NOW(), ' liquid', 'b1d.png');
INSERT INTO products VALUES('버터스카치 100ml', 'B002PRK', 'The Custard Shoppe', 35000, 11, 'b2.jpg', NOW(), 'liquid', 'b2d.png');
INSERT INTO products VALUES('파인애플 100ml', 'B003PRK', 'Final Fantasy', 32000, 7, 'b3.jpg', NOW(), 'liquid', 'b3d.png');
INSERT INTO products VALUES('져 드라퍼 100ml', 'B004PRK', 'Treat Factory', 35000, 7, 'b4.jpg', NOW(), 'liquid', 'b4d.png');
INSERT INTO products VALUES('바나나 아이스 100ml', 'B005PRK', 'Frozen Fruit Monster', 35000, 9, 'b5.jpg', NOW(), 'liquid', 'b5d.png');
INSERT INTO products VALUES('워터멜론 아이스 30ml', 'B006PRK', 'BLVK', 30000, 5, 'b6.jpg', NOW(), 'liquid', 'b6d.png');
INSERT INTO products VALUES('워터멜론 라임 30ml 9.5mg/ml', 'B007PRK', 'Juice Head Freeze', 21000, 3, 'b7.jpg', NOW(), 'liquid', 'b7d.png');
INSERT INTO products VALUES('트랩퀸 하이민트 60ml 3mg', 'B008PRK', 'Nasty Juice', 34000, 8, 'b8.jpg', NOW(), 'liquid', 'b8d.png');
INSERT INTO products VALUES('초코민트 60ml x 1병', 'B009PRK', 'MINTS Vape Co.', 28000, 5, 'b9.jpg', NOW(), 'liquid', 'b9d.png');
INSERT INTO products VALUES('멜론 스플래쉬 60ml', 'B0010PRK', 'Take Off', 32000, 11, 'b10.jpg', NOW(), 'liquid', 'b10d.png');
INSERT INTO products VALUES('월탱크 코일 1개', 'C001PRK', 'UWELL', 3000, 350, 'c1.jpg', NOW(), 'coil', 'c1d.png');
INSERT INTO products VALUES('팔콘 코일 1개', 'C002PRK', 'Horizon Tech', 4500, 500, 'c2.jpg', NOW(), 'coil', );
INSERT INTO products VALUES('저스트포그 하부코일', 'C003PRK', 'justfog', 3000, 50, 'c3.jpg', NOW(), 'coil', 'c3d.png');
INSERT INTO products VALUES('V8 RBA (TFV8 RBA 데크)', 'C004PRK', 'SMOK Tech', 15000, 50, 'c4.jpg', NOW(), 'coil', );
INSERT INTO products VALUES('서브탱크 OCC 코일', 'C005PRK', '더베이퍼', 3000, 100, 'c5.jpg', NOW(), 'coil', 'c5d.png');
INSERT INTO products VALUES('서브탱크 니켈 OCC 코일', 'C006PRK', 'Kangertech', 3500, 70, 'c6.jpg', NOW(), 'coil', 'c6d.png');
INSERT INTO products VALUES('아틱 터보 코일', 'C007PRK', 'Horizon Tech', 35000, 50, 'c7.jpg', NOW(), 'coil', );
INSERT INTO products VALUES('이고원 CL 코일', 'C008PRK', '더베이퍼', 3000, 200, 'c8.jpg', NOW(), 'coil', 'c8d.png');
INSERT INTO products VALUES('코브라 코일 5개', 'C009PRK', 'ASvape', 19000, 150, 'c9.jpg', NOW(), 'coil', );
INSERT INTO products VALUES('저스트원 코일', 'C0010PRK', 'Justfog', 4000, 300, 'c10.jpg', NOW(), 'coil', 'c10d.png');

CREATE TABLE Users (
	id VARCHAR(650) primary key,
    pw VARCHAR(1000) not null,
    zip VARCHAR(1000) not null,
    street VARCHAR(1000) not NULL,
    building VARCHAR(1000) not null,
    mobile VARCHAR(1000) not null,
    authority int not null,
    birthday VARCHAR(1000) not NULL,
    admin INT NOT null
) DEFAULT CHARSET = utf8;

CREATE TABLE Board (
	BNum int primary KEY,
    BTitle VARCHAR(1000) not null,
    BContent VARCHAR(3000) not null,
    BDate DATETIME not null,
    id VARCHAR(1000) not null,
    authority int not null,
    views int DEFAULT 0
)DEFAULT CHARSET = utf8;

DROP TABLE orders;
CREATE TABLE Orders (
	cartID VARCHAR(1000) Primary key,
    Odate DATETIME not NULL,
    id VARCHAR(1000) NOT NULL
)DEFAULT CHARSET = utf8;

UPDATE SET USERS VALUE('1', '1234', '1', '1', '1', '1', 1 , '2021-02-17' , 0) where id = '1';