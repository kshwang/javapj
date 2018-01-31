-- DB 생성
DROP DATABASE IF EXISTS pj_db;
CREATE DATABASE pj_db COLLATE 'utf8_general_ci';

use pj_db;

-- USER TABLE 생성

CREATE TABLE `pj_user` (
	`userno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`userid` VARCHAR(50) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`passwd` VARCHAR(30) NULL DEFAULT NULL,
	`name` VARCHAR(30) NULL DEFAULT NULL,
	`mobile` VARCHAR(20) NULL DEFAULT NULL,
	PRIMARY KEY (`userno`),
	UNIQUE INDEX `userid` (`userid`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- BOARD TABLE 생성
-- 추가