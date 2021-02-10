-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- users Table Create SQL
CREATE TABLE users
(
    `id`        VARCHAR(500)    NOT NULL    COMMENT 'id', 
    `name`      VARCHAR(500)    NOT NULL    COMMENT 'name', 
    `pw`        VARCHAR(500)    NOT NULL    COMMENT 'pw', 
    `adress`    VARCHAR(500)    NOT NULL    COMMENT 'zip', 
    `street`    varchar(200)    NULL        COMMENT 'street', 
    `building`  varchar(200)    NULL        COMMENT 'building', 
    `tel`       VARCHAR(500)    NOT NULL    COMMENT 'mobile', 
    `nickname`  VARCHAR(500)    NOT NULL    COMMENT 'nickname', 
    `email`     VARCHAR(500)    NOT NULL    COMMENT 'email', 
    `profile`   VARCHAR(500)    NOT NULL    COMMENT 'profile', 
    `admin`     INT             NOT NULL    COMMENT 'admin', 
    PRIMARY KEY (id, nickname)
);

ALTER TABLE users COMMENT 'users';


-- users Table Create SQL
CREATE TABLE product
(
    `pname`        VARCHAR(500)    NOT NULL    COMMENT 'pname', 
    `pcode`        VARCHAR(500)    NOT NULL    COMMENT 'pcode', 
    `manufacture`  VARCHAR(500)    NOT NULL    COMMENT 'manufacture', 
    `price`        INT             NOT NULL    COMMENT 'price', 
    `stock`        INT             NOT NULL    COMMENT 'stock', 
    `img`          VARCHAR(500)    NOT NULL    COMMENT 'img', 
    `detailimg`    VARCHAR(500)    NOT NULL    COMMENT 'detailimg', 
    `content`      TEXT            NOT NULL    COMMENT 'content', 
    `addate`       DATETIME        NOT NULL    COMMENT 'adddate', 
    PRIMARY KEY (pcode)
);

ALTER TABLE product COMMENT 'product';


-- users Table Create SQL
CREATE TABLE board
(
    `num`       INT             NOT NULL    COMMENT 'num', 
    `title`     VARCHAR(500)    NOT NULL    COMMENT 'title', 
    `content`   VARCHAR(500)    NOT NULL    COMMENT 'content', 
    `date`      TIMESTAMP       NOT NULL    COMMENT 'date', 
    `id`        VARCHAR(500)    NOT NULL    COMMENT 'id', 
    `nickname`  VARCHAR(500)    NOT NULL    COMMENT 'nickname', 
    `profile`   VARCHAR(500)    NOT NULL    COMMENT 'profile', 
    `hit`       INT             NOT NULL    COMMENT 'hit', 
    `addfile`   VARCHAR(500)    NOT NULL    COMMENT 'addfile', 
    `coment`    VARCHAR(500)    NOT NULL    COMMENT 'coment', 
    PRIMARY KEY (num)
);

ALTER TABLE board COMMENT 'board';

ALTER TABLE board
    ADD CONSTRAINT FK_board_id_users_id FOREIGN KEY (id, nickname)
        REFERENCES users (id, nickname) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- users Table Create SQL
CREATE TABLE review
(
    `pcode`     VARCHAR(500)    NOT NULL    COMMENT 'pcode', 
    `id`        VARCHAR(500)    NOT NULL    COMMENT 'id', 
    `nickname`  VARCHAR(500)    NOT NULL    COMMENT 'nickname', 
    `profile`   VARCHAR(500)    NOT NULL    COMMENT 'profile', 
    `review`    VARCHAR(500)    NOT NULL    COMMENT 'review', 
    `admin`     INT             NOT NULL    COMMENT 'admin'
);

ALTER TABLE review COMMENT 'review';

ALTER TABLE review
    ADD CONSTRAINT FK_review_id_users_id FOREIGN KEY (id)
        REFERENCES users (id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE review
    ADD CONSTRAINT FK_review_pcode_product_pcode FOREIGN KEY (pcode)
        REFERENCES product (pcode) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- users Table Create SQL
CREATE TABLE comment
(
    `id`        VARCHAR(500)    NOT NULL    COMMENT 'id', 
    `profile`   VARCHAR(500)    NULL        COMMENT 'profile', 
    `BNum`      INT             NULL        COMMENT 'BNum', 
    `coment`    VARCHAR(500)    NULL        COMMENT 'coment', 
    `nickname`  VARCHAR(500)    NULL        COMMENT 'nickname'
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
    `cardId`  varchar(200)    NOT NULL    COMMENT 'cartId', 
    `Odate`   datetime        NOT NULL    COMMENT 'Odate', 
    `id`      VARCHAR(45)     NOT NULL    COMMENT 'id', 
    PRIMARY KEY (cardId)
);

ALTER TABLE orders COMMENT 'orders';

ALTER TABLE orders
    ADD CONSTRAINT FK_orders_id_users_id FOREIGN KEY (id)
        REFERENCES users (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


