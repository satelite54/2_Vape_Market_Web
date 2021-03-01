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

INSERT INTO review (RNum, RTitle,Rcontent, RDate, id, authority, views)
VALUES	(1, '테스트', '내용테스트', '2021-02-20','1','0',0);