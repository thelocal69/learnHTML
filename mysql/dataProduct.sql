CREATE DATABASE data_product;

USE data_product;

CREATE TABLE supplier(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	address varchar(512) NOT NULL,
	phone varchar(10) NOT NULL,
	taxcode varchar(10) NOT NULL
);

CREATE TABLE category(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL
);

CREATE TABLE product(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	description text NOT NULL,
	quantity int NOT NULL,
	importprice double NOT NULL,
	price double NOT NULL,
	discount double NOT NULL,
	category_id int NOT NULL,
	supplier_id int NOT NULL
);

ALTER TABLE product ADD CONSTRAINT fk_product_supplier FOREIGN KEY (supplier_id) REFERENCES supplier(id);
ALTER TABLE product ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category(id);

-- supplier
INSERT INTO supplier (name, address, phone, taxcode) 
VALUES ('Samsung Plaza', ' 204 206 Đ. Trần Hưng Đạo, Phường Nguyễn Cư Trinh, Quận 1, Thành phố Hồ Chí Minh', '0886021177', '0303217354');

INSERT INTO supplier (name, address, phone, taxcode) 
VALUES ('Apple Store', '534 Đ. Trần Hưng Đạo, Phường 2, Quận 5, Thành phố Hồ Chí Minh', '1900969642', '0203317354');

INSERT INTO supplier (name, address, phone, taxcode) 
VALUES ('Sony Electronics', 'Tầng 6&7, Tòa nhà President Place, 93 Đ. Nguyễn Du, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', '0283822227', '0403218354');
-- supplier

-- category
INSERT INTO category (name) VALUES ('mobile');
INSERT INTO category (name) VALUES ('laptop');
INSERT INTO category (name) VALUES ('tivi');
INSERT INTO category (name) VALUES ('tablet');
-- category

-- product
INSERT INTO product (name, description, quantity, importprice, price, discount, category_id, supplier_id)
VALUES ('samsung galaxy s10', 'dien thaoi xin lam nha', 60, 8000000, 23000000, 10, 1, 1);

INSERT INTO product (name, description, quantity, importprice, price, discount, category_id, supplier_id)
VALUES ('macbook pro m2', 'latop xin so', 70, 13000000, 40000000, 0, 2, 2);

INSERT INTO product (name, description, quantity, importprice, price, discount, category_id, supplier_id)
VALUES ('TV sony bravia 60inch 4k', 'tv coi nextflix phe qua', 100, 15000000, 60000000, 20, 3, 3);

INSERT INTO product (name, description, quantity, importprice, price, discount, category_id, supplier_id)
VALUES ('samsung galaxy tab 10', 'may tinh bang xin lam nha', 40, 9000000, 22000000, 10, 4, 1);

INSERT INTO product (name, description, quantity, importprice, price, discount, category_id, supplier_id) 
VALUES ('ipad pro m1', 'may tinh bang xin lam nha', 80, 10000000, 41000000, 0, 4, 2);

INSERT INTO product (name, description, quantity, importprice, price, discount, category_id, supplier_id)
VALUES ('sony xperia tab z', 'may tinh bang xin lam nha', 90, 5000000, 8000000, 20, 4, 3);
-- product

-- 1.1 lay danh sach tat ca cac san pham
SELECT * FROM product p ;

-- 1.2. Chỉ lấy các thông tin về mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết (giá bán), số lượng, % giảm giá của các sản phẩm
SELECT id, name, importprice, price, quantity, discount FROM product p ;

-- 1.3. Lấy mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết (giá bán) của những sản phẩm có số lượng còn lại > 60
SELECT  id, name, importprice, price FROM product p WHERE p.quantity > 60;

-- 1.4. Lấy 3 sản phẩm mới nhất vừa được thêm vào Hệ thống
SELECT * FROM product p
ORDER BY p.id DESC
LIMIT 3;

-- 1.5. Lấy sản phẩm mà tên sản phẩm có chứa chữ 'Samsung'
SELECT * FROM product p WHERE p.name LIKE '%samsung%';

-- 1.6. Lấy các sản phẩm với tên có chứa 'MacBook' và giá niêm yết (giá bán) trên 7,000,000
SELECT * FROM product p WHERE p.price > 7000000 AND p.name LIKE '%macbook%';

-- 1.7. Lấy các sản phẩm với tên có giá niêm yết (giá bán) từ 8,000,000 đến 10,000,000
SELECT name FROM product p WHERE p.price >= 8000000 AND p.price <= 10000000;

-- 2.1. Lấy mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết (giá bán), số lượng, tên nhà cung cấp của tất cả sản phẩm
SELECT p.id, p.name, importprice, price, quantity, s.name FROM product p JOIN supplier s ON p.supplier_id = s.id;

-- 2.2. Lấy mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết (giá bán), số lượng, mã nhà cung cấp, tên nhà cung cấp, mã loại sản phẩm,
-- tên loại sản phẩm của những sản phẩm có giá lớn hơn 5.000.000.
SELECT p.id, p.name, importprice, price, quantity, s.id, s.name, c.id, c.name
FROM product p
JOIN supplier s ON p.supplier_id = s.id
JOIN category c ON p.category_id = c.id WHERE p.price > 5000000;

-- 2.3. Lấy tất cả sản phẩm là máy tính bảng (tablet)
SELECT * FROM product p
JOIN category c ON p.category_id = c.id
WHERE c.name LIKE '%tablet%';
