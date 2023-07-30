CREATE DATABASE store;

USE store;

CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	code VARCHAR(155) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	phone VARCHAR(11) NOT NULL,
	email VARCHAR(255) NOT NULL,
	address VARCHAR(512) NOT NULL,
	membership VARCHAR(50) NOT NULL
);

CREATE TABLE bill(
	id INT PRIMARY KEY AUTO_INCREMENT,
	code VARCHAR(155) NOT NULL,
	customer_id INT NOT NULL,
	createddate TIMESTAMP NOT NULL,
	totalamount DOUBLE NOT NULL
);

ALTER TABLE bill ADD CONSTRAINT fk_customerid_bill FOREIGN KEY (customer_id) REFERENCES customer(id);

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	code VARCHAR(155) NOT NULL,
	price DOUBLE NOT NULL,
	unit VARCHAR(50) NOT NULL
);

CREATE TABLE billdetail(
	bill_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	billoutmonth VARCHAR(155) NOT NULL,
	
	PRIMARY KEY(bill_id, product_id)
);

ALTER TABLE billdetail ADD CONSTRAINT fk_billid_billdetail FOREIGN KEY (bill_id) REFERENCES bill(id);
ALTER TABLE billdetail ADD CONSTRAINT fk_productid_billdetail FOREIGN KEY (product_id) REFERENCES product(id);

-- customer
INSERT INTO customer (name, code, gender, phone, email, address, membership, dob)
VALUES ('Nguyễn Thị Mai Chi', 'KH001', 'female', '0902444666', 'maichinguyen@mail.com', 'Quy Nhơn', 'VIP', '1999-02-13');

INSERT INTO customer (name, code, gender, phone, email, address, membership, dob)
VALUES ('Phan Thị Thanh', 'KH002', 'female', '0902444777', '', 'Quy Nhơn', 'STANDARD', '2000-11-30');

INSERT INTO customer (name, code, gender, phone, email, address, membership, dob)
VALUES ('Trần Văn Toàn', 'KH003', 'male', '0902444888', 'ToanVan@gmail.com', 'Tuy Phước', 'STANDARD', '2001-12-27');

INSERT INTO customer (name, code, gender, phone, email, address, membership, dob)
VALUES ('Trần Văn Ẩn', 'KH004', 'male', '0902444999', '', 'Quy Nhơn', 'VIP', '1998-01-30');

-- product
INSERT INTO product (name, code, price, unit) VALUES ('Sữa đặc ông Thọ', 'H001', 23000, 'lon');
INSERT INTO product (name, code, price, unit) VALUES ('Kẹo dẻo Hồng Hà', 'H002', 80000, 'gói');
INSERT INTO product (name, code, price, unit) VALUES ('Bánh xốp quy Kinh Đô', 'H003', 120000, 'hộp');
INSERT INTO product (name, code, price, unit) VALUES ('Bánh quy Luxy', 'H004', 150000, 'hộp');
INSERT INTO product (name, code, price, unit) VALUES ('Đường trắng Quy Hòa', 'H005', 20000, 'gói');
INSERT INTO product (name, code, price, unit) VALUES ('Bánh Luxy Sài Gòn', 'H006', 100000, 'hộp');
INSERT INTO product (name, code, price, unit) VALUES ('Sữa tươi TH True Milk', 'H007', 30000, 'lốc');
INSERT INTO product (name, code, price, unit) VALUES ('Kem Xu Xu', 'H008', 15000, 'cây');

-- bill
INSERT INTO bill (code, customer_id, createddate) VALUES ('001', 1, '2018-02-01');
INSERT INTO bill (code, customer_id, createddate) VALUES ('002', 1, '2018-03-02');
INSERT INTO bill (code, customer_id, createddate) VALUES ('003', 2, '2018-02-01');
INSERT INTO bill (code, customer_id, createddate) VALUES ('004', 2, '2018-03-01');
INSERT INTO bill (code, customer_id, createddate) VALUES ('005', 3, '2018-03-02');
INSERT INTO bill (code, customer_id, createddate) VALUES ('006', 4, '2018-05-02');
INSERT INTO bill (code, customer_id, createddate) VALUES ('007', 3, '2018-05-03');
INSERT INTO bill (code, customer_id, createddate) VALUES ('008', 3, '2018-05-04');

-- bill detail
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (1, 1, 1, 'JUNE');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (1, 2, 3, 'AUGUST');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (2, 3, 12, 'JUNE');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (2, 4, 2, 'AUGUST');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (3, 1, 7, 'JUNE');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (3, 4, 5, 'AUGUST');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (4, 1, 12, 'JUNE');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (5, 3, 20, 'AUGUST');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (5, 5, 19, 'JUNE');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (6, 7, 20, 'AUGUST');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (6, 3, 45, 'JUNE');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (7, 2, 60, 'AUGUST');
INSERT INTO billdetail (bill_id, product_id, quantity, billoutmonth) VALUES (7, 8, 35, 'JUNE');

-- 1) Viết câu lệnh thêm cột NgaySinh vào bảng khách hàng
ALTER TABLE customer ADD dob DATE NOT NULL;

