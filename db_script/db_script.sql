CREATE TABLE `profile` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(50) NOT NULL,
	`middle_name` varchar(50),
	`surname` varchar(50) NOT NULL,
	`father_name` varchar(50) NOT NULL,
	`mother_name` varchar(50) NOT NULL,
	`gender` varchar(50) NOT NULL,
	`blood_type` varchar(50),
	`passport_no` varchar(50),
	`social_number` varchar(11) NOT NULL,
	`address` varchar(255),
	`postal_code` varchar(10),
	`email` varchar(150),
	`mobile_number` varchar(15),
	`fax_number` varchar(15),
	`tel_1` varchar(15),
	`tel_2` varchar(15),
	`web_site` varchar(150),
	`fk_nationality_id` DECIMAL NOT NULL,
	`fk_country_id` DECIMAL,
	`fk_city_id` DECIMAL,
	`fk_county_id` DECIMAL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `Template` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `nationality` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`short_name` varchar(10) NOT NULL,
	`flag_image` blob,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `user` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`username` varchar(30) NOT NULL UNIQUE,
	`password` TEXT NOT NULL,
	`fk_profile_id` DECIMAL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `department` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`parent_id` DECIMAL,
	`name` varchar(200) NOT NULL,
	`description` varchar(200),
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `profile_relation` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`fk_department_id` DECIMAL,
	`fk_profile_type_id` DECIMAL NOT NULL,
	`fk_profile_id` DECIMAL,
	`fk_club_team_id` DECIMAL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `profile_type` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(40) NOT NULL,
	`description` varchar(150),
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `club` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`short_name` varchar(10),
	`form_color` varchar(20),
	`club_image` blob,
	`start_date` DATE NOT NULL,
	`fk_department_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `club_team` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`description` varchar(150),
	`start_date` DATE,
	`end_date` DATE,
	`fk_club_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `bank` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`description` varchar(150),
	`owner` varchar(50) NOT NULL,
	`iban` varchar(30) NOT NULL,
	`account_no` varchar(255) NOT NULL,
	`branch_code` varchar(255) NOT NULL,
	`fk_currency_id` DECIMAL NOT NULL,
	`fk_profile_relation_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `currency` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`description` varchar(150),
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `body_size` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`length` varchar(5) NOT NULL,
	`shoes_number` varchar(3) NOT NULL,
	`sport_shoes_number` varchar(3) NOT NULL,
	`weight` varchar(7) NOT NULL,
	`dress_size` varchar(7) NOT NULL,
	`pant_size` varchar(7) NOT NULL,
	`top_size` varchar(7) NOT NULL,
	`fk_profile_relation_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `city` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`short_name` varchar(10),
	`fk_country_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `county` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`short_name` varchar(10),
	`fk_city_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `country` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`short_name` varchar(10),
	`flag_image` blob,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `education` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` BINARY NOT NULL,
	`description` varchar(150),
	`start_date` DATE,
	`end_date` DATE,
	`fk_education_type_id` DECIMAL NOT NULL,
	`fk_profile_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `education_type` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name` varchar(150) NOT NULL,
	`description` varchar(150),
	PRIMARY KEY (`pkid`)
);

ALTER TABLE `profile` ADD CONSTRAINT `profile_fk0` FOREIGN KEY (`fk_nationality_id`) REFERENCES `nationality`(`pkid`);

ALTER TABLE `profile` ADD CONSTRAINT `profile_fk1` FOREIGN KEY (`fk_country_id`) REFERENCES `country`(`pkid`);

ALTER TABLE `profile` ADD CONSTRAINT `profile_fk2` FOREIGN KEY (`fk_city_id`) REFERENCES `city`(`pkid`);

ALTER TABLE `profile` ADD CONSTRAINT `profile_fk3` FOREIGN KEY (`fk_county_id`) REFERENCES `county`(`pkid`);

ALTER TABLE `user` ADD CONSTRAINT `user_fk0` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile`(`pkid`);

ALTER TABLE `department` ADD CONSTRAINT `department_fk0` FOREIGN KEY (`parent_id`) REFERENCES `department`(`pkid`);

ALTER TABLE `profile_relation` ADD CONSTRAINT `profile_relation_fk0` FOREIGN KEY (`fk_department_id`) REFERENCES `department`(`pkid`);

ALTER TABLE `profile_relation` ADD CONSTRAINT `profile_relation_fk1` FOREIGN KEY (`fk_profile_type_id`) REFERENCES `profile_type`(`pkid`);

ALTER TABLE `profile_relation` ADD CONSTRAINT `profile_relation_fk2` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile`(`pkid`);

ALTER TABLE `profile_relation` ADD CONSTRAINT `profile_relation_fk3` FOREIGN KEY (`fk_club_team_id`) REFERENCES `club_team`(`pkid`);

ALTER TABLE `club` ADD CONSTRAINT `club_fk0` FOREIGN KEY (`fk_department_id`) REFERENCES `department`(`pkid`);

ALTER TABLE `club_team` ADD CONSTRAINT `club_team_fk0` FOREIGN KEY (`fk_club_id`) REFERENCES `club`(`pkid`);

ALTER TABLE `bank` ADD CONSTRAINT `bank_fk0` FOREIGN KEY (`fk_currency_id`) REFERENCES `currency`(`pkid`);

ALTER TABLE `bank` ADD CONSTRAINT `bank_fk1` FOREIGN KEY (`fk_profile_relation_id`) REFERENCES `profile_relation`(`pkid`);

ALTER TABLE `body_size` ADD CONSTRAINT `body_size_fk0` FOREIGN KEY (`fk_profile_relation_id`) REFERENCES `profile_relation`(`pkid`);

ALTER TABLE `city` ADD CONSTRAINT `city_fk0` FOREIGN KEY (`fk_country_id`) REFERENCES `country`(`pkid`);

ALTER TABLE `county` ADD CONSTRAINT `county_fk0` FOREIGN KEY (`fk_city_id`) REFERENCES `city`(`pkid`);

ALTER TABLE `education` ADD CONSTRAINT `education_fk0` FOREIGN KEY (`fk_education_type_id`) REFERENCES `education_type`(`pkid`);

ALTER TABLE `education` ADD CONSTRAINT `education_fk1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile`(`pkid`);