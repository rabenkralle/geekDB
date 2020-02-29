DROP DATABASE IF EXISTS new_home;
CREATE DATABASE new_home;
USE new_home;

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50) COMMENT 'Имя', surname VARCHAR(50) COMMENT 'Отчество',
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE,
    phone BIGINT UNIQUE,
    comments VARCHAR(255),
    INDEX users_phone_idx(phone),
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	client_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (client_id) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE restrict
);

DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
id SERIAL PRIMARY KEY,
name varchar(50)
);

DROP TABLE IF EXISTS houses;
CREATE TABLE houses (
	id SERIAL PRIMARY KEY,
	name varchar(50),
	address varchar(255),
	floors bigint,
	project_id bigint
-- 	FOREIGN KEY (project_id) REFERENCES projects(id) ON UPDATE CASCADE ON DELETE restrict
);

DROP TABLE IF EXISTS apartments;
CREATE TABLE apartments (
	id SERIAL PRIMARY KEY,
	house_id BIGINT,
	rooms int,
	`floor` int,
	comment varchar(255),
	number_of_apart int UNIQUE

);

DROP TABLE IF EXISTS prices;
CREATE TABLE prices (
	apart_id SERIAL PRIMARY KEY,
	price bigint
	FOREIGN KEY (apart_id) REFERENCES apartments(id) ON UPDATE CASCADE ON DELETE restrict
);	
