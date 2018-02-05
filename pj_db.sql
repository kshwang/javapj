-- DB 생성
DROP DATABASE IF EXISTS pj_db;
CREATE DATABASE pj_db COLLATE 'utf8_general_ci';

use pj_db;

-- 테이블 삭제
DROP TABLE IF EXISTS pj_comments;
DROP TABLE IF EXISTS pj_qnaboard;
DROP TABLE IF EXISTS pj_employ;
DROP TABLE IF EXISTS pj_employ_upload_file;
DROP TABLE IF EXISTS pj_user;

-- USER TABLE
CREATE TABLE `pj_user` (
	`userno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`userid` VARCHAR(50) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`passwd` VARCHAR(30) NULL DEFAULT NULL,
	`name` VARCHAR(30) NULL DEFAULT NULL,
	`mobile` VARCHAR(20) NULL DEFAULT NULL,
	`userclass` INT(11) NULL DEFAULT '2',
	PRIMARY KEY (`userno`),
	UNIQUE INDEX `userid` (`userid`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- BOARD TABLE
CREATE TABLE `pj_qnaboard` (
	`bno` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(200) NULL DEFAULT NULL,
	`content` MEDIUMTEXT NULL,
	`userid` VARCHAR(50) NULL DEFAULT NULL,
	`updatedt` DATE NULL DEFAULT NULL,
	`hit` INT(11) NOT NULL DEFAULT '0',
	`useYN` TINYINT(1) NULL DEFAULT '1',
	PRIMARY KEY (`bno`),
	INDEX `id` (`userid`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- EMPLOY TABLE
CREATE TABLE `pj_employ` (
	`jobname` VARCHAR(50) NOT NULL,
	`jobtitle` VARCHAR(50) NULL DEFAULT NULL,
	`empexpiry` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`jobname`),
	UNIQUE INDEX `emptitle` (`jobtitle`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `pj_employ_upload_file` (
	`uploadFileNo` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`fileNameOrig` VARCHAR(100) NOT NULL,
	`fileNameTemp` VARCHAR(100) NOT NULL,
	`fileSize` INT(10) UNSIGNED NOT NULL,
	`contentType` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`uploadFileNo`),
	UNIQUE INDEX `fileNameTemp` (`fileNameTemp`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- COMMENTS TABLE
CREATE TABLE `pj_comments` (
	`commentno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`bno` INT(11) NOT NULL,
	`userid` VARCHAR(50) NULL DEFAULT NULL,
	`memo` VARCHAR(4000) NULL DEFAULT NULL,
	`regdate` DATETIME NULL DEFAULT NULL,
	`UseYN` TINYINT(1) NULL DEFAULT '1',
	`InsertUID` VARCHAR(40) NULL DEFAULT NULL,
	`InsertDT` DATETIME NULL DEFAULT NULL,
	`UpdateUID` VARCHAR(40) NULL DEFAULT NULL,
	`UpdateDT` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`commentno`),
	INDEX `FK_pj_comments_pj_qnaboard` (`bno`),
	INDEX `FK_pj_comments_pj_user` (`userid`),
	CONSTRAINT `FK_pj_comments_pj_qnaboard` FOREIGN KEY (`bno`) REFERENCES `pj_qnaboard` (`bno`),
	CONSTRAINT `FK_pj_comments_pj_user` FOREIGN KEY (`userid`) REFERENCES `pj_user` (`userid`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;