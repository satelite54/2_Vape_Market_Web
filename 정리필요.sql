-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- users Table Create SQL
CREATE TABLE users
(
    `id`        VARCHAR(500)    NOT NULL,
    `name`      VARCHAR(500)    NOT NULL,
    `pw`        VARCHAR(500)    NOT NULL,
    `zip`    	 VARCHAR(500)    NOT NULL,
    `street`    varchar(200)    NULL,
    `building`  varchar(200)    NULL,
    `tel`       VARCHAR(500)    NOT NULL,
    `nickname`  VARCHAR(500)    NOT NULL,
    `email`     VARCHAR(500)    NOT NULL,
    `profile`   VARCHAR(500)    NOT NULL,
    `admin`     INT             NOT NULL,
    PRIMARY KEY (id, nickname)
);

ALTER TABLE users COMMENT 'users';


-- users Table Create SQL
CREATE TABLE product
(
    `pname`        VARCHAR(500)    NOT NULL,
    `pcode`        VARCHAR(500)    NOT NULL,
    `manufacture`  VARCHAR(500)    NOT NULL,
    `price`        INT             NOT NULL,
    `stock`        INT             NOT NULL,
    `img`          VARCHAR(500)    NOT NULL,
    `detailimg`    VARCHAR(500)    NOT NULL,
    `content`      TEXT            NOT NULL,
    `addate`       DATETIME        NOT NULL,
    PRIMARY KEY (pcode)
);

ALTER TABLE product COMMENT 'product';


-- users Table Create SQL
CREATE TABLE board
(
    `num`       INT             NOT NULL,
    `title`     VARCHAR(500)    NOT NULL,
    `content`   VARCHAR(500)    NOT NULL,, 
    `date`      TIMESTAMP       NOT NULL,
    `id`        VARCHAR(500)    NOT NULL,
    `nickname`  VARCHAR(500)    NOT NULL,
    `profile`   VARCHAR(500)    NOT NULL,
    `hit`       INT             NOT NULL,
    `addfile`   VARCHAR(500)    NOT NULL,
    `coment`    VARCHAR(500)    NOT NULL,
    PRIMARY KEY (num)
);

ALTER TABLE board COMMENT 'board';

ALTER TABLE board
    ADD CONSTRAINT FK_board_id_users_id FOREIGN KEY (id, nickname)
        REFERENCES users (id, nickname) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- users Table Create SQL
CREATE TABLE review
(
    `pcode`     VARCHAR(500)    NOT NULL,
    `id`        VARCHAR(500)    NOT NULL,
    `nickname`  VARCHAR(500)    NOT NULL,
    `profile`   VARCHAR(500)    NOT NULL, 
    `title`     VARCHAR(500)    NOT NULL,
    `review`    VARCHAR(500)    NOT NULL,
    `admin`     INT             NOT NULL,
);

ALTER TABLE review;

ALTER TABLE review
    ADD CONSTRAINT FK_review_id_users_id FOREIGN KEY (id)
        REFERENCES users (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE review
    ADD CONSTRAINT FK_review_pcode_product_pcode FOREIGN KEY (pcode)
        REFERENCES product (pcode) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- users Table Create SQL
CREATE TABLE comment
(
    `id`        VARCHAR(500)    NOT NULL,
    `profile`   VARCHAR(500)    NULL,
    `BNum`      INT             NULL,
    `coment`    VARCHAR(500)    NULL,
    `nickname`  VARCHAR(500)    NULL,
);

ALTER TABLE comment COMMENT 'comment';

ALTER TABLE comment
    ADD CONSTRAINT FK_comment_id_users_id FOREIGN KEY (id, nickname)
        REFERENCES users (id, nickname) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE comment
    ADD CONSTRAINT FK_comment_BNum_board_num FOREIGN KEY (BNum)
        REFERENCES board (num) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- users Table Create SQL
CREATE TABLE orders
(
    `cardId`  varchar(200)    NOT NULL,
    `Odate`   datetime        NOT NULL,
    `id`      VARCHAR(45)     NOT NULL,
    PRIMARY KEY (cardId)
);

ALTER TABLE orders COMMENT 'orders';

ALTER TABLE orders
    ADD CONSTRAINT FK_orders_id_users_id FOREIGN KEY (id)
        REFERENCES users (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


