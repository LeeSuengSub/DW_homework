-- 고객 테이블
CREATE TABLE IF NOT EXISTS customer
(
    customer_id VARCHAR(20) NOT NULL PRIMARY KEY COMMENT '고객 아이디',
    customer_name VARCHAR(20) NOT NULL COMMENT '고객 이름',
    grade VARCHAR(20) CHECK (grade IN ('브론즈', '실버', '골드', 'VIP')) COMMENT '고객 등급',
    is_use BOOLEAN COMMENT '회원 탈퇴 여부 (true: 탈퇴, false, 미탈퇴)',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '고객 등록날짜'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--고객 구매이력 테이블
CREATE TABLE IF NOT EXISTS customer_history_purchase
(
    history_no BIGINT(20) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '히스토리 번호',
    customer_id VARCHAR(20) NOT NULL COMMENT '고객 아이디',
    cost INTEGER(4) COMMENT '비용',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '구매 날짜',
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Alt + x : insert 한번에 실행
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('4431977', 'SMITH', '브론즈', TRUE, '2021-12-07 06:30:13');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('5194998', 'ALLEN', '실버', FALSE, '2021-12-07 07:00:23');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('16045624', 'WARD', '실버', FALSE, '2021-12-07 09:30:37');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('17810814', 'JONES', '실버', FALSE, '2021-12-10 10:20:29');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('22740286', 'MARTIN', '골드', FALSE, '2021-12-11 12:55:31');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('22868779', 'BLAKE', '골드', FALSE, '2021-12-11 12:55:31');
INSERT INTO customer(customer_id, customer_name, grade, is_use, create_at) VALUES('20381000', 'KING', 'VIP', FALSE, '2021-12-25 01:13:11');

INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',1000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',1500, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',1000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',2000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',800, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('5194998',100, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('16045624',300, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('16045624',300, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('16045624',300, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('17810814',250, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('17810814',350, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('22740286',400, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('22740286',400, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('22868779',1000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('20381000',5000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('20381000',8000, '2022-01-03');
INSERT INTO customer_history_purchase(customer_id, cost, create_at) VALUES('20381000',6600, '2022-01-03');