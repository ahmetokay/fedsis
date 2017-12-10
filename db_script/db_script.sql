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
	`fk_nationality_id` DECIMAL,
	`fk_country_id` DECIMAL,
	`fk_city_id` DECIMAL,
	`fk_county_id` DECIMAL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `nationality` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(50) NOT NULL,
	`short_name` varchar(10) NOT NULL,
	`flag_image` blob,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `user` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`username` varchar(30) NOT NULL UNIQUE,
	`password` TEXT NOT NULL,
	`fk_profile_id` DECIMAL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `department` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`parent_id` DECIMAL,
	`name` varchar(200) NOT NULL,
	`description` varchar(200),
	`is_kadro` BOOLEAN NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `profile_relation` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`fk_department_id` DECIMAL NOT NULL,
	`fk_profile_type_id` DECIMAL NOT NULL,
	`fk_profile_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `profile_type` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(40) NOT NULL,
	`description` varchar(150),
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `club` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(50) NOT NULL,
	`short_name` varchar(10),
	`form_color` varchar(20),
	`club_image` blob,
	`start_date` DATE NOT NULL,
	`fk_department_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `team` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(50) NOT NULL,
	`description` varchar(150),
	`start_date` DATE,
	`end_date` DATE,
	`fk_club_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `bank` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
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
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(50) NOT NULL,
	`description` varchar(150),
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `body_size` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
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
	`is_active` BOOLEAN NOT NULL,
	`short_name` varchar(10),
	`name` varchar(50) NOT NULL,
	`fk_country_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `county` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`short_name` varchar(10),
	`name` varchar(50) NOT NULL,
	`fk_city_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `country` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`short_name` varchar(10),
	`name` varchar(50) NOT NULL,
	`flag_image` blob,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `education` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(50) NOT NULL,
	`description` varchar(150),
	`start_date` DATE,
	`end_date` DATE,
	`fk_education_type_id` DECIMAL NOT NULL,
	`fk_profile_id` DECIMAL NOT NULL,
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `education_type` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(150) NOT NULL,
	`description` varchar(150),
	PRIMARY KEY (`pkid`)
);

CREATE TABLE `unit` (
	`pkid` DECIMAL NOT NULL AUTO_INCREMENT,
	`is_active` BOOLEAN NOT NULL,
	`name` varchar(50) NOT NULL,
	`description` varchar(150) NOT NULL,
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

ALTER TABLE `club` ADD CONSTRAINT `club_fk0` FOREIGN KEY (`fk_department_id`) REFERENCES `department`(`pkid`);

ALTER TABLE `team` ADD CONSTRAINT `team_fk0` FOREIGN KEY (`fk_club_id`) REFERENCES `club`(`pkid`);

ALTER TABLE `bank` ADD CONSTRAINT `bank_fk0` FOREIGN KEY (`fk_currency_id`) REFERENCES `currency`(`pkid`);

ALTER TABLE `bank` ADD CONSTRAINT `bank_fk1` FOREIGN KEY (`fk_profile_relation_id`) REFERENCES `profile_relation`(`pkid`);

ALTER TABLE `body_size` ADD CONSTRAINT `body_size_fk0` FOREIGN KEY (`fk_profile_relation_id`) REFERENCES `profile_relation`(`pkid`);

ALTER TABLE `city` ADD CONSTRAINT `city_fk0` FOREIGN KEY (`fk_country_id`) REFERENCES `country`(`pkid`);

ALTER TABLE `county` ADD CONSTRAINT `county_fk0` FOREIGN KEY (`fk_city_id`) REFERENCES `city`(`pkid`);

ALTER TABLE `education` ADD CONSTRAINT `education_fk0` FOREIGN KEY (`fk_education_type_id`) REFERENCES `education_type`(`pkid`);

ALTER TABLE `education` ADD CONSTRAINT `education_fk1` FOREIGN KEY (`fk_profile_id`) REFERENCES `profile`(`pkid`);


-- INSERT
insert into `gender` values (1, true, 'Erkek', null);
insert into `gender` values (2, true, 'Kadın', null);

insert into `blood_type` values (1, true, 'AB Rh(+)', null);
insert into `blood_type` values (2, true, 'AB Rh(-)', null);
insert into `blood_type` values (3, true, 'A Rh(+)', null);
insert into `blood_type` values (4, true, 'A Rh(-)', null);
insert into `blood_type` values (5, true, 'B Rh(+)', null);
insert into `blood_type` values (6, true, 'B Rh(-)', null);
insert into `blood_type` values (7, true, '0 Rh(+)', null);
insert into `blood_type` values (8, true, '0 Rh(-)', null);


insert into `profile_type` values (1, true, 'Antrenör', null);
insert into `profile_type` values (2, true, 'Hakem', null);
insert into `profile_type` values (3, true, 'Sporcu', null);

insert into `profile` values (1, true, 'Ahmet', null, 'Okay', 'Mehmet Ali', 'Selma', 'Erkek', null, null, '16228427198', null, null, 'ahmet.okay@outlook.com', '05326226445', null, null,null, null, null, null, null, null);
insert into `profile` values (2, true, 'Bilal', null, 'Öcal', 'Mehmet Ali', 'Selma', 'Erkek', null, null, '16228427198', null, null, 'bilal.ocal@outlook.com', '05326226445', null, null,null, null, null, null, null, null);
insert into `profile` values (3, true, 'Gürkan', null, 'Can', 'Mehmet Ali', 'Selma', 'Erkek', null, null, '16228427198', null, null, 'gurkan.can@outlook.com', '05326226445', null, null,null, null, null, null, null, null);
insert into `profile` values (4, true, 'Ahmet', null, 'Yeğin', 'Mehmet Ali', 'Selma', 'Erkek', null, null, '16228427198', null, null, 'ismail.yegin@outlook.com', '05326226445', null, null,null, null, null, null, null, null);

insert into `country` values (1, true, 'AD', 'Andorra', null);
insert into `country` values (2, true, 'AE', 'Birleşik Arap Emirlikleri', null);
insert into `country` values (3, true, 'AF', 'Afganistan', null);
insert into `country` values (4, true, 'AG', 'Antigua ve Barbuda', null);
insert into `country` values (5, true, 'AI', 'Anguilla', null);
insert into `country` values (6, true, 'AL', 'Arnavutluk', null);
insert into `country` values (7, true, 'AM', 'Ermenistan', null);
insert into `country` values (8, true, 'AO', 'Angola', null);
insert into `country` values (9, true, 'AQ', 'Antarktika', null);
insert into `country` values (10, true, 'AR', 'Arjantin', null);
insert into `country` values (11, true, 'AS', 'Amerikan Samoası', null);
insert into `country` values (12, true, 'AT', 'Avusturya', null);
insert into `country` values (13, true, 'AU', 'Avustralya', null);
insert into `country` values (14, true, 'AW', 'Aruba', null);
insert into `country` values (15, true, 'AZ', 'Azerbaycan', null);
insert into `country` values (16, true, 'BA', 'Bosna-Hersek', null);
insert into `country` values (17, true, 'BB', 'Barbados', null);
insert into `country` values (18, true, 'BD', 'Bangladeş', null);
insert into `country` values (19, true, 'BE', 'Belçika', null);
insert into `country` values (20, true, 'BF', 'Burkina Faso', null);
insert into `country` values (21, true, 'BG', 'Bulgaristan', null);
insert into `country` values (22, true, 'BH', 'Bahreyn', null);
insert into `country` values (23, true, 'BI', 'Burundi', null);
insert into `country` values (24, true, 'BJ', 'Benin', null);
insert into `country` values (25, true, 'BL', 'Saint Barthelemy', null);
insert into `country` values (26, true, 'BM', 'Bermuda', null);
insert into `country` values (27, true, 'BN', 'Brunei', null);
insert into `country` values (28, true, 'BO', 'Bolivya', null);
insert into `country` values (29, true, 'BR', 'Brezilya', null);
insert into `country` values (30, true, 'BS', 'Bahamalar', null);
insert into `country` values (31, true, 'BT', 'Bhutan', null);
insert into `country` values (32, true, 'BV', 'Bouvet Adası', null);
insert into `country` values (33, true, 'BW', 'Botsvana', null);
insert into `country` values (34, true, 'BY', 'Beyaz Rusya', null);
insert into `country` values (35, true, 'BZ', 'Belize', null);
insert into `country` values (36, true, 'CA', 'Kanada', null);
insert into `country` values (37, true, 'CC', 'Cocos (Keyling) Adaları', null);
insert into `country` values (38, true, 'CD', 'Demokratik Kongo Cumhuriyeti', null);
insert into `country` values (39, true, 'CF', 'Orta Afrika Cumhuriyeti', null);
insert into `country` values (40, true, 'CG', 'Kongo Cumhuriyeti', null);
insert into `country` values (41, true, 'CH', 'İsviçre', null);
insert into `country` values (42, true, 'CI', 'Fildişi Sahili', null);
insert into `country` values (43, true, 'CK', 'Cook Adaları', null);
insert into `country` values (44, true, 'CL', 'Şili', null);
insert into `country` values (45, true, 'CM', 'Kamerun', null);
insert into `country` values (46, true, 'CN', 'Çin', null);
insert into `country` values (47, true, 'CO', 'Kolombiya', null);
insert into `country` values (48, true, 'CR', 'Kosta Rika', null);
insert into `country` values (49, true, 'CU', 'Küba', null);
insert into `country` values (50, true, 'CV', 'Yeşil Burun Adaları', null);
insert into `country` values (51, true, 'CW', 'Curaçao', null);
insert into `country` values (52, true, 'CX', 'Christmas Adası', null);
insert into `country` values (53, true, 'CY', 'Kıbrıs', null);
insert into `country` values (54, true, 'CZ', 'Çek Cumhuriyeti', null);
insert into `country` values (55, true, 'DE', 'Almanya', null);
insert into `country` values (56, true, 'DJ', 'Cibuti', null);
insert into `country` values (57, true, 'DK', 'Danimarka', null);
insert into `country` values (58, true, 'DM', 'Dominika', null);
insert into `country` values (59, true, 'DO', 'Dominik Cumhuriyeti', null);
insert into `country` values (60, true, 'DZ', 'Cezayir', null);
insert into `country` values (61, true, 'EC', 'Ekvador', null);
insert into `country` values (62, true, 'EE', 'Estonya', null);
insert into `country` values (63, true, 'EG', 'Mısır', null);
insert into `country` values (64, true, 'EH', 'Batı Sahra', null);
insert into `country` values (65, true, 'ER', 'Eritre', null);
insert into `country` values (66, true, 'ES', 'İspanya', null);
insert into `country` values (67, true, 'ET', 'Etiyopya', null);
insert into `country` values (68, true, 'FI', 'Finlandiya', null);
insert into `country` values (69, true, 'FJ', 'Fiji', null);
insert into `country` values (70, true, 'FK', 'Falkland Adaları (Islas Malvinas)', null);
insert into `country` values (71, true, 'FM', 'Mikronezya Federal Devletleri', null);
insert into `country` values (72, true, 'FO', 'Faroe Adaları', null);
insert into `country` values (73, true, 'FR', 'Fransa', null);
insert into `country` values (74, true, 'FX', 'Metropolitan Fransa', null);
insert into `country` values (75, true, 'GA', 'Gabon', null);
insert into `country` values (76, true, 'GB', 'Birleşik Krallık', null);
insert into `country` values (77, true, 'GD', 'Grenada', null);
insert into `country` values (78, true, 'GE', 'Gürcistan', null);
insert into `country` values (79, true, 'GF', 'Fransız Guyanası', null);
insert into `country` values (80, true, 'GG', 'Guernsey', null);
insert into `country` values (81, true, 'GH', 'Gana', null);
insert into `country` values (82, true, 'GI', 'Cebelitarık', null);
insert into `country` values (83, true, 'GL', 'Grönland', null);
insert into `country` values (84, true, 'GM', 'Gambiya', null);
insert into `country` values (85, true, 'GN', 'Gine', null);
insert into `country` values (86, true, 'GP', 'Guadeloupe', null);
insert into `country` values (87, true, 'GQ', 'Ekvator Ginesi', null);
insert into `country` values (88, true, 'GR', 'Yunanistan', null);
insert into `country` values (89, true, 'GS', 'Güney Georgia ve Güney Sandwich Adaları', null);
insert into `country` values (90, true, 'GT', 'Guatemala', null);
insert into `country` values (91, true, 'GU', 'Guam', null);
insert into `country` values (92, true, 'GW', 'Gine-Bissau', null);
insert into `country` values (93, true, 'GY', 'Guyana', null);
insert into `country` values (94, true, 'HK', 'Hong Kong', null);
insert into `country` values (95, true, 'HM', 'Heard Adası ve McDonald Adaları', null);
insert into `country` values (96, true, 'HN', 'Honduras', null);
insert into `country` values (97, true, 'HR', 'Hırvatistan', null);
insert into `country` values (98, true, 'HT', 'Haiti', null);
insert into `country` values (99, true, 'HU', 'Macaristan', null);
insert into `country` values (100, true, 'ID', 'Endonezya', null);
insert into `country` values (101, true, 'IE', 'İrlanda', null);
insert into `country` values (102, true, 'IL', 'İsrail', null);
insert into `country` values (103, true, 'IM', 'Man Adası', null);
insert into `country` values (104, true, 'IN', 'Hindistan', null);
insert into `country` values (105, true, 'IO', 'Britanya Hint Okyanusu Toprakları', null);
insert into `country` values (106, true, 'IQ', 'Irak', null);
insert into `country` values (107, true, 'IR', 'İran', null);
insert into `country` values (108, true, 'IS', 'İzlanda', null);
insert into `country` values (109, true, 'IT', 'İtalya', null);
insert into `country` values (110, true, 'JE', 'Jersey', null);
insert into `country` values (111, true, 'JM', 'Jamaika', null);
insert into `country` values (112, true, 'JO', 'Ürdün', null);
insert into `country` values (113, true, 'JP', 'Japonya', null);
insert into `country` values (114, true, 'KE', 'Kenya', null);
insert into `country` values (115, true, 'KG', 'Kırgızistan', null);
insert into `country` values (116, true, 'KH', 'Kamboçya', null);
insert into `country` values (117, true, 'KI', 'Kiribati', null);
insert into `country` values (118, true, 'KM', 'Komorlar', null);
insert into `country` values (119, true, 'KN', 'Saint Kitts ve Nevis', null);
insert into `country` values (120, true, 'KP', 'Kuzey Kore', null);
insert into `country` values (121, true, 'KR', 'Güney Kore', null);
insert into `country` values (122, true, 'KW', 'Kuveyt', null);
insert into `country` values (123, true, 'KY', 'Cayman Adaları', null);
insert into `country` values (124, true, 'KZ', 'Kazakistan', null);
insert into `country` values (125, true, 'LA', 'Laos', null);
insert into `country` values (126, true, 'LB', 'Lübnan', null);
insert into `country` values (127, true, 'LC', 'Saint Lucia', null);
insert into `country` values (128, true, 'LI', 'Lihtenştayn', null);
insert into `country` values (129, true, 'LK', 'Sri Lanka', null);
insert into `country` values (130, true, 'LR', 'Liberya', null);
insert into `country` values (131, true, 'LS', 'Lesotho', null);
insert into `country` values (132, true, 'LT', 'Litvanya', null);
insert into `country` values (133, true, 'LU', 'Lüksemburg', null);
insert into `country` values (134, true, 'LV', 'Letonya', null);
insert into `country` values (135, true, 'LY', 'Libya', null);
insert into `country` values (136, true, 'MA', 'Fas', null);
insert into `country` values (137, true, 'MC', 'Monako', null);
insert into `country` values (138, true, 'MD', 'Moldova', null);
insert into `country` values (139, true, 'ME', 'Karadağ', null);
insert into `country` values (140, true, 'MF', 'Saint Martin', null);
insert into `country` values (141, true, 'MG', 'Madagaskar', null);
insert into `country` values (142, true, 'MH', 'Marshall Adaları', null);
insert into `country` values (143, true, 'MK', 'Makedonya', null);
insert into `country` values (144, true, 'ML', 'Mali', null);
insert into `country` values (145, true, 'MM', 'Burma', null);
insert into `country` values (146, true, 'MN', 'Moğolistan', null);
insert into `country` values (147, true, 'MO', 'Makao', null);
insert into `country` values (148, true, 'MP', 'Kuzey Mariana Adaları', null);
insert into `country` values (149, true, 'MQ', 'Martinique', null);
insert into `country` values (150, true, 'MR', 'Moritanya', null);
insert into `country` values (151, true, 'MS', 'Montserrat', null);
insert into `country` values (152, true, 'MT', 'Malta', null);
insert into `country` values (153, true, 'MU', 'Mauritius', null);
insert into `country` values (154, true, 'MV', 'Maldivler', null);
insert into `country` values (155, true, 'MW', 'Malavi', null);
insert into `country` values (156, true, 'MX', 'Meksika', null);
insert into `country` values (157, true, 'MY', 'Malezya', null);
insert into `country` values (158, true, 'MZ', 'Mozambik', null);
insert into `country` values (159, true, 'NA', 'Namibya', null);
insert into `country` values (160, true, 'NC', 'Yeni Kaledonya', null);
insert into `country` values (161, true, 'NE', 'Nijer', null);
insert into `country` values (162, true, 'NF', 'Norfolk Adası', null);
insert into `country` values (163, true, 'NG', 'Nijerya', null);
insert into `country` values (164, true, 'NI', 'Nikaragua', null);
insert into `country` values (165, true, 'NL', 'Hollanda', null);
insert into `country` values (166, true, 'NO', 'Norveç', null);
insert into `country` values (167, true, 'NP', 'Nepal', null);
insert into `country` values (168, true, 'NR', 'Nauru', null);
insert into `country` values (169, true, 'NU', 'Niue', null);
insert into `country` values (170, true, 'NZ', 'Yeni Zelanda', null);
insert into `country` values (171, true, 'OM', 'Umman', null);
insert into `country` values (172, true, 'PA', 'Panama', null);
insert into `country` values (173, true, 'PE', 'Peru', null);
insert into `country` values (174, true, 'PF', 'Fransız Polinezyası', null);
insert into `country` values (175, true, 'PG', 'Papua Yeni Gine', null);
insert into `country` values (176, true, 'PH', 'Filipinler', null);
insert into `country` values (177, true, 'PK', 'Pakistan', null);
insert into `country` values (178, true, 'PL', 'Polonya', null);
insert into `country` values (179, true, 'PM', 'Saint Pierre ve Miquelon', null);
insert into `country` values (180, true, 'PN', 'Pitcairn Adaları', null);
insert into `country` values (181, true, 'PR', 'Porto Riko', null);
insert into `country` values (182, true, 'PS', 'Gazze', null);
insert into `country` values (183, true, 'PS', 'Batı Şeria', null);
insert into `country` values (184, true, 'PT', 'Portekiz', null);
insert into `country` values (185, true, 'PW', 'Palau', null);
insert into `country` values (186, true, 'PY', 'Paraguay', null);
insert into `country` values (187, true, 'QA', 'Katar', null);
insert into `country` values (188, true, 'RE', 'Reunion', null);
insert into `country` values (189, true, 'RO', 'Romanya', null);
insert into `country` values (190, true, 'RS', 'Sırbistan', null);
insert into `country` values (191, true, 'RU', 'Rusya', null);
insert into `country` values (192, true, 'RW', 'Ruanda', null);
insert into `country` values (193, true, 'SA', 'Suudi Arabistan', null);
insert into `country` values (194, true, 'SB', 'Solomon Adaları', null);
insert into `country` values (195, true, 'SC', 'Seyşeller', null);
insert into `country` values (196, true, 'SD', 'Sudan', null);
insert into `country` values (197, true, 'SE', 'İsveç', null);
insert into `country` values (198, true, 'SG', 'Singapur', null);
insert into `country` values (199, true, 'SH', 'Saint Helena, Ascension ve Tristan da Cunha', null);
insert into `country` values (200, true, 'SI', 'Slovenya', null);
insert into `country` values (201, true, 'SJ', 'Svalbard', null);
insert into `country` values (202, true, 'SK', 'Slovakya', null);
insert into `country` values (203, true, 'SL', 'Sierra Leone', null);
insert into `country` values (204, true, 'SM', 'San Marino', null);
insert into `country` values (205, true, 'SN', 'Senegal', null);
insert into `country` values (206, true, 'SO', 'Somali', null);
insert into `country` values (207, true, 'SR', 'Surinam', null);
insert into `country` values (208, true, 'SS', 'Güney Sudan', null);
insert into `country` values (209, true, 'ST', 'Sao Tome ve Principe', null);
insert into `country` values (210, true, 'SV', 'El Salvador', null);
insert into `country` values (211, true, 'SX', 'Saint Martin', null);
insert into `country` values (212, true, 'SY', 'Suriye', null);
insert into `country` values (213, true, 'SZ', 'Svaziland', null);
insert into `country` values (214, true, 'TC', 'Turks ve Caicos Adaları', null);
insert into `country` values (215, true, 'TD', 'Çad', null);
insert into `country` values (216, true, 'TF', 'Fransız Güney ve Antarktik Toprakları', null);
insert into `country` values (217, true, 'TG', 'Togo', null);
insert into `country` values (218, true, 'TH', 'Tayland', null);
insert into `country` values (219, true, 'TJ', 'Tacikistan', null);
insert into `country` values (220, true, 'TK', 'Tokelau', null);
insert into `country` values (221, true, 'TL', 'Doğu Timor', null);
insert into `country` values (222, true, 'TM', 'Türkmenistan', null);
insert into `country` values (223, true, 'TN', 'Tunus', null);
insert into `country` values (224, true, 'TO', 'Tonga', null);
insert into `country` values (225, true, 'TR', 'Türkiye', null);
insert into `country` values (226, true, 'TT', 'Trinidad ve Tobago', null);
insert into `country` values (227, true, 'TV', 'Tuvalu', null);
insert into `country` values (228, true, 'TW', 'Tayvan', null);
insert into `country` values (229, true, 'TZ', 'Tanzanya', null);
insert into `country` values (230, true, 'UA', 'Ukrayna', null);
insert into `country` values (231, true, 'UG', 'Uganda', null);
insert into `country` values (232, true, 'UM', 'Amerika Birleşik Devletleri Küçük Dış Adaları', null);
insert into `country` values (233, true, 'US', 'Birleşik Devletler', null);
insert into `country` values (234, true, 'UY', 'Uruguay', null);
insert into `country` values (235, true, 'UZ', 'Özbekistan', null);
insert into `country` values (236, true, 'VA', 'Vatikan', null);
insert into `country` values (237, true, 'VC', 'Saint Vincent ve Grenadinler', null);
insert into `country` values (238, true, 'VE', 'Venezuela', null);
insert into `country` values (239, true, 'VG', 'Britanya Virjin Adaları', null);
insert into `country` values (240, true, 'VI', 'Virjin Adaları', null);
insert into `country` values (241, true, 'VN', 'Vietnam', null);
insert into `country` values (242, true, 'VU', 'Vanuatu', null);
insert into `country` values (243, true, 'WF', 'Wallis ve Futuna', null);
insert into `country` values (244, true, 'WS', 'Samoa', null);
insert into `country` values (245, true, 'XK', 'Kosova', null);
insert into `country` values (246, true, 'YE', 'Yemen', null);
insert into `country` values (247, true, 'YT', 'Mayotte', null);
insert into `country` values (248, true, 'ZA', 'Güney Afrika', null);
insert into `country` values (249, true, 'ZM', 'Zambiya', null);
insert into `country` values (250, true, 'ZW', 'Zimbabve', null);

insert into `city` VALUES(1, true, null, 'Adana', 225);
insert into `city` VALUES(2, true, null, 'Adıyaman', 225);
insert into `city` VALUES(3, true, null, 'Afyonkarahisar', 225);
insert into `city` VALUES(4, true, null, 'Ağrı', 225);
insert into `city` VALUES(5, true, null, 'Amasya', 225);
insert into `city` VALUES(6, true, null, 'Ankara', 225);
insert into `city` VALUES(7, true, null, 'Antalya', 225);
insert into `city` VALUES(8, true, null, 'Artvin', 225);
insert into `city` VALUES(9, true, null, 'Aydın', 225);
insert into `city` VALUES(10, true, null, 'Balıkesir', 225);
insert into `city` VALUES(11, true, null, 'Bilecik', 225);
insert into `city` VALUES(12, true, null, 'Bingöl', 225);
insert into `city` VALUES(13, true, null, 'Bitlis', 225);
insert into `city` VALUES(14, true, null, 'Bolu', 225);
insert into `city` VALUES(15, true, null, 'Burdur', 225);
insert into `city` VALUES(16, true, null, 'Bursa', 225);
insert into `city` VALUES(17, true, null, 'Çanakkale', 225);
insert into `city` VALUES(18, true, null, 'Çankırı', 225);
insert into `city` VALUES(19, true, null, 'Çorum', 225);
insert into `city` VALUES(20, true, null, 'Denizli', 225);
insert into `city` VALUES(21, true, null, 'Diyarbakır', 225);
insert into `city` VALUES(22, true, null, 'Edirne', 225);
insert into `city` VALUES(23, true, null, 'Elâzığ', 225);
insert into `city` VALUES(24, true, null, 'Erzincan', 225);
insert into `city` VALUES(25, true, null, 'Erzurum', 225);
insert into `city` VALUES(26, true, null, 'Eskişehir', 225);
insert into `city` VALUES(27, true, null, 'Gaziantep', 225);
insert into `city` VALUES(28, true, null, 'Giresun', 225);
insert into `city` VALUES(29, true, null, 'Gümüşhane', 225);
insert into `city` VALUES(30, true, null, 'Hakkâri', 225);
insert into `city` VALUES(31, true, null, 'Hatay', 225);
insert into `city` VALUES(32, true, null, 'Isparta', 225);
insert into `city` VALUES(33, true, null, 'Mersin', 225);
insert into `city` VALUES(34, true, null, 'İstanbul', 225);
insert into `city` VALUES(35, true, null, 'İzmir', 225);
insert into `city` VALUES(36, true, null, 'Kars', 225);
insert into `city` VALUES(37, true, null, 'Kastamonu', 225);
insert into `city` VALUES(38, true, null, 'Kayseri', 225);
insert into `city` VALUES(39, true, null, 'Kırklareli', 225);
insert into `city` VALUES(40, true, null, 'Kırşehir', 225);
insert into `city` VALUES(41, true, null, 'Kocaeli', 225);
insert into `city` VALUES(42, true, null, 'Konya', 225);
insert into `city` VALUES(43, true, null, 'Kütahya', 225);
insert into `city` VALUES(44, true, null, 'Malatya', 225);
insert into `city` VALUES(45, true, null, 'Manisa', 225);
insert into `city` VALUES(46, true, null, 'Kahramanmaraş', 225);
insert into `city` VALUES(47, true, null, 'Mardin', 225);
insert into `city` VALUES(48, true, null, 'Muğla', 225);
insert into `city` VALUES(49, true, null, 'Muş', 225);
insert into `city` VALUES(50, true, null, 'Nevşehir', 225);
insert into `city` VALUES(51, true, null, 'Niğde', 225);
insert into `city` VALUES(52, true, null, 'Ordu', 225);
insert into `city` VALUES(53, true, null, 'Rize', 225);
insert into `city` VALUES(54, true, null, 'Sakarya', 225);
insert into `city` VALUES(55, true, null, 'Samsun', 225);
insert into `city` VALUES(56, true, null, 'Siirt', 225);
insert into `city` VALUES(57, true, null, 'Sinop', 225);
insert into `city` VALUES(58, true, null, 'Sivas', 225);
insert into `city` VALUES(59, true, null, 'Tekirdağ', 225);
insert into `city` VALUES(60, true, null, 'Tokat', 225);
insert into `city` VALUES(61, true, null, 'Trabzon', 225);
insert into `city` VALUES(62, true, null, 'Tunceli', 225);
insert into `city` VALUES(63, true, null, 'Şanlıurfa', 225);
insert into `city` VALUES(64, true, null, 'Uşak', 225);
insert into `city` VALUES(65, true, null, 'Van', 225);
insert into `city` VALUES(66, true, null, 'Yozgat', 225);
insert into `city` VALUES(67, true, null, 'Zonguldak', 225);
insert into `city` VALUES(68, true, null, 'Aksaray', 225);
insert into `city` VALUES(69, true, null, 'Bayburt', 225);
insert into `city` VALUES(70, true, null, 'Karaman', 225);
insert into `city` VALUES(71, true, null, 'Kırıkkale', 225);
insert into `city` VALUES(72, true, null, 'Batman', 225);
insert into `city` VALUES(73, true, null, 'Şırnak', 225);
insert into `city` VALUES(74, true, null, 'Bartın', 225);
insert into `city` VALUES(75, true, null, 'Ardahan', 225);
insert into `city` VALUES(76, true, null, 'Iğdır', 225);
insert into `city` VALUES(77, true, null, 'Yalova', 225);
insert into `city` VALUES(78, true, null, 'Karabük', 225);
insert into `city` VALUES(79, true, null, 'Kilis', 225);
insert into `city` VALUES(80, true, null, 'Osmaniye', 225);
insert into `city` VALUES(81, true, null, 'Düzce', 225);


insert into `county` VALUES(1, true, null, 'Abana', 37);
insert into `county` VALUES(2, true, null, 'Acıgöl', 50);
insert into `county` VALUES(3, true, null, 'Acıpayam', 20);
insert into `county` VALUES(4, true, null, 'Adaklı', 12);
insert into `county` VALUES(5, true, null, 'Adalar', 34);
insert into `county` VALUES(6, true, null, 'Adapazarı', 54);
insert into `county` VALUES(7, true, null, 'Adıyaman', 2);
insert into `county` VALUES(8, true, null, 'Adilcevaz', 13);
insert into `county` VALUES(9, true, null, 'Afşin', 46);
insert into `county` VALUES(10, true, null, 'Afyonkarahisar', 3);
insert into `county` VALUES(11, true, null, 'Ağaçören', 68);
insert into `county` VALUES(12, true, null, 'Ağın', 23);
insert into `county` VALUES(13, true, null, 'Ağlasun', 15);
insert into `county` VALUES(14, true, null, 'Ağlı', 37);
insert into `county` VALUES(15, true, null, 'Ağrı', 4);
insert into `county` VALUES(16, true, null, 'Ahırlı', 42);
insert into `county` VALUES(17, true, null, 'Ahlat', 13);
insert into `county` VALUES(18, true, null, 'Ahmetli', 45);
insert into `county` VALUES(19, true, null, 'Akçaabat', 61);
insert into `county` VALUES(20, true, null, 'Akçadağ', 44);
insert into `county` VALUES(21, true, null, 'Akçakale', 63);
insert into `county` VALUES(22, true, null, 'Akçakent', 40);
insert into `county` VALUES(23, true, null, 'Akçakoca', 81);
insert into `county` VALUES(24, true, null, 'Akdağmadeni', 66);
insert into `county` VALUES(25, true, null, 'Akdeniz', 33);
insert into `county` VALUES(26, true, null, 'Akhisar', 45);
insert into `county` VALUES(27, true, null, 'Akıncılar', 58);
insert into `county` VALUES(28, true, null, 'Akkışla', 38);
insert into `county` VALUES(29, true, null, 'Akkuş', 52);
insert into `county` VALUES(30, true, null, 'Akören', 42);
insert into `county` VALUES(31, true, null, 'Akpınar', 40);
insert into `county` VALUES(32, true, null, 'Aksaray', 68);
insert into `county` VALUES(33, true, null, 'Akseki', 7);
insert into `county` VALUES(34, true, null, 'Aksu', 7);
insert into `county` VALUES(35, true, null, 'Aksu', 32);
insert into `county` VALUES(36, true, null, 'Akşehir', 42);
insert into `county` VALUES(37, true, null, 'Akyaka', 36);
insert into `county` VALUES(38, true, null, 'Akyazı', 54);
insert into `county` VALUES(39, true, null, 'Akyurt', 6);
insert into `county` VALUES(40, true, null, 'Alaca', 19);
insert into `county` VALUES(41, true, null, 'Alacakaya', 23);
insert into `county` VALUES(42, true, null, 'Alaçam', 55);
insert into `county` VALUES(43, true, null, 'Aladağ', 1);
insert into `county` VALUES(44, true, null, 'Alanya', 7);
insert into `county` VALUES(45, true, null, 'Alaplı', 67);
insert into `county` VALUES(46, true, null, 'Alaşehir', 45);
insert into `county` VALUES(47, true, null, 'Aliağa', 35);
insert into `county` VALUES(48, true, null, 'Almus', 60);
insert into `county` VALUES(49, true, null, 'Alpu', 26);
insert into `county` VALUES(50, true, null, 'Altıeylül', 10);
insert into `county` VALUES(51, true, null, 'Altındağ', 6);
insert into `county` VALUES(52, true, null, 'Altınekin', 42);
insert into `county` VALUES(53, true, null, 'Altınordu', 52);
insert into `county` VALUES(54, true, null, 'Altınova', 77);
insert into `county` VALUES(55, true, null, 'Altınözü', 31);
insert into `county` VALUES(56, true, null, 'Altıntaş', 43);
insert into `county` VALUES(57, true, null, 'Altınyayla', 15);
insert into `county` VALUES(58, true, null, 'Altınyayla', 58);
insert into `county` VALUES(59, true, null, 'Altunhisar', 51);
insert into `county` VALUES(60, true, null, 'Alucra', 28);
insert into `county` VALUES(61, true, null, 'Amasra', 74);
insert into `county` VALUES(62, true, null, 'Amasya', 5);
insert into `county` VALUES(63, true, null, 'Anamur', 33);
insert into `county` VALUES(64, true, null, 'Andırın', 46);
insert into `county` VALUES(65, true, null, 'Antakya', 31);
insert into `county` VALUES(66, true, null, 'Araban', 27);
insert into `county` VALUES(67, true, null, 'Araç', 37);
insert into `county` VALUES(68, true, null, 'Araklı', 61);
insert into `county` VALUES(69, true, null, 'Aralık', 76);
insert into `county` VALUES(70, true, null, 'Arapgir', 44);
insert into `county` VALUES(71, true, null, 'Ardahan', 75);
insert into `county` VALUES(72, true, null, 'Ardanuç', 8);
insert into `county` VALUES(73, true, null, 'Ardeşen', 53);
insert into `county` VALUES(74, true, null, 'Arguvan', 44);
insert into `county` VALUES(75, true, null, 'Arhavi', 8);
insert into `county` VALUES(76, true, null, 'Arıcak', 23);
insert into `county` VALUES(77, true, null, 'Arifiye', 54);
insert into `county` VALUES(78, true, null, 'Armutlu', 77);
insert into `county` VALUES(79, true, null, 'Arnavutköy', 34);
insert into `county` VALUES(80, true, null, 'Arpaçay', 36);
insert into `county` VALUES(81, true, null, 'Arsin', 61);
insert into `county` VALUES(82, true, null, 'Arsuz', 31);
insert into `county` VALUES(83, true, null, 'Artova', 60);
insert into `county` VALUES(84, true, null, 'Artuklu', 47);
insert into `county` VALUES(85, true, null, 'Artvin', 8);
insert into `county` VALUES(86, true, null, 'Asarcık', 55);
insert into `county` VALUES(87, true, null, 'Aslanapa', 43);
insert into `county` VALUES(88, true, null, 'Aşkale', 25);
insert into `county` VALUES(89, true, null, 'Atabey', 32);
insert into `county` VALUES(90, true, null, 'Atakum', 55);
insert into `county` VALUES(91, true, null, 'Ataşehir', 34);
insert into `county` VALUES(92, true, null, 'Atkaracalar', 18);
insert into `county` VALUES(93, true, null, 'Avanos', 50);
insert into `county` VALUES(94, true, null, 'Avcılar', 34);
insert into `county` VALUES(95, true, null, 'Ayancık', 57);
insert into `county` VALUES(96, true, null, 'Ayaş', 6);
insert into `county` VALUES(97, true, null, 'Aybastı', 52);
insert into `county` VALUES(98, true, null, 'Aydıncık', 33);
insert into `county` VALUES(99, true, null, 'Aydıncık', 66);
insert into `county` VALUES(100, true, null, 'Aydıntepe', 69);

insert into `county` VALUES(101, true, null, 'Ayrancı', 70);
insert into `county` VALUES(102, true, null, 'Ayvacık', 17);
insert into `county` VALUES(103, true, null, 'Ayvacık', 55);
insert into `county` VALUES(104, true, null, 'Ayvalık', 10);
insert into `county` VALUES(105, true, null, 'Azdavay', 37);
insert into `county` VALUES(106, true, null, 'Aziziye', 25);
insert into `county` VALUES(107, true, null, 'Babadağ', 20);
insert into `county` VALUES(108, true, null, 'Babaeski', 39);
insert into `county` VALUES(109, true, null, 'Bafra', 55);
insert into `county` VALUES(110, true, null, 'Bağcılar', 34);
insert into `county` VALUES(111, true, null, 'Bağlar', 21);
insert into `county` VALUES(112, true, null, 'Bahçe', 80);
insert into `county` VALUES(113, true, null, 'Bahçelievler', 34);
insert into `county` VALUES(114, true, null, 'Bahçesaray', 65);
insert into `county` VALUES(115, true, null, 'Bahşili', 71);
insert into `county` VALUES(116, true, null, 'Bakırköy', 34);
insert into `county` VALUES(117, true, null, 'Baklan', 20);
insert into `county` VALUES(118, true, null, 'Bala', 6);
insert into `county` VALUES(119, true, null, 'Balçova', 35);
insert into `county` VALUES(120, true, null, 'Balışeyh', 71);
insert into `county` VALUES(121, true, null, 'Balya', 10);
insert into `county` VALUES(122, true, null, 'Banaz', 64);
insert into `county` VALUES(123, true, null, 'Bandırma', 10);
insert into `county` VALUES(124, true, null, 'Bartın', 74);
insert into `county` VALUES(125, true, null, 'Baskil', 23);
insert into `county` VALUES(126, true, null, 'Başakşehir', 34);
insert into `county` VALUES(127, true, null, 'Başçiftlik', 60);
insert into `county` VALUES(128, true, null, 'Başiskele', 41);
insert into `county` VALUES(129, true, null, 'Başkale', 65);
insert into `county` VALUES(130, true, null, 'Başmakçı', 3);
insert into `county` VALUES(131, true, null, 'Başyayla', 70);
insert into `county` VALUES(132, true, null, 'Batman', 72);
insert into `county` VALUES(133, true, null, 'Battalgazi', 44);
insert into `county` VALUES(134, true, null, 'Bayat', 3);
insert into `county` VALUES(135, true, null, 'Bayat', 19);
insert into `county` VALUES(136, true, null, 'Bayburt', 69);
insert into `county` VALUES(137, true, null, 'Bayındır', 35);
insert into `county` VALUES(138, true, null, 'Baykan', 56);
insert into `county` VALUES(139, true, null, 'Bayraklı', 35);
insert into `county` VALUES(140, true, null, 'Bayramiç', 17);
insert into `county` VALUES(141, true, null, 'Bayramören', 18);
insert into `county` VALUES(142, true, null, 'Bayrampaşa', 34);
insert into `county` VALUES(143, true, null, 'Bekilli', 20);
insert into `county` VALUES(144, true, null, 'Belen', 31);
insert into `county` VALUES(145, true, null, 'Bergama', 35);
insert into `county` VALUES(146, true, null, 'Besni', 2);
insert into `county` VALUES(147, true, null, 'Beşikdüzü', 61);
insert into `county` VALUES(148, true, null, 'Beşiktaş', 34);
insert into `county` VALUES(149, true, null, 'Beşiri', 72);
insert into `county` VALUES(150, true, null, 'Beyağaç', 20);
insert into `county` VALUES(151, true, null, 'Beydağ', 35);
insert into `county` VALUES(152, true, null, 'Beykoz', 34);
insert into `county` VALUES(153, true, null, 'Beylikdüzü', 34);
insert into `county` VALUES(154, true, null, 'Beylikova', 26);
insert into `county` VALUES(155, true, null, 'Beyoğlu', 34);
insert into `county` VALUES(156, true, null, 'Beypazarı', 6);
insert into `county` VALUES(157, true, null, 'Beyşehir', 42);
insert into `county` VALUES(158, true, null, 'Beytüşşebap', 73);
insert into `county` VALUES(159, true, null, 'Biga', 17);
insert into `county` VALUES(160, true, null, 'Bigadiç', 10);
insert into `county` VALUES(161, true, null, 'Bilecik', 11);
insert into `county` VALUES(162, true, null, 'Bingöl', 12);
insert into `county` VALUES(163, true, null, 'Birecik', 63);
insert into `county` VALUES(164, true, null, 'Bismil', 21);
insert into `county` VALUES(165, true, null, 'Bitlis', 13);
insert into `county` VALUES(166, true, null, 'Bodrum', 48);
insert into `county` VALUES(167, true, null, 'Boğazkale', 19);
insert into `county` VALUES(168, true, null, 'Boğazlıyan', 66);
insert into `county` VALUES(169, true, null, 'Bolu', 14);
insert into `county` VALUES(170, true, null, 'Bolvadin', 3);
insert into `county` VALUES(171, true, null, 'Bor', 51);
insert into `county` VALUES(172, true, null, 'Borçka', 8);
insert into `county` VALUES(173, true, null, 'Bornova', 35);
insert into `county` VALUES(174, true, null, 'Boyabat', 57);
insert into `county` VALUES(175, true, null, 'Bozcaada', 17);
insert into `county` VALUES(176, true, null, 'Bozdoğan', 9);
insert into `county` VALUES(177, true, null, 'Bozkır', 42);
insert into `county` VALUES(178, true, null, 'Bozkurt', 20);
insert into `county` VALUES(179, true, null, 'Bozkurt', 37);
insert into `county` VALUES(180, true, null, 'Bozova', 63);
insert into `county` VALUES(181, true, null, 'Boztepe', 40);
insert into `county` VALUES(182, true, null, 'Bozüyük', 11);
insert into `county` VALUES(183, true, null, 'Bozyazı', 33);
insert into `county` VALUES(184, true, null, 'Buca', 35);
insert into `county` VALUES(185, true, null, 'Bucak', 15);
insert into `county` VALUES(186, true, null, 'Buharkent', 9);
insert into `county` VALUES(187, true, null, 'Bulancak', 28);
insert into `county` VALUES(188, true, null, 'Bulanık', 49);
insert into `county` VALUES(189, true, null, 'Buldan', 20);
insert into `county` VALUES(190, true, null, 'Burdur', 15);
insert into `county` VALUES(191, true, null, 'Burhaniye', 10);
insert into `county` VALUES(192, true, null, 'Bünyan', 38);
insert into `county` VALUES(193, true, null, 'Büyükçekmece', 34);
insert into `county` VALUES(194, true, null, 'Büyükorhan', 16);
insert into `county` VALUES(195, true, null, 'Canik', 55);
insert into `county` VALUES(196, true, null, 'Ceyhan', 1);
insert into `county` VALUES(197, true, null, 'Ceylanpınar', 63);
insert into `county` VALUES(198, true, null, 'Cide', 37);
insert into `county` VALUES(199, true, null, 'Cihanbeyli', 42);
insert into `county` VALUES(200, true, null, 'Cizre', 73);

insert into `county` VALUES(201, true, null, 'Cumayeri', 81);
insert into `county` VALUES(202, true, null, 'Çağlayancerit', 46);
insert into `county` VALUES(203, true, null, 'Çal', 20);
insert into `county` VALUES(204, true, null, 'Çaldıran', 65);
insert into `county` VALUES(205, true, null, 'Çamardı', 51);
insert into `county` VALUES(206, true, null, 'Çamaş', 52);
insert into `county` VALUES(207, true, null, 'Çameli', 20);
insert into `county` VALUES(208, true, null, 'Çamlıdere', 6);
insert into `county` VALUES(209, true, null, 'Çamlıhemşin', 53);
insert into `county` VALUES(210, true, null, 'Çamlıyayla', 33);
insert into `county` VALUES(211, true, null, 'Çamoluk', 28);
insert into `county` VALUES(212, true, null, 'Çan', 17);
insert into `county` VALUES(213, true, null, 'Çanakçı', 28);
insert into `county` VALUES(214, true, null, 'Çanakkale', 17);
insert into `county` VALUES(215, true, null, 'Çandır', 66);
insert into `county` VALUES(216, true, null, 'Çankaya', 6);
insert into `county` VALUES(217, true, null, 'Çankırı', 18);
insert into `county` VALUES(218, true, null, 'Çardak', 20);
insert into `county` VALUES(219, true, null, 'Çarşamba', 55);
insert into `county` VALUES(220, true, null, 'Çarşıbaşı', 61);
insert into `county` VALUES(221, true, null, 'Çat', 25);
insert into `county` VALUES(222, true, null, 'Çatak', 65);
insert into `county` VALUES(223, true, null, 'Çatalca', 34);
insert into `county` VALUES(224, true, null, 'Çatalpınar', 52);
insert into `county` VALUES(225, true, null, 'Çatalzeytin', 37);
insert into `county` VALUES(226, true, null, 'Çavdarhisar', 43);
insert into `county` VALUES(227, true, null, 'Çavdır', 15);
insert into `county` VALUES(228, true, null, 'Çay', 3);
insert into `county` VALUES(229, true, null, 'Çaybaşı', 52);
insert into `county` VALUES(230, true, null, 'Çaycuma', 67);
insert into `county` VALUES(231, true, null, 'Çayeli', 53);
insert into `county` VALUES(232, true, null, 'Çayıralan', 66);
insert into `county` VALUES(233, true, null, 'Çayırlı', 24);
insert into `county` VALUES(234, true, null, 'Çayırova', 41);
insert into `county` VALUES(235, true, null, 'Çaykara', 61);
insert into `county` VALUES(236, true, null, 'Çekerek', 66);
insert into `county` VALUES(237, true, null, 'Çekmeköy', 34);
insert into `county` VALUES(238, true, null, 'Çelebi', 71);
insert into `county` VALUES(239, true, null, 'Çelikhan', 2);
insert into `county` VALUES(240, true, null, 'Çeltik', 42);
insert into `county` VALUES(241, true, null, 'Çeltikçi', 15);
insert into `county` VALUES(242, true, null, 'Çemişgezek', 62);
insert into `county` VALUES(243, true, null, 'Çerkeş', 18);
insert into `county` VALUES(244, true, null, 'Çerkezköy', 59);
insert into `county` VALUES(245, true, null, 'Çermik', 21);
insert into `county` VALUES(246, true, null, 'Çeşme', 35);
insert into `county` VALUES(247, true, null, 'Çıldır', 75);
insert into `county` VALUES(248, true, null, 'Çınar', 21);
insert into `county` VALUES(249, true, null, 'Çınarcık', 77);
insert into `county` VALUES(250, true, null, 'Çiçekdağı', 40);
insert into `county` VALUES(251, true, null, 'Çifteler', 26);
insert into `county` VALUES(252, true, null, 'Çiftlik', 51);
insert into `county` VALUES(253, true, null, 'Çiftlikköy', 77);
insert into `county` VALUES(254, true, null, 'Çiğli', 35);
insert into `county` VALUES(255, true, null, 'Çilimli', 81);
insert into `county` VALUES(256, true, null, 'Çine', 9);
insert into `county` VALUES(257, true, null, 'Çivril', 20);
insert into `county` VALUES(258, true, null, 'Çobanlar', 3);
insert into `county` VALUES(259, true, null, 'Çorlu', 59);
insert into `county` VALUES(260, true, null, 'Çorum', 19);
insert into `county` VALUES(261, true, null, 'Çubuk', 6);
insert into `county` VALUES(262, true, null, 'Çukurca', 30);
insert into `county` VALUES(263, true, null, 'Çukurova', 1);
insert into `county` VALUES(264, true, null, 'Çumra', 42);
insert into `county` VALUES(265, true, null, 'Çüngüş', 21);
insert into `county` VALUES(266, true, null, 'Daday', 37);
insert into `county` VALUES(267, true, null, 'Dalaman', 48);
insert into `county` VALUES(268, true, null, 'Damal', 75);
insert into `county` VALUES(269, true, null, 'Darende', 44);
insert into `county` VALUES(270, true, null, 'Dargeçit', 47);
insert into `county` VALUES(271, true, null, 'Darıca', 41);
insert into `county` VALUES(272, true, null, 'Datça', 48);
insert into `county` VALUES(273, true, null, 'Dazkırı', 3);
insert into `county` VALUES(274, true, null, 'Defne', 31);
insert into `county` VALUES(275, true, null, 'Delice', 71);
insert into `county` VALUES(276, true, null, 'Demirci', 45);
insert into `county` VALUES(277, true, null, 'Demirköy', 39);
insert into `county` VALUES(278, true, null, 'Demirözü', 69);
insert into `county` VALUES(279, true, null, 'Demre', 7);
insert into `county` VALUES(280, true, null, 'Derbent', 42);
insert into `county` VALUES(281, true, null, 'Derebucak', 42);
insert into `county` VALUES(282, true, null, 'Dereli', 28);
insert into `county` VALUES(283, true, null, 'Derepazarı', 53);
insert into `county` VALUES(284, true, null, 'Derik', 47);
insert into `county` VALUES(285, true, null, 'Derince', 41);
insert into `county` VALUES(286, true, null, 'Derinkuyu', 50);
insert into `county` VALUES(287, true, null, 'Dernekpazarı', 61);
insert into `county` VALUES(288, true, null, 'Develi', 38);
insert into `county` VALUES(289, true, null, 'Devrek', 67);
insert into `county` VALUES(290, true, null, 'Devrekani', 37);
insert into `county` VALUES(291, true, null, 'Dicle', 21);
insert into `county` VALUES(292, true, null, 'Didim', 9);
insert into `county` VALUES(293, true, null, 'Digor', 36);
insert into `county` VALUES(294, true, null, 'Dikili', 35);
insert into `county` VALUES(295, true, null, 'Dikmen', 57);
insert into `county` VALUES(296, true, null, 'Dilovası', 41);
insert into `county` VALUES(297, true, null, 'Dinar', 3);
insert into `county` VALUES(298, true, null, 'Divriği', 58);
insert into `county` VALUES(299, true, null, 'Diyadin', 4);
insert into `county` VALUES(300, true, null, 'Dodurga', 19);

insert into `county` VALUES(301, true, null, 'Doğanhisar', 42);
insert into `county` VALUES(302, true, null, 'Doğankent', 28);
insert into `county` VALUES(303, true, null, 'Doğanşar', 58);
insert into `county` VALUES(304, true, null, 'Doğanşehir', 44);
insert into `county` VALUES(305, true, null, 'Doğanyol', 44);
insert into `county` VALUES(306, true, null, 'Doğanyurt', 37);
insert into `county` VALUES(307, true, null, 'Doğubayazıt', 4);
insert into `county` VALUES(308, true, null, 'Domaniç', 43);
insert into `county` VALUES(309, true, null, 'Dörtdivan', 14);
insert into `county` VALUES(310, true, null, 'Dörtyol', 31);
insert into `county` VALUES(311, true, null, 'Döşemealtı', 7);
insert into `county` VALUES(312, true, null, 'Dulkadiroğlu', 46);
insert into `county` VALUES(313, true, null, 'Dumlupınar', 43);
insert into `county` VALUES(314, true, null, 'Durağan', 57);
insert into `county` VALUES(315, true, null, 'Dursunbey', 10);
insert into `county` VALUES(316, true, null, 'Düzce', 81);
insert into `county` VALUES(317, true, null, 'Düziçi', 80);
insert into `county` VALUES(318, true, null, 'Düzköy', 61);
insert into `county` VALUES(319, true, null, 'Eceabat', 17);
insert into `county` VALUES(320, true, null, 'Edirne', 22);
insert into `county` VALUES(321, true, null, 'Edremit', 10);
insert into `county` VALUES(322, true, null, 'Edremit', 65);
insert into `county` VALUES(323, true, null, 'Efeler', 9);
insert into `county` VALUES(324, true, null, 'Eflani', 78);
insert into `county` VALUES(325, true, null, 'Eğil', 21);
insert into `county` VALUES(326, true, null, 'Eğirdir', 32);
insert into `county` VALUES(327, true, null, 'Ekinözü', 46);
insert into `county` VALUES(328, true, null, 'Elazığ', 23);
insert into `county` VALUES(329, true, null, 'Elbeyli', 79);
insert into `county` VALUES(330, true, null, 'Elbistan', 46);
insert into `county` VALUES(331, true, null, 'Eldivan', 18);
insert into `county` VALUES(332, true, null, 'Eleşkirt', 4);
insert into `county` VALUES(333, true, null, 'Elmadağ', 6);
insert into `county` VALUES(334, true, null, 'Elmalı', 7);
insert into `county` VALUES(335, true, null, 'Emet', 43);
insert into `county` VALUES(336, true, null, 'Emirdağ', 3);
insert into `county` VALUES(337, true, null, 'Emirgazi', 42);
insert into `county` VALUES(338, true, null, 'Enez', 22);
insert into `county` VALUES(339, true, null, 'Erbaa', 60);
insert into `county` VALUES(340, true, null, 'Erciş', 65);
insert into `county` VALUES(341, true, null, 'Erdek', 10);
insert into `county` VALUES(342, true, null, 'Erdemli', 33);
insert into `county` VALUES(343, true, null, 'Ereğli', 42);
insert into `county` VALUES(344, true, null, 'Ereğli', 67);
insert into `county` VALUES(345, true, null, 'Erenler', 54);
insert into `county` VALUES(346, true, null, 'Erfelek', 57);
insert into `county` VALUES(347, true, null, 'Ergani', 21);
insert into `county` VALUES(348, true, null, 'Ergene', 59);
insert into `county` VALUES(349, true, null, 'Ermenek', 70);
insert into `county` VALUES(350, true, null, 'Eruh', 56);
insert into `county` VALUES(351, true, null, 'Erzin', 31);
insert into `county` VALUES(352, true, null, 'Erzincan', 24);
insert into `county` VALUES(353, true, null, 'Esenler', 34);
insert into `county` VALUES(354, true, null, 'Esenyurt', 34);
insert into `county` VALUES(355, true, null, 'Eskil', 68);
insert into `county` VALUES(356, true, null, 'Eskipazar', 78);
insert into `county` VALUES(357, true, null, 'Espiye', 28);
insert into `county` VALUES(358, true, null, 'Eşme', 64);
insert into `county` VALUES(359, true, null, 'Etimesgut', 6);
insert into `county` VALUES(360, true, null, 'Evciler', 3);
insert into `county` VALUES(361, true, null, 'Evren', 6);
insert into `county` VALUES(362, true, null, 'Eynesil', 28);
insert into `county` VALUES(363, true, null, 'Eyüp', 34);
insert into `county` VALUES(364, true, null, 'Eyyübiye', 63);
insert into `county` VALUES(365, true, null, 'Ezine', 17);
insert into `county` VALUES(366, true, null, 'Fatih', 34);
insert into `county` VALUES(367, true, null, 'Fatsa', 52);
insert into `county` VALUES(368, true, null, 'Feke', 1);
insert into `county` VALUES(369, true, null, 'Felahiye', 38);
insert into `county` VALUES(370, true, null, 'Ferizli', 54);
insert into `county` VALUES(371, true, null, 'Fethiye', 48);
insert into `county` VALUES(372, true, null, 'Fındıklı', 53);
insert into `county` VALUES(373, true, null, 'Finike', 7);
insert into `county` VALUES(374, true, null, 'Foça', 35);
insert into `county` VALUES(375, true, null, 'Gaziemir', 35);
insert into `county` VALUES(376, true, null, 'Gaziosmanpaşa', 34);
insert into `county` VALUES(377, true, null, 'Gazipaşa', 7);
insert into `county` VALUES(378, true, null, 'Gebze', 41);
insert into `county` VALUES(379, true, null, 'Gediz', 43);
insert into `county` VALUES(380, true, null, 'Gelendost', 32);
insert into `county` VALUES(381, true, null, 'Gelibolu', 17);
insert into `county` VALUES(382, true, null, 'Gemerek', 58);
insert into `county` VALUES(383, true, null, 'Gemlik', 16);
insert into `county` VALUES(384, true, null, 'Genç', 12);
insert into `county` VALUES(385, true, null, 'Gercüş', 72);
insert into `county` VALUES(386, true, null, 'Gerede', 14);
insert into `county` VALUES(387, true, null, 'Gerger', 2);
insert into `county` VALUES(388, true, null, 'Germencik', 9);
insert into `county` VALUES(389, true, null, 'Gerze', 57);
insert into `county` VALUES(390, true, null, 'Gevaş', 65);
insert into `county` VALUES(391, true, null, 'Geyve', 54);
insert into `county` VALUES(392, true, null, 'Giresun', 28);
insert into `county` VALUES(393, true, null, 'Gökçeada', 17);
insert into `county` VALUES(394, true, null, 'Gökçebey', 67);
insert into `county` VALUES(395, true, null, 'Göksun', 46);
insert into `county` VALUES(396, true, null, 'Gölbaşı', 2);
insert into `county` VALUES(397, true, null, 'Gölbaşı', 6);
insert into `county` VALUES(398, true, null, 'Gölcük', 41);
insert into `county` VALUES(399, true, null, 'Göle', 75);
insert into `county` VALUES(400, true, null, 'Gölhisar', 15);

insert into `county` VALUES(401, true, null, 'Gölköy', 52);
insert into `county` VALUES(402, true, null, 'Gölmarmara', 45);
insert into `county` VALUES(403, true, null, 'Gölova', 58);
insert into `county` VALUES(404, true, null, 'Gölpazarı', 11);
insert into `county` VALUES(405, true, null, 'Gölyaka', 81);
insert into `county` VALUES(406, true, null, 'Gömeç', 10);
insert into `county` VALUES(407, true, null, 'Gönen', 10);
insert into `county` VALUES(408, true, null, 'Gönen', 32);
insert into `county` VALUES(409, true, null, 'Gördes', 45);
insert into `county` VALUES(410, true, null, 'Görele', 28);
insert into `county` VALUES(411, true, null, 'Göynücek', 5);
insert into `county` VALUES(412, true, null, 'Göynük', 14);
insert into `county` VALUES(413, true, null, 'Güce', 28);
insert into `county` VALUES(414, true, null, 'Güçlükonak', 73);
insert into `county` VALUES(415, true, null, 'Güdül', 6);
insert into `county` VALUES(416, true, null, 'Gülağaç', 68);
insert into `county` VALUES(417, true, null, 'Gülnar', 33);
insert into `county` VALUES(418, true, null, 'Gülşehir', 50);
insert into `county` VALUES(419, true, null, 'Gülyalı', 52);
insert into `county` VALUES(420, true, null, 'Gümüşhacıköy', 5);
insert into `county` VALUES(421, true, null, 'Gümüşhane', 29);
insert into `county` VALUES(422, true, null, 'Gümüşova', 81);
insert into `county` VALUES(423, true, null, 'Gündoğmuş', 7);
insert into `county` VALUES(424, true, null, 'Güney', 20);
insert into `county` VALUES(425, true, null, 'Güneysınır', 42);
insert into `county` VALUES(426, true, null, 'Güneysu', 53);
insert into `county` VALUES(427, true, null, 'Güngören', 34);
insert into `county` VALUES(428, true, null, 'Günyüzü', 26);
insert into `county` VALUES(429, true, null, 'Gürgentepe', 52);
insert into `county` VALUES(430, true, null, 'Güroymak', 13);
insert into `county` VALUES(431, true, null, 'Gürpınar', 65);
insert into `county` VALUES(432, true, null, 'Gürsu', 16);
insert into `county` VALUES(433, true, null, 'Gürün', 58);
insert into `county` VALUES(434, true, null, 'Güzelbahçe', 35);
insert into `county` VALUES(435, true, null, 'Güzelyurt', 68);
insert into `county` VALUES(436, true, null, 'Hacıbektaş', 50);
insert into `county` VALUES(437, true, null, 'Hacılar', 38);
insert into `county` VALUES(438, true, null, 'Hadim', 42);
insert into `county` VALUES(439, true, null, 'Hafik', 58);
insert into `county` VALUES(440, true, null, 'Hakkâri', 30);
insert into `county` VALUES(441, true, null, 'Halfeti', 63);
insert into `county` VALUES(442, true, null, 'Haliliye', 63);
insert into `county` VALUES(443, true, null, 'Halkapınar', 42);
insert into `county` VALUES(444, true, null, 'Hamamözü', 5);
insert into `county` VALUES(445, true, null, 'Hamur', 4);
insert into `county` VALUES(446, true, null, 'Han', 26);
insert into `county` VALUES(447, true, null, 'Hanak', 75);
insert into `county` VALUES(448, true, null, 'Hani', 21);
insert into `county` VALUES(449, true, null, 'Hanönü', 37);
insert into `county` VALUES(450, true, null, 'Harmancık', 16);
insert into `county` VALUES(451, true, null, 'Harran', 63);
insert into `county` VALUES(452, true, null, 'Hasanbeyli', 80);
insert into `county` VALUES(453, true, null, 'Hasankeyf', 72);
insert into `county` VALUES(454, true, null, 'Hasköy', 49);
insert into `county` VALUES(455, true, null, 'Hassa', 31);
insert into `county` VALUES(456, true, null, 'Havran', 10);
insert into `county` VALUES(457, true, null, 'Havsa', 22);
insert into `county` VALUES(458, true, null, 'Havza', 55);
insert into `county` VALUES(459, true, null, 'Haymana', 6);
insert into `county` VALUES(460, true, null, 'Hayrabolu', 59);
insert into `county` VALUES(461, true, null, 'Hayrat', 61);
insert into `county` VALUES(462, true, null, 'Hazro', 21);
insert into `county` VALUES(463, true, null, 'Hekimhan', 44);
insert into `county` VALUES(464, true, null, 'Hemşin', 53);
insert into `county` VALUES(465, true, null, 'Hendek', 54);
insert into `county` VALUES(466, true, null, 'Hınıs', 25);
insert into `county` VALUES(467, true, null, 'Hilvan', 63);
insert into `county` VALUES(468, true, null, 'Hisarcık', 43);
insert into `county` VALUES(469, true, null, 'Hizan', 13);
insert into `county` VALUES(470, true, null, 'Hocalar', 3);
insert into `county` VALUES(471, true, null, 'Honaz', 20);
insert into `county` VALUES(472, true, null, 'Hopa', 8);
insert into `county` VALUES(473, true, null, 'Horasan', 25);
insert into `county` VALUES(474, true, null, 'Hozat', 62);
insert into `county` VALUES(475, true, null, 'Hüyük', 42);
insert into `county` VALUES(476, true, null, 'Iğdır', 76);
insert into `county` VALUES(477, true, null, 'Ilgaz', 18);
insert into `county` VALUES(478, true, null, 'Ilgın', 42);
insert into `county` VALUES(479, true, null, 'Isparta', 32);
insert into `county` VALUES(480, true, null, 'İbradı', 7);
insert into `county` VALUES(481, true, null, 'İdil', 73);
insert into `county` VALUES(482, true, null, 'İhsangazi', 37);
insert into `county` VALUES(483, true, null, 'İhsaniye', 3);
insert into `county` VALUES(484, true, null, 'İkizce', 52);
insert into `county` VALUES(485, true, null, 'İkizdere', 53);
insert into `county` VALUES(486, true, null, 'İliç', 24);
insert into `county` VALUES(487, true, null, 'İlkadım', 55);
insert into `county` VALUES(488, true, null, 'İmamoğlu', 1);
insert into `county` VALUES(489, true, null, 'İmranlı', 58);
insert into `county` VALUES(490, true, null, 'İncesu', 38);
insert into `county` VALUES(491, true, null, 'İncirliova', 9);
insert into `county` VALUES(492, true, null, 'İnebolu', 37);
insert into `county` VALUES(493, true, null, 'İnegöl', 16);
insert into `county` VALUES(494, true, null, 'İnhisar', 11);
insert into `county` VALUES(495, true, null, 'İnönü', 26);
insert into `county` VALUES(496, true, null, 'İpekyolu', 65);
insert into `county` VALUES(497, true, null, 'İpsala', 22);
insert into `county` VALUES(498, true, null, 'İscehisar', 3);
insert into `county` VALUES(499, true, null, 'İskenderun', 31);
insert into `county` VALUES(500, true, null, 'İskilip', 19);

insert into `county` VALUES(501, true, null, 'İslahiye', 27);
insert into `county` VALUES(502, true, null, 'İspir', 25);
insert into `county` VALUES(503, true, null, 'İvrindi', 10);
insert into `county` VALUES(504, true, null, 'İyidere', 53);
insert into `county` VALUES(505, true, null, 'İzmit', 41);
insert into `county` VALUES(506, true, null, 'İznik', 16);
insert into `county` VALUES(507, true, null, 'Kabadüz', 52);
insert into `county` VALUES(508, true, null, 'Kabataş', 52);
insert into `county` VALUES(509, true, null, 'Kadıköy', 34);
insert into `county` VALUES(510, true, null, 'Kadınhanı', 42);
insert into `county` VALUES(511, true, null, 'Kadışehri', 66);
insert into `county` VALUES(512, true, null, 'Kadirli', 80);
insert into `county` VALUES(513, true, null, 'Kağıthane', 34);
insert into `county` VALUES(514, true, null, 'Kağızman', 36);
insert into `county` VALUES(515, true, null, 'Kahta', 2);
insert into `county` VALUES(516, true, null, 'Kale', 20);
insert into `county` VALUES(517, true, null, 'Kale', 44);
insert into `county` VALUES(518, true, null, 'Kalecik', 6);
insert into `county` VALUES(519, true, null, 'Kalkandere', 53);
insert into `county` VALUES(520, true, null, 'Kaman', 40);
insert into `county` VALUES(521, true, null, 'Kandıra', 41);
insert into `county` VALUES(522, true, null, 'Kangal', 58);
insert into `county` VALUES(523, true, null, 'Kapaklı', 59);
insert into `county` VALUES(524, true, null, 'Karabağlar', 35);
insert into `county` VALUES(525, true, null, 'Karaburun', 35);
insert into `county` VALUES(526, true, null, 'Karabük', 78);
insert into `county` VALUES(527, true, null, 'Karacabey', 16);
insert into `county` VALUES(528, true, null, 'Karacasu', 9);
insert into `county` VALUES(529, true, null, 'Karaçoban', 25);
insert into `county` VALUES(530, true, null, 'Karahallı', 64);
insert into `county` VALUES(531, true, null, 'Karaisalı', 1);
insert into `county` VALUES(532, true, null, 'Karakeçili', 71);
insert into `county` VALUES(533, true, null, 'Karakoçan', 23);
insert into `county` VALUES(534, true, null, 'Karakoyunlu', 76);
insert into `county` VALUES(535, true, null, 'Karaköprü', 63);
insert into `county` VALUES(536, true, null, 'Karaman', 70);
insert into `county` VALUES(537, true, null, 'Karamanlı', 15);
insert into `county` VALUES(538, true, null, 'Karamürsel', 41);
insert into `county` VALUES(539, true, null, 'Karapınar', 42);
insert into `county` VALUES(540, true, null, 'Karapürçek', 54);
insert into `county` VALUES(541, true, null, 'Karasu', 54);
insert into `county` VALUES(542, true, null, 'Karataş', 1);
insert into `county` VALUES(543, true, null, 'Karatay', 42);
insert into `county` VALUES(544, true, null, 'Karayazı', 25);
insert into `county` VALUES(545, true, null, 'Karesi', 10);
insert into `county` VALUES(546, true, null, 'Kargı', 19);
insert into `county` VALUES(547, true, null, 'Karkamış', 27);
insert into `county` VALUES(548, true, null, 'Karlıova', 12);
insert into `county` VALUES(549, true, null, 'Karpuzlu', 9);
insert into `county` VALUES(550, true, null, 'Kars', 36);
insert into `county` VALUES(551, true, null, 'Karşıyaka', 35);
insert into `county` VALUES(552, true, null, 'Kartal', 34);
insert into `county` VALUES(553, true, null, 'Kartepe', 41);
insert into `county` VALUES(554, true, null, 'Kastamonu', 37);
insert into `county` VALUES(555, true, null, 'Kaş', 7);
insert into `county` VALUES(556, true, null, 'Kavak', 55);
insert into `county` VALUES(557, true, null, 'Kavaklıdere', 48);
insert into `county` VALUES(558, true, null, 'Kayapınar', 21);
insert into `county` VALUES(559, true, null, 'Kaynarca', 54);
insert into `county` VALUES(560, true, null, 'Kaynaşlı', 81);
insert into `county` VALUES(561, true, null, 'Kazan', 6);
insert into `county` VALUES(562, true, null, 'Kazımkarabekir', 70);
insert into `county` VALUES(563, true, null, 'Keban', 23);
insert into `county` VALUES(564, true, null, 'Keçiborlu', 32);
insert into `county` VALUES(565, true, null, 'Keçiören', 6);
insert into `county` VALUES(566, true, null, 'Keles', 16);
insert into `county` VALUES(567, true, null, 'Kelkit', 29);
insert into `county` VALUES(568, true, null, 'Kemah', 24);
insert into `county` VALUES(569, true, null, 'Kemaliye', 24);
insert into `county` VALUES(570, true, null, 'Kemalpaşa', 35);
insert into `county` VALUES(571, true, null, 'Kemer', 7);
insert into `county` VALUES(572, true, null, 'Kemer', 15);
insert into `county` VALUES(573, true, null, 'Kepez', 7);
insert into `county` VALUES(574, true, null, 'Kepsut', 10);
insert into `county` VALUES(575, true, null, 'Keskin', 71);
insert into `county` VALUES(576, true, null, 'Kestel', 16);
insert into `county` VALUES(577, true, null, 'Keşan', 22);
insert into `county` VALUES(578, true, null, 'Keşap', 28);
insert into `county` VALUES(579, true, null, 'Kıbrıscık', 14);
insert into `county` VALUES(580, true, null, 'Kınık', 35);
insert into `county` VALUES(581, true, null, 'Kırıkhan', 31);
insert into `county` VALUES(582, true, null, 'Kırıkkale', 71);
insert into `county` VALUES(583, true, null, 'Kırkağaç', 45);
insert into `county` VALUES(584, true, null, 'Kırklareli', 39);
insert into `county` VALUES(585, true, null, 'Kırşehir', 40);
insert into `county` VALUES(586, true, null, 'Kızılcahamam', 6);
insert into `county` VALUES(587, true, null, 'Kızılırmak', 18);
insert into `county` VALUES(588, true, null, 'Kızılören', 3);
insert into `county` VALUES(589, true, null, 'Kızıltepe', 47);
insert into `county` VALUES(590, true, null, 'Kiğı', 12);
insert into `county` VALUES(591, true, null, 'Kilimli', 67);
insert into `county` VALUES(592, true, null, 'Kilis', 79);
insert into `county` VALUES(593, true, null, 'Kiraz', 35);
insert into `county` VALUES(594, true, null, 'Kocaali', 54);
insert into `county` VALUES(595, true, null, 'Kocaköy', 21);
insert into `county` VALUES(596, true, null, 'Kocasinan', 38);
insert into `county` VALUES(597, true, null, 'Koçarlı', 9);
insert into `county` VALUES(598, true, null, 'Kofçaz', 39);
insert into `county` VALUES(599, true, null, 'Konak', 35);
insert into `county` VALUES(600, true, null, 'Konyaaltı', 7);

insert into `county` VALUES(601, true, null, 'Korgan', 52);
insert into `county` VALUES(602, true, null, 'Korgun', 18);
insert into `county` VALUES(603, true, null, 'Korkut', 49);
insert into `county` VALUES(604, true, null, 'Korkuteli', 7);
insert into `county` VALUES(605, true, null, 'Kovancılar', 23);
insert into `county` VALUES(606, true, null, 'Koyulhisar', 58);
insert into `county` VALUES(607, true, null, 'Kozaklı', 50);
insert into `county` VALUES(608, true, null, 'Kozan', 1);
insert into `county` VALUES(609, true, null, 'Kozlu', 67);
insert into `county` VALUES(610, true, null, 'Kozluk', 72);
insert into `county` VALUES(611, true, null, 'Köprübaşı', 45);
insert into `county` VALUES(612, true, null, 'Köprübaşı', 61);
insert into `county` VALUES(613, true, null, 'Köprüköy', 25);
insert into `county` VALUES(614, true, null, 'Körfez', 41);
insert into `county` VALUES(615, true, null, 'Köse', 29);
insert into `county` VALUES(616, true, null, 'Köşk', 9);
insert into `county` VALUES(617, true, null, 'Köyceğiz', 48);
insert into `county` VALUES(618, true, null, 'Kula', 45);
insert into `county` VALUES(619, true, null, 'Kulp', 21);
insert into `county` VALUES(620, true, null, 'Kulu', 42);
insert into `county` VALUES(621, true, null, 'Kuluncak', 44);
insert into `county` VALUES(622, true, null, 'Kumlu', 31);
insert into `county` VALUES(623, true, null, 'Kumluca', 7);
insert into `county` VALUES(624, true, null, 'Kumru', 52);
insert into `county` VALUES(625, true, null, 'Kurşunlu', 18);
insert into `county` VALUES(626, true, null, 'Kurtalan', 56);
insert into `county` VALUES(627, true, null, 'Kurucaşile', 74);
insert into `county` VALUES(628, true, null, 'Kuşadası', 9);
insert into `county` VALUES(629, true, null, 'Kuyucak', 9);
insert into `county` VALUES(630, true, null, 'Küçükçekmece', 34);
insert into `county` VALUES(631, true, null, 'Küre', 37);
insert into `county` VALUES(632, true, null, 'Kürtün', 29);
insert into `county` VALUES(633, true, null, 'Kütahya', 43);
insert into `county` VALUES(634, true, null, 'Laçin', 19);
insert into `county` VALUES(635, true, null, 'Ladik', 55);
insert into `county` VALUES(636, true, null, 'Lalapaşa', 22);
insert into `county` VALUES(637, true, null, 'Lapseki', 17);
insert into `county` VALUES(638, true, null, 'Lice', 21);
insert into `county` VALUES(639, true, null, 'Lüleburgaz', 39);
insert into `county` VALUES(640, true, null, 'Maçka', 61);
insert into `county` VALUES(641, true, null, 'Maden', 23);
insert into `county` VALUES(642, true, null, 'Mahmudiye', 26);
insert into `county` VALUES(643, true, null, 'Malazgirt', 49);
insert into `county` VALUES(644, true, null, 'Malkara', 59);
insert into `county` VALUES(645, true, null, 'Maltepe', 34);
insert into `county` VALUES(646, true, null, 'Mamak', 6);
insert into `county` VALUES(647, true, null, 'Manavgat', 7);
insert into `county` VALUES(648, true, null, 'Manyas', 10);
insert into `county` VALUES(649, true, null, 'Marmara', 10);
insert into `county` VALUES(650, true, null, 'Marmaraereğlisi', 59);
insert into `county` VALUES(651, true, null, 'Marmaris', 48);
insert into `county` VALUES(652, true, null, 'Mazgirt', 62);
insert into `county` VALUES(653, true, null, 'Mazıdağı', 47);
insert into `county` VALUES(654, true, null, 'Mecitözü', 19);
insert into `county` VALUES(655, true, null, 'Melikgazi', 38);
insert into `county` VALUES(656, true, null, 'Menderes', 35);
insert into `county` VALUES(657, true, null, 'Menemen', 35);
insert into `county` VALUES(658, true, null, 'Mengen', 14);
insert into `county` VALUES(659, true, null, 'Menteşe', 48);
insert into `county` VALUES(660, true, null, 'Meram', 42);
insert into `county` VALUES(661, true, null, 'Meriç', 22);
insert into `county` VALUES(662, true, null, 'Merkezefendi', 20);
insert into `county` VALUES(663, true, null, 'Merzifon', 5);
insert into `county` VALUES(664, true, null, 'Mesudiye', 52);
insert into `county` VALUES(665, true, null, 'Mezitli', 33);
insert into `county` VALUES(666, true, null, 'Midyat', 47);
insert into `county` VALUES(667, true, null, 'Mihalgazi', 26);
insert into `county` VALUES(668, true, null, 'Mihalıççık', 26);
insert into `county` VALUES(669, true, null, 'Milas', 48);
insert into `county` VALUES(670, true, null, 'Mucur', 40);
insert into `county` VALUES(671, true, null, 'Mudanya', 16);
insert into `county` VALUES(672, true, null, 'Mudurnu', 14);
insert into `county` VALUES(673, true, null, 'Muradiye', 65);
insert into `county` VALUES(674, true, null, 'Muratlı', 59);
insert into `county` VALUES(675, true, null, 'Muratpaşa', 7);
insert into `county` VALUES(676, true, null, 'Murgul', 8);
insert into `county` VALUES(677, true, null, 'Musabeyli', 79);
insert into `county` VALUES(678, true, null, 'Mustafakemalpaşa', 16);
insert into `county` VALUES(679, true, null, 'Muş', 49);
insert into `county` VALUES(680, true, null, 'Mut', 33);
insert into `county` VALUES(681, true, null, 'Mutki', 13);
insert into `county` VALUES(682, true, null, 'Nallıhan', 6);
insert into `county` VALUES(683, true, null, 'Narlıdere', 35);
insert into `county` VALUES(684, true, null, 'Narman', 25);
insert into `county` VALUES(685, true, null, 'Nazımiye', 62);
insert into `county` VALUES(686, true, null, 'Nazilli', 9);
insert into `county` VALUES(687, true, null, 'Nevşehir', 50);
insert into `county` VALUES(688, true, null, 'Niğde', 51);
insert into `county` VALUES(689, true, null, 'Niksar', 60);
insert into `county` VALUES(690, true, null, 'Nilüfer', 16);
insert into `county` VALUES(691, true, null, 'Nizip', 27);
insert into `county` VALUES(692, true, null, 'Nurdağı', 27);
insert into `county` VALUES(693, true, null, 'Nurhak', 46);
insert into `county` VALUES(694, true, null, 'Nusaybin', 47);
insert into `county` VALUES(695, true, null, 'Odunpazarı', 26);
insert into `county` VALUES(696, true, null, 'Of', 61);
insert into `county` VALUES(697, true, null, 'Oğuzeli', 27);
insert into `county` VALUES(698, true, null, 'Oğuzlar', 19);
insert into `county` VALUES(699, true, null, 'Oltu', 25);
insert into `county` VALUES(700, true, null, 'Olur', 25);

insert into `county` VALUES(701, true, null, 'Ondokuzmayıs', 55);
insert into `county` VALUES(702, true, null, 'Onikişubat', 46);
insert into `county` VALUES(703, true, null, 'Orhaneli', 16);
insert into `county` VALUES(704, true, null, 'Orhangazi', 16);
insert into `county` VALUES(705, true, null, 'Orta', 18);
insert into `county` VALUES(706, true, null, 'Ortaca', 48);
insert into `county` VALUES(707, true, null, 'Ortahisar', 61);
insert into `county` VALUES(708, true, null, 'Ortaköy', 68);
insert into `county` VALUES(709, true, null, 'Ortaköy', 19);
insert into `county` VALUES(710, true, null, 'Osmancık', 19);
insert into `county` VALUES(711, true, null, 'Osmaneli', 11);
insert into `county` VALUES(712, true, null, 'Osmangazi', 16);
insert into `county` VALUES(713, true, null, 'Osmaniye', 80);
insert into `county` VALUES(714, true, null, 'Otlukbeli', 24);
insert into `county` VALUES(715, true, null, 'Ovacık', 78);
insert into `county` VALUES(716, true, null, 'Ovacık', 62);
insert into `county` VALUES(717, true, null, 'Ödemiş', 35);
insert into `county` VALUES(718, true, null, 'Ömerli', 47);
insert into `county` VALUES(719, true, null, 'Özalp', 65);
insert into `county` VALUES(720, true, null, 'Özvatan', 38);
insert into `county` VALUES(721, true, null, 'Palandöken', 25);
insert into `county` VALUES(722, true, null, 'Palu', 23);
insert into `county` VALUES(723, true, null, 'Pamukkale', 20);
insert into `county` VALUES(724, true, null, 'Pamukova', 54);
insert into `county` VALUES(725, true, null, 'Pasinler', 25);
insert into `county` VALUES(726, true, null, 'Patnos', 4);
insert into `county` VALUES(727, true, null, 'Payas', 31);
insert into `county` VALUES(728, true, null, 'Pazar', 53);
insert into `county` VALUES(729, true, null, 'Pazar', 60);
insert into `county` VALUES(730, true, null, 'Pazarcık', 46);
insert into `county` VALUES(731, true, null, 'Pazarlar', 43);
insert into `county` VALUES(732, true, null, 'Pazaryeri', 11);
insert into `county` VALUES(733, true, null, 'Pazaryolu', 25);
insert into `county` VALUES(734, true, null, 'Pehlivanköy', 39);
insert into `county` VALUES(735, true, null, 'Pendik', 34);
insert into `county` VALUES(736, true, null, 'Perşembe', 52);
insert into `county` VALUES(737, true, null, 'Pertek', 62);
insert into `county` VALUES(738, true, null, 'Pervari', 56);
insert into `county` VALUES(739, true, null, 'Pınarbaşı', 37);
insert into `county` VALUES(740, true, null, 'Pınarbaşı', 38);
insert into `county` VALUES(741, true, null, 'Pınarhisar', 39);
insert into `county` VALUES(742, true, null, 'Piraziz', 28);
insert into `county` VALUES(743, true, null, 'Polateli', 79);
insert into `county` VALUES(744, true, null, 'Polatlı', 6);
insert into `county` VALUES(745, true, null, 'Posof', 75);
insert into `county` VALUES(746, true, null, 'Pozantı', 1);
insert into `county` VALUES(747, true, null, 'Pursaklar', 6);
insert into `county` VALUES(748, true, null, 'Pülümür', 62);
insert into `county` VALUES(749, true, null, 'Pütürge', 44);
insert into `county` VALUES(750, true, null, 'Refahiye', 24);
insert into `county` VALUES(751, true, null, 'Reşadiye', 60);
insert into `county` VALUES(752, true, null, 'Reyhanlı', 31);
insert into `county` VALUES(753, true, null, 'Rize', 53);
insert into `county` VALUES(754, true, null, 'Safranbolu', 78);
insert into `county` VALUES(755, true, null, 'Saimbeyli', 1);
insert into `county` VALUES(756, true, null, 'Salıpazarı', 55);
insert into `county` VALUES(757, true, null, 'Salihli', 45);
insert into `county` VALUES(758, true, null, 'Samandağ', 31);
insert into `county` VALUES(759, true, null, 'Samsat', 2);
insert into `county` VALUES(760, true, null, 'Sancaktepe', 34);
insert into `county` VALUES(761, true, null, 'Sandıklı', 3);
insert into `county` VALUES(762, true, null, 'Sapanca', 54);
insert into `county` VALUES(763, true, null, 'Saray', 59);
insert into `county` VALUES(764, true, null, 'Saray', 65);
insert into `county` VALUES(765, true, null, 'Saraydüzü', 57);
insert into `county` VALUES(766, true, null, 'Saraykent', 66);
insert into `county` VALUES(767, true, null, 'Sarayköy', 20);
insert into `county` VALUES(768, true, null, 'Sarayönü', 42);
insert into `county` VALUES(769, true, null, 'Sarıcakaya', 26);
insert into `county` VALUES(770, true, null, 'Sarıçam', 1);
insert into `county` VALUES(771, true, null, 'Sarıgöl', 45);
insert into `county` VALUES(772, true, null, 'Sarıkamış', 36);
insert into `county` VALUES(773, true, null, 'Sarıkaya', 66);
insert into `county` VALUES(774, true, null, 'Sarıoğlan', 38);
insert into `county` VALUES(775, true, null, 'Sarıveliler', 70);
insert into `county` VALUES(776, true, null, 'Sarıyahşi', 68);
insert into `county` VALUES(777, true, null, 'Sarıyer', 34);
insert into `county` VALUES(778, true, null, 'Sarız', 38);
insert into `county` VALUES(779, true, null, 'Saruhanlı', 45);
insert into `county` VALUES(780, true, null, 'Sason', 72);
insert into `county` VALUES(781, true, null, 'Savaştepe', 10);
insert into `county` VALUES(782, true, null, 'Savur', 47);
insert into `county` VALUES(783, true, null, 'Seben', 14);
insert into `county` VALUES(784, true, null, 'Seferihisar', 35);
insert into `county` VALUES(785, true, null, 'Selçuk', 35);
insert into `county` VALUES(786, true, null, 'Selçuklu', 42);
insert into `county` VALUES(787, true, null, 'Selendi', 45);
insert into `county` VALUES(788, true, null, 'Selim', 36);
insert into `county` VALUES(789, true, null, 'Senirkent', 32);
insert into `county` VALUES(790, true, null, 'Serdivan', 54);
insert into `county` VALUES(791, true, null, 'Serik', 7);
insert into `county` VALUES(792, true, null, 'Serinhisar', 20);
insert into `county` VALUES(793, true, null, 'Seydikemer', 48);
insert into `county` VALUES(794, true, null, 'Seydiler', 37);
insert into `county` VALUES(795, true, null, 'Seydişehir', 42);
insert into `county` VALUES(796, true, null, 'Seyhan', 1);
insert into `county` VALUES(797, true, null, 'Seyitgazi', 26);
insert into `county` VALUES(798, true, null, 'Sındırgı', 10);
insert into `county` VALUES(799, true, null, 'Siirt', 56);
insert into `county` VALUES(800, true, null, 'Silifke', 33);

insert into `county` VALUES(801, true, null, 'Silivri', 34);
insert into `county` VALUES(802, true, null, 'Silopi', 73);
insert into `county` VALUES(803, true, null, 'Silvan', 21);
insert into `county` VALUES(804, true, null, 'Simav', 43);
insert into `county` VALUES(805, true, null, 'Sinanpaşa', 3);
insert into `county` VALUES(806, true, null, 'Sincan', 6);
insert into `county` VALUES(807, true, null, 'Sincik', 2);
insert into `county` VALUES(808, true, null, 'Sinop', 57);
insert into `county` VALUES(809, true, null, 'Sivas', 58);
insert into `county` VALUES(810, true, null, 'Sivaslı', 64);
insert into `county` VALUES(811, true, null, 'Siverek', 63);
insert into `county` VALUES(812, true, null, 'Sivrice', 23);
insert into `county` VALUES(813, true, null, 'Sivrihisar', 26);
insert into `county` VALUES(814, true, null, 'Solhan', 12);
insert into `county` VALUES(815, true, null, 'Soma', 45);
insert into `county` VALUES(816, true, null, 'Sorgun', 66);
insert into `county` VALUES(817, true, null, 'Söğüt', 11);
insert into `county` VALUES(818, true, null, 'Söğütlü', 54);
insert into `county` VALUES(819, true, null, 'Söke', 9);
insert into `county` VALUES(820, true, null, 'Sulakyurt', 71);
insert into `county` VALUES(821, true, null, 'Sultanbeyli', 34);
insert into `county` VALUES(822, true, null, 'Sultandağı', 3);
insert into `county` VALUES(823, true, null, 'Sultangazi', 34);
insert into `county` VALUES(824, true, null, 'Sultanhisar', 9);
insert into `county` VALUES(825, true, null, 'Suluova', 5);
insert into `county` VALUES(826, true, null, 'Sulusaray', 60);
insert into `county` VALUES(827, true, null, 'Sumbas', 80);
insert into `county` VALUES(828, true, null, 'Sungurlu', 19);
insert into `county` VALUES(829, true, null, 'Sur', 21);
insert into `county` VALUES(830, true, null, 'Suruç', 63);
insert into `county` VALUES(831, true, null, 'Susurluk', 10);
insert into `county` VALUES(832, true, null, 'Susuz', 36);
insert into `county` VALUES(833, true, null, 'Suşehri', 58);
insert into `county` VALUES(834, true, null, 'Süleymanpaşa', 59);
insert into `county` VALUES(835, true, null, 'Süloğlu', 22);
insert into `county` VALUES(836, true, null, 'Sürmene', 61);
insert into `county` VALUES(837, true, null, 'Sütçüler', 32);
insert into `county` VALUES(838, true, null, 'Şabanözü', 18);
insert into `county` VALUES(839, true, null, 'Şahinbey', 27);
insert into `county` VALUES(840, true, null, 'Şalpazarı', 61);
insert into `county` VALUES(841, true, null, 'Şaphane', 43);
insert into `county` VALUES(842, true, null, 'Şarkışla', 58);
insert into `county` VALUES(843, true, null, 'Şarkikaraağaç', 32);
insert into `county` VALUES(844, true, null, 'Şarköy', 59);
insert into `county` VALUES(845, true, null, 'Şavşat', 8);
insert into `county` VALUES(846, true, null, 'Şebinkarahisar', 28);
insert into `county` VALUES(847, true, null, 'Şefaatli', 66);
insert into `county` VALUES(848, true, null, 'Şehitkamil', 27);
insert into `county` VALUES(849, true, null, 'Şehzadeler', 45);
insert into `county` VALUES(850, true, null, 'Şemdinli', 30);
insert into `county` VALUES(851, true, null, 'Şenkaya', 25);
insert into `county` VALUES(852, true, null, 'Şenpazar', 37);
insert into `county` VALUES(853, true, null, 'Şereflikoçhisar', 6);
insert into `county` VALUES(854, true, null, 'Şırnak', 73);
insert into `county` VALUES(855, true, null, 'Şile', 34);
insert into `county` VALUES(856, true, null, 'Şiran', 29);
insert into `county` VALUES(857, true, null, 'Şirvan', 56);
insert into `county` VALUES(858, true, null, 'Şişli', 34);
insert into `county` VALUES(859, true, null, 'Şuhut', 3);
insert into `county` VALUES(860, true, null, 'Talas', 38);
insert into `county` VALUES(861, true, null, 'Taraklı', 54);
insert into `county` VALUES(862, true, null, 'Tarsus', 33);
insert into `county` VALUES(863, true, null, 'Taşkent', 42);
insert into `county` VALUES(864, true, null, 'Taşköprü', 37);
insert into `county` VALUES(865, true, null, 'Taşlıçay', 4);
insert into `county` VALUES(866, true, null, 'Taşova', 5);
insert into `county` VALUES(867, true, null, 'Tatvan', 13);
insert into `county` VALUES(868, true, null, 'Tavas', 20);
insert into `county` VALUES(869, true, null, 'Tavşanlı', 43);
insert into `county` VALUES(870, true, null, 'Tefenni', 15);
insert into `county` VALUES(871, true, null, 'Tekkeköy', 55);
insert into `county` VALUES(872, true, null, 'Tekman', 25);
insert into `county` VALUES(873, true, null, 'Tepebaşı', 26);
insert into `county` VALUES(874, true, null, 'Tercan', 24);
insert into `county` VALUES(875, true, null, 'Termal', 77);
insert into `county` VALUES(876, true, null, 'Terme', 55);
insert into `county` VALUES(877, true, null, 'Tillo', 56);
insert into `county` VALUES(878, true, null, 'Tire', 35);
insert into `county` VALUES(879, true, null, 'Tirebolu', 28);
insert into `county` VALUES(880, true, null, 'Tokat', 60);
insert into `county` VALUES(881, true, null, 'Tomarza', 38);
insert into `county` VALUES(882, true, null, 'Tonya', 61);
insert into `county` VALUES(883, true, null, 'Toprakkale', 80);
insert into `county` VALUES(884, true, null, 'Torbalı', 35);
insert into `county` VALUES(885, true, null, 'Toroslar', 33);
insert into `county` VALUES(886, true, null, 'Tortum', 25);
insert into `county` VALUES(887, true, null, 'Torul', 29);
insert into `county` VALUES(888, true, null, 'Tosya', 37);
insert into `county` VALUES(889, true, null, 'Tufanbeyli', 1);
insert into `county` VALUES(890, true, null, 'Tunceli', 62);
insert into `county` VALUES(891, true, null, 'Turgutlu', 45);
insert into `county` VALUES(892, true, null, 'Turhal', 60);
insert into `county` VALUES(893, true, null, 'Tuşba', 65);
insert into `county` VALUES(894, true, null, 'Tut', 2);
insert into `county` VALUES(895, true, null, 'Tutak', 4);
insert into `county` VALUES(896, true, null, 'Tuzla', 34);
insert into `county` VALUES(897, true, null, 'Tuzluca', 76);
insert into `county` VALUES(898, true, null, 'Tuzlukçu', 42);
insert into `county` VALUES(899, true, null, 'Türkeli', 57);
insert into `county` VALUES(900, true, null, 'Türkoğlu', 46);

insert into `county` VALUES(901, true, null, 'Uğurludağ', 19);
insert into `county` VALUES(902, true, null, 'Ula', 48);
insert into `county` VALUES(903, true, null, 'Ulaş', 58);
insert into `county` VALUES(904, true, null, 'Ulubey', 52);
insert into `county` VALUES(905, true, null, 'Ulubey', 64);
insert into `county` VALUES(906, true, null, 'Uluborlu', 32);
insert into `county` VALUES(907, true, null, 'Uludere', 73);
insert into `county` VALUES(908, true, null, 'Ulukışla', 51);
insert into `county` VALUES(909, true, null, 'Ulus', 74);
insert into `county` VALUES(910, true, null, 'Urla', 35);
insert into `county` VALUES(911, true, null, 'Uşak', 64);
insert into `county` VALUES(912, true, null, 'Uzundere', 25);
insert into `county` VALUES(913, true, null, 'Uzunköprü', 22);
insert into `county` VALUES(914, true, null, 'Ümraniye', 34);
insert into `county` VALUES(915, true, null, 'Ünye', 52);
insert into `county` VALUES(916, true, null, 'Ürgüp', 50);
insert into `county` VALUES(917, true, null, 'Üsküdar', 34);
insert into `county` VALUES(918, true, null, 'Üzümlü', 24);
insert into `county` VALUES(919, true, null, 'Vakfıkebir', 61);
insert into `county` VALUES(920, true, null, 'Varto', 49);
insert into `county` VALUES(921, true, null, 'Vezirköprü', 55);
insert into `county` VALUES(922, true, null, 'Viranşehir', 63);
insert into `county` VALUES(923, true, null, 'Vize', 39);
insert into `county` VALUES(924, true, null, 'Yağlıdere', 28);
insert into `county` VALUES(925, true, null, 'Yahşihan', 71);
insert into `county` VALUES(926, true, null, 'Yahyalı', 38);
insert into `county` VALUES(927, true, null, 'Yakakent', 55);
insert into `county` VALUES(928, true, null, 'Yakutiye', 25);
insert into `county` VALUES(929, true, null, 'Yalıhüyük', 42);
insert into `county` VALUES(930, true, null, 'Yalova', 77);
insert into `county` VALUES(931, true, null, 'Yalvaç', 32);
insert into `county` VALUES(932, true, null, 'Yapraklı', 18);
insert into `county` VALUES(933, true, null, 'Yatağan', 48);
insert into `county` VALUES(934, true, null, 'Yavuzeli', 27);
insert into `county` VALUES(935, true, null, 'Yayladağı', 31);
insert into `county` VALUES(936, true, null, 'Yayladere', 12);
insert into `county` VALUES(937, true, null, 'Yazıhan', 44);
insert into `county` VALUES(938, true, null, 'Yedisu', 12);
insert into `county` VALUES(939, true, null, 'Yenice', 17);
insert into `county` VALUES(940, true, null, 'Yenice', 78);
insert into `county` VALUES(941, true, null, 'Yeniçağa', 14);
insert into `county` VALUES(942, true, null, 'Yenifakılı', 66);
insert into `county` VALUES(943, true, null, 'Yenimahalle', 6);
insert into `county` VALUES(944, true, null, 'Yenipazar', 9);
insert into `county` VALUES(945, true, null, 'Yenipazar', 11);
insert into `county` VALUES(946, true, null, 'Yenişarbademli', 32);
insert into `county` VALUES(947, true, null, 'Yenişehir', 16);
insert into `county` VALUES(948, true, null, 'Yenişehir', 21);
insert into `county` VALUES(949, true, null, 'Yenişehir', 33);
insert into `county` VALUES(950, true, null, 'Yerköy', 66);
insert into `county` VALUES(951, true, null, 'Yeşilhisar', 38);
insert into `county` VALUES(952, true, null, 'Yeşilli', 47);
insert into `county` VALUES(953, true, null, 'Yeşilova', 15);
insert into `county` VALUES(954, true, null, 'Yeşilyurt', 44);
insert into `county` VALUES(955, true, null, 'Yeşilyurt', 60);
insert into `county` VALUES(956, true, null, 'Yığılca', 81);
insert into `county` VALUES(957, true, null, 'Yıldırım', 16);
insert into `county` VALUES(958, true, null, 'Yıldızeli', 58);
insert into `county` VALUES(959, true, null, 'Yomra', 61);
insert into `county` VALUES(960, true, null, 'Yozgat', 66);
insert into `county` VALUES(961, true, null, 'Yumurtalık', 1);
insert into `county` VALUES(962, true, null, 'Yunak', 42);
insert into `county` VALUES(963, true, null, 'Yunusemre', 45);
insert into `county` VALUES(964, true, null, 'Yusufeli', 8);
insert into `county` VALUES(965, true, null, 'Yüksekova', 30);
insert into `county` VALUES(966, true, null, 'Yüreğir', 1);
insert into `county` VALUES(967, true, null, 'Zara', 58);
insert into `county` VALUES(968, true, null, 'Zeytinburnu', 34);
insert into `county` VALUES(969, true, null, 'Zile', 60);
insert into `county` VALUES(970, true, null, 'Zonguldak', 67);

insert into `county` VALUES(971, true, null, 'Kemalpaşa', 8);
insert into `county` VALUES(972, true, null, 'Sultanhanı', 68);


insert into `currency` values (1, true, 'Türk Lirası', null);
insert into `currency` values (2, true, 'Amerikan Doları', null);
insert into `currency` values (3, true, 'Euro', null);