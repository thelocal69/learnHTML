CREATE DATABASE cozastores;

USE cozastores;

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(155),
	images VARCHAR(255),
	price DOUBLE,
	description TEXT,
	quantity INT,
	id_category INT NOT NULL,
	id_size INT NOT NULL,
	id_color INT NOT NULL
);

CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(155)
);

CREATE TABLE sizes(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(155)
);

CREATE TABLE color(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(155)
);

ALTER TABLE product ADD CONSTRAINT fk_id_category_product FOREIGN KEY (id_category) REFERENCES category(id);
ALTER TABLE product ADD CONSTRAINT fk_id_size_product FOREIGN KEY (id_size) REFERENCES sizes(id);
ALTER TABLE product ADD CONSTRAINT fk_id_color_product FOREIGN KEY (id_color) REFERENCES color(id);

CREATE TABLE carousel(
	id INT PRIMARY KEY AUTO_INCREMENT,
	images VARCHAR(255),
	title VARCHAR(155),
	content TEXT,
	id_category INT NOT NULL
);

ALTER TABLE carousel ADD CONSTRAINT fk_id_category_carousel FOREIGN KEY (id_category) REFERENCES category(id);

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(155),
	pass VARCHAR(255),
	email VARCHAR(155)
);

CREATE TABLE cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
	quantity INT,
	id_product INT NOT NULL,
	id_user INT NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT fk_id_product_cart FOREIGN KEY (id_product) REFERENCES product(id);
ALTER TABLE cart ADD CONSTRAINT fk_id_user_cart FOREIGN KEY (id_user) REFERENCES users(id);

CREATE TABLE blog(
	id INT PRIMARY KEY AUTO_INCREMENT,
	images VARCHAR(255),
	title VARCHAR(155),
	content TEXT,
	create_date TIMESTAMP,
	id_user INT NOT NULL
);

ALTER TABLE blog ADD CONSTRAINT fk_id_user_blog FOREIGN KEY (id_user) REFERENCES users(id);

CREATE TABLE comment(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(155),
	email VARCHAR(155),
	content TEXT,
	create_date TIMESTAMP,
	id_blog INT NOT NULL
);

ALTER TABLE comment ADD CONSTRAINT fk_id_blog_comment FOREIGN KEY (id_blog) REFERENCES blog(id);

CREATE TABLE tag(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(155),
	create_date TIMESTAMP
);

CREATE TABLE blog_tag(
	id_blog INT,
	id_tag INT,
	
	PRIMARY KEY(id_blog, id_tag)
);

ALTER TABLE blog_tag ADD CONSTRAINT fk_id_blog_tag FOREIGN KEY (id_blog) REFERENCES blog(id);
ALTER TABLE blog_tag ADD CONSTRAINT fk_id_blog_tag_2 FOREIGN KEY (id_tag) REFERENCES tag(id);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
	create_date TIMESTAMP,
	id_user INT NOT NULL,
	id_status INT NOT NULL
);

CREATE TABLE status(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(155)
);

ALTER TABLE orders ADD CONSTRAINT fk_id_user_orders FOREIGN KEY (id_user) REFERENCES users(id);
ALTER TABLE orders ADD CONSTRAINT fk_id_status_orders FOREIGN KEY (id_status) REFERENCES status(id);

CREATE TABLE product_order(
	id_product INT,
	id_order INT,
	quantity INT,
	price DOUBLE,
	
	PRIMARY KEY(id_product, id_order)
);

ALTER TABLE product_order ADD CONSTRAINT fk_id_product_orders FOREIGN KEY (id_product) REFERENCES product(id);
ALTER TABLE product_order ADD CONSTRAINT fk_id_product_orders_2 FOREIGN KEY (id_order) REFERENCES orders(id);


