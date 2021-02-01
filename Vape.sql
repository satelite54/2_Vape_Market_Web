create database vape;
use vape; -- vape db를 사용하겠다.

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

CREATE TABLE Users (
	id VARCHAR(650) primary key,
    pw VARCHAR(1000) not null,
    zip VARCHAR(1000) not null,
    street VARCHAR(1000) not null,
    building VARCHAR(1000) not null,
    mobile VARCHAR(1000) not null,
    authority int not null,
    birthday VARCHAR(1000) not null
);

CREATE TABLE Board (
	BNum int primary key,
    BTitle VARCHAR(1000) not null,
    BContent VARCHAR(3000) not null,
    BDate DATETIME not null,
    id VARCHAR(1000) not null,
    authority int not null,
    views int Default 0
);

CREATE TABLE Orders (
	Onumber VARCHAR(1000) Primary key,
    Odate DATETIME not null,
    delivery DATETIME not null
)