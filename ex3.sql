﻿create database ex3
use ex3
go

--tạo bản order
CREATE TABLE ORDERS(
	ORDER_ID INT PRIMARY KEY NOT NULL,
	DATE DATE NOT NULL,
	CUS_ID INT NOT NULL,
	CONSTRAINT FK_ORDER -- dùng constraint để dễ dàng cho việc ql khoá
	FOREIGN KEY (CUS_ID) REFERENCES INFO(CUS_ID) -- khóa ngoại liên kết bản order_data với bản info thông qua CUS_ID
)

ALTER TABLE ORDERS
DROP CONSTRAINT FK_ORDER -- XÓA KHÓA NGOẠI

-- tạo info
CREATE TABLE INFO(
	CUS_NAME VARCHAR(50),
	CUS_ADDRESS VARCHAR(50),
	SHIPPING_ADDRESS VARCHAR(50),
	PHONE_1 VARCHAR(12) NOT NULL,
	PHONE_2 VARCHAR(12),
	CUSTOMER_DISCOUNT INT,
	CUS_ID INT IDENTITY PRIMARY KEY NOT NULL,

)

--tạo ORDER_ITEM
CREATE TABLE ORDER_ITEM(
	PRODUCT_CODE VARCHAR(6) NOT NULL,
	DESCRIPTION VARCHAR(30)NOT NULL,
	QTY INT NOT NULL,
	ORDER_ID INT PRIMARY KEY NOT NULL,
	CONSTRAINT FK_ORDER_ITEM -- dùng constraint để dễ dàng cho việc ql khoá
	FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
	FOREIGN KEY (PRODUCT_CODE) REFERENCES PRODUCT(PRODUCT_CODE),

)

-- tạo bản PRODUCT
CREATE TABLE PRODUCT(
	PRODUCT_CODE VARCHAR(6) NOT NULL, --NOT NULL KHÔNG ĐƯỢC RỔNG
	DESCRIPTION VARCHAR(30) NOT NULL,
	PRICE_UNIT DECIMAL NOT NULL,

	
)
--DROP TABLE PRODUCT

ALTER TABLE PRODUCT
ADD PRIMARY KEY (PRODUCT_CODE) -- TẠO KHÓA CHÍNH CHO PRODUCT_CODE



--TẠO BẢN PRODUCT_Bill

CREATE TABLE PRODUCT_Bill(
	PRODUCT_CODE VARCHAR(6) NOT NULL,
	DESCRIPTION VARCHAR(30) NOT NULL,
	QTY_REQUIRED INT,

)

ALTER TABLE PRODUCT_Bill
ADD PRIMARY KEY (PRODUCT_CODE) -- TẠO KHÓA CHÍNH CHO PRODUCT_Bill

ALTER TABLE PRODUCT_Bill
ADD CONSTRAINT FK_PRODUCT_Bill FOREIGN KEY(PRODUCT_CODE) REFERENCES PRODUCT(PRODUCT_CODE)

-- tạo bảng PART
CREATE TABLE PART(
	PART_NUMB VARCHAR(30) NOT NULL,
	PART_DESCRIPTION VARCHAR(30) NOT NULL,

)
ALTER TABLE PART
ADD PRIMARY KEY (PART_NUMB)-- TẠO KHÓA CHÍNH CHO PART

-- TẠO BẢNG PRODUCT_PART
CREATE TABLE PRODUCT_PART(
	PRODUCT_CODE VARCHAR(6) NOT NULL,
	PART_NUMB VARCHAR(30) NOT NULL,
)

ALTER TABLE PRODUCT_PART
ADD PRIMARY KEY (PRODUCT_CODE, PART_NUMB) -- TẠO KHÓA CHÍNH CHO PRODUCT_CODE, PART_NUMB

ALTER TABLE PRODUCT_PART
ADD CONSTRAINT FK_PRODUCT_CODE FOREIGN KEY(PRODUCT_CODE) REFERENCES PRODUCT(PRODUCT_CODE) -- TẠO KHÓA NGOẠI HƯỚNG ĐÊN PRODUCT_CODE

ALTER TABLE PRODUCT_PART
ADD CONSTRAINT FK_PRODUCT_NUMB FOREIGN KEY(PART_NUMB) REFERENCES PART(PART_NUMB) -- TẠO KHÓA NGOẠI HƯỚNG ĐÊN PART