-- CREATE view customer 
CREATE VIEW listcustomer AS
SELECT c.code, c.name, c.dob, c.gender, c.membership, c.address FROM customer c;

-- 2) Cho biết danh sách gồm MaKH, TenKH, NgaySinh, GioiTinh của khách hàng thành viên.
SELECT code, name, dob, gender FROM listcustomer WHERE membership = 'STANDARD';

-- 3) Cho biết danh sách gồm MaKH, TenKH, NgaySinh, GioiTinh của khách hàng nữ ở Quy Nhơn
SELECT code, name, dob, gender FROM listcustomer WHERE gender = 'female' AND address = 'Quy Nhơn';

-- 4) Cho biết danh sách gồm MaKH, TenKH, NgaySinh, GioiTinh của khách hàng VIP ở Quy Nhơn hoặc Tuy Phước.
SELECT code, name, dob, gender FROM listcustomer WHERE membership = 'VIP' AND address = 'Quy Nhơn'
OR membership = 'VIP' AND address = 'Tuy Phước';

-- 5) Cho biết số lượng hoá đơn xuất vào tháng 8.
SELECT SUM(b.quantity) quantitybill
FROM billdetail b 
WHERE b.billoutmonth = 'AUGUST';

-- 6) Cho biết danh sách các mặt hàng có giá bán từ 20 nghìn đến 50 nghìn.
SELECT * FROM product p WHERE p.price >= 20000 AND p.price <= 50000;

-- CREATE view bill detail
CREATE VIEW listbilldetail AS
SELECT b2.code billcode,
p.code productcode,
p.price price,
b.quantity quantity,
SUM(quantity*p.price) total
FROM billdetail b
JOIN product p ON b.product_id = p.id 
JOIN bill b2 ON b.bill_id = b2.id 
GROUP BY b2.id , p.id  ;

-- 7) Cho biết MaHD, MaH, SoLuong có số lượng bán >10.
SELECT billcode, productcode, quantity FROM listbilldetail WHERE quantity > 10 ;

-- 8) Cho biết MaHD, MaH, TenH, DonGia, SoLuong, ThanhTien của hoá đơn 001.
SELECT billcode, productcode, price, quantity, total FROM listbilldetail WHERE billcode = '001' ;

-- 9) Cho biết MaHD, MaH, TenH, DonGia, SoLuong, ThanhTien có Thành tiền từ 1 triệu đến 2 triệu.
SELECT billcode, productcode, price, quantity, total FROM listbilldetail WHERE total >= 1000000 AND total <= 2000000 ;

-- 10) Cho biết thông tin khách hàng không mua hàng vào tháng 6.
SELECT c.code, c.name , c.gender ,c.phone ,c.email ,c.address ,c.membership ,c.dob ,b.billoutmonth  
FROM billdetail b
JOIN bill b2 ON b.bill_id = b2.id 
JOIN customer c ON b2.customer_id = c.id 
WHERE b.billoutmonth != 'JUNE';

-- 11) Cho biết MaHD, NgayLapHD, MaHK, TenH, DonGia, SoLuong, ThanhTien bán vào tháng 6
SELECT b2.code , b2.createddate , c.code , p.name , p.price , b.quantity,
SUM(b.quantity * p.price) total
FROM billdetail b
JOIN bill b2 ON b.bill_id = b2.id 
JOIN product p ON b.product_id = p.id 
JOIN customer c ON b2.customer_id = c.id
WHERE b.billoutmonth = 'JUNE'
GROUP BY b2.id , p.id , c.id ;

-- 12) Cho biết danh sách các mặt hàng đã bán được.
SELECT p.code , p.name, p.price , p.unit 
FROM billdetail b 
JOIN product p ON b.product_id = p.id 
WHERE b.quantity >= 1;

-- 13) Cho biết hoá đơn có tổng trị giá nhỏ nhất gồm các thông tin: Số hoá đơn, ngày, tên khách hàng,
-- địa chỉ khách hàng, tổng trị giá của hoá đơn
SELECT b2.code , b2.createddate , c.name , c.address,
SUM(b.quantity * p.price) total  
FROM billdetail b 
JOIN bill b2 ON b.bill_id = b2.id 
JOIN product p ON b.product_id = b2.id 
JOIN customer c ON b2.customer_id = c.id
GROUP BY b2.id , p.id
ORDER BY total ASC 
LIMIT 1;

-- 14) Cho biết các thông tin của khách hàng có số lượng hoá đơn mua hàng nhiều nhất
SELECT c.code , c.name , c.gender , c.phone , c.email , c.address , c.membership , c.dob 
FROM billdetail b 
JOIN bill b2 ON b.bill_id = b2.id 
JOIN customer c ON b2.customer_id = c.id
ORDER BY b.quantity DESC 
LIMIT 1;

-- 15) Cho biết các thông tin về các mặt hàng mà được bán trong nhiều hoá đơn nhất.
SELECT p.code , p.name, p.price , p.unit
FROM billdetail b 
JOIN bill b2 ON b.bill_id = b2.id 
JOIN product p ON b.product_id = p.id
GROUP BY b2.id , p.id 
ORDER BY SUM(b2.code) ASC 
LIMIT 4;

