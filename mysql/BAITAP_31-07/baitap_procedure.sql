CREATE DATABASE bookstore;

USE bookstore;

CREATE TABLE tuasach(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	author VARCHAR(255) NOT NULL,
	summaty text NOT NULL
);

CREATE TABLE dausach(
	id INT PRIMARY KEY AUTO_INCREMENT,
	tuasach_id INT NOT NULL,
	lanquage VARCHAR(255) NOT NULL,
	cover VARCHAR(255) NOT NULL,
	status VARCHAR(255) NOT NULL
);

CREATE TABLE cuonsach(
	id INT PRIMARY KEY AUTO_INCREMENT,
	dausach_id INT NOT NULL,
	condittion VARCHAR(255) NOT NULL
);

ALTER TABLE dausach ADD CONSTRAINT fk_tuasachid_dausach FOREIGN KEY (tuasach_id) REFERENCES tuasach(id);
ALTER TABLE cuonsach ADD CONSTRAINT fk_dausach_id_cuonsach FOREIGN KEY (dausach_id) REFERENCES dausach(id);

INSERT INTO tuasach (name, author, summaty) VALUES('The Kite Runner','Khaled Hosseini','The Kite Runner is a novel about friendship and betrayal, and about the price of loyalty. It is about the bonds between fathers and sons, and the power of fathers over sons -- their love, their sacrifices, and their lies. Written against a backdrop of history that has not been told in fiction before, The Kite Runner describes the rich culture and beauty of a land in the process of being destroyed. But through the devastation, Khaled Hosseini offers hope: through the novel');
INSERT INTO tuasach (name, author, summaty) VALUES('Number the Stars','Lois Lowry','The Kite Runner is a novel about friendship and betrayal, and about the price of loyalty. It is about the bonds between fathers and sons, and the power of fathers over sons -- their love, their sacrifices, and their lies. Written against a backdrop of history that has not been told in fiction before, The Kite Runner describes the rich culture and beauty of a land in the process of being destroyed. But through the devastation, Khaled Hosseini offers hope: through the novel');
INSERT INTO tuasach (name, author, summaty) VALUES('The Outsiders','S.E. Hinton','The Kite Runner is a novel about friendship and betrayal, and about the price of loyalty. It is about the bonds between fathers and sons, and the power of fathers over sons -- their love, their sacrifices, and their lies. Written against a backdrop of history that has not been told in fiction before, The Kite Runner describes the rich culture and beauty of a land in the process of being destroyed. But through the devastation, Khaled Hosseini offers hope: through the novel');
INSERT INTO tuasach (name, author, summaty) VALUES('Little Women','Louisa May Alcott','The Kite Runner is a novel about friendship and betrayal, and about the price of loyalty. It is about the bonds between fathers and sons, and the power of fathers over sons -- their love, their sacrifices, and their lies. Written against a backdrop of history that has not been told in fiction before, The Kite Runner describes the rich culture and beauty of a land in the process of being destroyed. But through the devastation, Khaled Hosseini offers hope: through the novel');

INSERT INTO dausach  (tuasach_id, lanquage, cover, status) VALUES(1, 'English', 'bia cung', 'Avaiable');
INSERT INTO dausach  (tuasach_id, lanquage, cover, status) VALUES(2, 'Germany', 'bia mem', 'out of stock');
INSERT INTO dausach  (tuasach_id, lanquage, cover, status) VALUES(3, 'Vietnamese', 'bia kinh', 'Avaiable');
INSERT INTO dausach  (tuasach_id, lanquage, cover, status) VALUES(4, 'Chinese', 'bia go', 'contact');

INSERT INTO cuonsach (dausach_id, condittion) VALUES(1, 'new');
INSERT INTO cuonsach (dausach_id, condittion) VALUES(2, 'used 90%');
INSERT INTO cuonsach (dausach_id, condittion) VALUES(3, 'new');
INSERT INTO cuonsach (dausach_id, condittion) VALUES(4, 'none');

-- lay toan bo tua sach
DELIMITER $$
CREATE PROCEDURE getAllTuaSach()
BEGIN
	SELECT * FROM tuasach;
END; $$
DELIMITER ;

CALL getAllTuaSach();

-- lay toan bo dau sach va tua sach tuong ung
DELIMITER $$
CREATE PROCEDURE getAllDauSachAndTuaSach()
BEGIN
	SELECT * FROM dausach d
	JOIN tuasach t
	ON d.tuasach_id = t.id ;
END; $$
DELIMITER ;

CALL getAllDauSachAndTuaSach();

-- end
DELIMITER $$
CREATE PROCEDURE getStatusBook()
BEGIN
	SELECT * FROM dausach d
	JOIN tuasach t
	JOIN cuonsach c
	ON d.tuasach_id = t.id AND c.dausach_id = d.id 
	WHERE d.status = 'Avaiable';
END; $$
DELIMITER ;

CALL getStatusBook();

