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