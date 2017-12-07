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

insert into `currency` values (1, true, 'Türk Lirası', null);
insert into `currency` values (2, true, 'Amerikan Doları', null);
insert into `currency` values (3, true, 'Euro', null);