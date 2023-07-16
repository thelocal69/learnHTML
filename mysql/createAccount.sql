CREATE DATABASE account;

USE account;

CREATE TABLE role(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	description text NOT NULL
);

CREATE TABLE user(
	id int PRIMARY KEY AUTO_INCREMENT,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	role_id int NOT NULL
);

CREATE TABLE userdetail(
	user_id int PRIMARY KEY,
	avatar varchar(255) NOT NULL,
	firstname varchar(255) NOT NULL,
	lastname varchar(255) NOT NULL,
	username varchar(255) NOT NULL,
	fullname varchar(255) NOT NULL,
	phone varchar(10) NOT NULL
);

ALTER TABLE user ADD CONSTRAINT fk_roleid_user FOREIGN KEY (role_id) REFERENCES role(id);
ALTER TABLE userdetail ADD CONSTRAINT fk_userid_userdetail FOREIGN KEY (user_id) REFERENCES user(id);

CREATE TABLE status (
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL
);

CREATE TABLE project(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	starteddate timestamp,
	endeddate timestamp
);

CREATE TABLE job (
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL,
	content text NOT NULL,
	starteddate timestamp,
	endeddate timestamp,
	project_id int NOT NULL
);

ALTER TABLE job ADD CONSTRAINT fk_projectid_job FOREIGN KEY (project_id) REFERENCES project(id);

CREATE TABLE job_status_user (
	user_id int NOT NULL,
	status_id int NOT NULL,
	job_id int NOT NULL,
	createddate timestamp,
	PRIMARY KEY(user_id, status_id, job_id)
);

ALTER TABLE job_status_user ADD CONSTRAINT fk_userid_jobstatususer FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE job_status_user ADD CONSTRAINT fk_statusid_jobstatususer FOREIGN KEY (status_id) REFERENCES status(id);
ALTER TABLE job_status_user ADD CONSTRAINT fk_jobid_jobstatususer FOREIGN KEY (job_id) REFERENCES job(id);

CREATE TABLE project_user (
	user_id int NOT NULL,
	project_id int NOT NULL,
	createddate timestamp,
	PRIMARY KEY(user_id, project_id)
);

ALTER TABLE project_user ADD CONSTRAINT fk_userid_projectuser FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE project_user ADD CONSTRAINT fk_projectid_projectuser FOREIGN KEY (project_id) REFERENCES project(id);

-- insert value
-- insert role
INSERT INTO role (name, description) VALUES ('admin', 'adminitrator');
INSERT INTO role (name, description) VALUES ('user', 'end user');
-- insert role

-- insert user
INSERT INTO user (email, password, role_id) VALUES ('khikhu@mail.com', '123456', 1);
INSERT INTO user (email, password, role_id) VALUES ('baoanphan@mail.com', '123456', 1);
INSERT INTO user (email, password, role_id) VALUES ('lamtranphi@mail.com', '111111', 2);
INSERT INTO user (email, password, role_id) VALUES ('calmdownman@mail.com', '111111', 2);
-- insert user

-- insert userdetail
INSERT INTO userdetail (user_id, avatar, firstname, lastname, username, fullname, phone)
VALUES (1 ,'342', 'Khi', 'Khu', 'khikhu123', 'Khi Khu', '0902333666');

INSERT INTO userdetail (user_id, avatar, firstname, lastname, username, fullname, phone)
VALUES (2 ,'343', 'Bao An', 'Phan', 'baoan456', 'Phan Bao An', '0902333777');

INSERT INTO userdetail (user_id, avatar, firstname, lastname, username, fullname, phone)
VALUES (3 ,'344', 'Phi Lam', 'Tran', 'lamtranphi', 'Tran Phi Lam', '0902333888');

INSERT INTO userdetail (user_id, avatar, firstname, lastname, username, fullname, phone)
VALUES (4 ,'345', 'Quoc Anh', 'Ly', 'calmdownman444', 'Ly Quoc ANh', '0902333999');
-- insert userdetail

-- insert status
INSERT INTO status (name) VALUES ('PENDING');
INSERT INTO status (name) VALUES ('PROCESSING');
INSERT INTO status (name) VALUES ('COMPLETE');
-- insert status

-- insert project
INSERT INTO project (name, starteddate, endeddate) VALUES ('AI', '2023/11/02', '2024/11/02');
-- insert project

-- insert job
INSERT INTO job (name, content, starteddate, endeddate, project_id)
VALUES ('AI Machine', 'practice AI', '2023/11/02', '2023/11/02', 1);
-- insert job

-- insert job_user_status
INSERT INTO job_status_user (user_id, job_id, status_id, createddate) VALUES (1 ,1 ,1 ,'2023/11/07');
-- insert job_user_status

-- insert user_project
INSERT INTO project_user (user_id, project_id, createddate) VALUES (1 ,1 ,'2023/12/02');
-- insert user_project

-- select
-- select user
SELECT * FROM user u;

SELECT * FROM user u JOIN role r ON u.role_id = r.id ;

SELECT * FROM user u JOIN userdetail u2 ON u.id = u2.user_id 
JOIN role r ON u.role_id = r.id ;
-- select user

-- select project_user
SELECT * FROM project p ;

SELECT * FROM project_user pu
JOIN  user u ON pu.user_id = u.id
JOIN project p ON pu.project_id = p.id;
-- select project_user

-- select job_status_user
SELECT * FROM job_status_user jsu ;

SELECT * FROM job_status_user jsu 
JOIN user u ON jsu.user_id = u.id 
JOIN status s ON jsu.status_id = s.id 
JOIN job j ON jsu.job_id = j.id ;
-- select job_status_user

-- select job
SELECT * FROM job j ;

SELECT * FROM job j 
JOIN project p ON j.project_id = p.id ;
-- select job



