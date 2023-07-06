USE children;

CREATE TABLE students(
	id int PRIMARY KEY auto_increment,
	full_name varchar(255) NOT NULL,
	gender enum('MALE', 'FEMALE', 'ORTHER'),
	age int,
	city varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
	weight double
);
