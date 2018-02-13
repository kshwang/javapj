-- DB 생성
DROP DATABASE IF EXISTS pj_db;
CREATE DATABASE pj_db COLLATE 'utf8_general_ci';

use pj_db;

-- 테이블 삭제
DROP TABLE IF EXISTS pj_training_apply;
DROP TABLE IF EXISTS pj_training_file;
DROP TABLE IF EXISTS pj_training;
DROP TABLE IF EXISTS pj_comments;
DROP TABLE IF EXISTS pj_qnaboard;
DROP TABLE IF EXISTS pj_employ_upload_user;
DROP TABLE IF EXISTS pj_employ_detp;
DROP TABLE IF EXISTS pj_user;
DROP TABLE IF EXISTS pj_user_pw_question;

-- 회원가입시 질문 목록 테이블
CREATE TABLE `pj_user_pw_question` (
	`q_no` INT(11) NOT NULL AUTO_INCREMENT,
	`q_st` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`q_no`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- USER TABLE
CREATE TABLE `pj_user` (
	`userno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`userid` VARCHAR(50) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`passwd` VARCHAR(30) NOT NULL,
	`name` VARCHAR(30) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`mobile` VARCHAR(20) NOT NULL,
	`userclass` INT(11) NOT NULL DEFAULT '2',
	`q_no` INT(10) NOT NULL DEFAULT '1',
	`q_answer` VARCHAR(50) NOT NULL,
	`retireYN` TINYINT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`userno`),
	UNIQUE INDEX `userid` (`userid`),
	INDEX `FK_pj_user_pj_user_pw_question` (`q_no`),
	CONSTRAINT `FK_pj_user_pj_user_pw_question` FOREIGN KEY (`q_no`) REFERENCES `pj_user_pw_question` (`q_no`)
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


-- EMPLOY TABLE
CREATE TABLE `pj_employ_detp` (
	`detpno` INT(11) NOT NULL AUTO_INCREMENT,
	`detpname` VARCHAR(50) NOT NULL,
	`detptitle` VARCHAR(50) NOT NULL,
	`detpperiod` VARCHAR(50) NOT NULL,
	`detpexpiry` VARCHAR(50) NOT NULL,
	`detptitleinfo` TEXT NOT NULL,
	`useYN` TINYINT(1) NULL DEFAULT '1',
	PRIMARY KEY (`detpno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- EMPLOY UPLOADFILE TABLE
CREATE TABLE `pj_employ_upload_user` (
	`uploadFileNo` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`detpno` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`phone` VARCHAR(50) NOT NULL,
	`mail` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`url` VARCHAR(50) NULL DEFAULT NULL,
	`fileNameOrig` VARCHAR(100) NULL DEFAULT NULL,
	`fileNameTemp` VARCHAR(100) NULL DEFAULT NULL,
	`fileSize` INT(10) UNSIGNED NULL DEFAULT NULL,
	`contentType` VARCHAR(30) NULL DEFAULT NULL,
	`useYN` TINYINT(1) NULL DEFAULT '1',
	PRIMARY KEY (`uploadFileNo`),
	UNIQUE INDEX `fileNameTemp` (`fileNameTemp`),
	INDEX `detpno` (`detpno`),
	CONSTRAINT `FK_pj_employ_upload_user_pj_employ_detp` FOREIGN KEY (`detpno`) REFERENCES `pj_employ_detp` (`detpno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- TRAINING TABLE
CREATE TABLE `pj_training` (
	`articleno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(200) NOT NULL,
	`content` MEDIUMTEXT NULL,
	`email` VARCHAR(60) NULL DEFAULT NULL,
	`hit` INT(10) UNSIGNED NULL DEFAULT '0',
	`regdate` DATETIME NULL DEFAULT NULL,
	`enddate` DATETIME NULL DEFAULT NULL,
	`UseYN` TINYINT(1) NOT NULL DEFAULT '1',
	`InsertUID` VARCHAR(40) NULL DEFAULT NULL,
	`InsertDT` DATETIME NULL DEFAULT NULL,
	`UpdateUID` VARCHAR(40) NULL DEFAULT NULL,
	`UpdateDT` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`articleno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- TRAINING FILE TABLE
CREATE TABLE `pj_training_file` (
	`attachfileno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`filenameorig` VARCHAR(50) NOT NULL,
	`filenametemp` VARCHAR(50) NULL DEFAULT NULL,
	`filetype` VARCHAR(30) NULL DEFAULT NULL,
	`filesize` INT(11) NULL DEFAULT NULL,
	`articleno` INT(10) UNSIGNED NOT NULL,
	`imageData` LONGBLOB NULL,
	`UseYN` TINYINT(1) NULL DEFAULT '1',
	`InsertUID` VARCHAR(40) NULL DEFAULT NULL,
	`InsertDT` DATETIME NULL DEFAULT NULL,
	`UpdateUID` VARCHAR(40) NULL DEFAULT NULL,
	`UpdateDT` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`attachfileno`),
	INDEX `articleno` (`articleno`),
	CONSTRAINT `tb_bbs_attachfile_ibfk_1` FOREIGN KEY (`articleno`) REFERENCES `pj_training` (`articleno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- TRAINING APPLY TABLE
CREATE TABLE `pj_training_apply` (
	`applyno` INT(11) NOT NULL AUTO_INCREMENT,
	`articleno` INT(10) UNSIGNED NOT NULL,
	`userno` INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (`applyno`),
	INDEX `FK_pj_training_apply_pj_training` (`articleno`),
	INDEX `FK_pj_training_apply_pj_user` (`userno`),
	CONSTRAINT `FK_pj_training_apply_pj_training` FOREIGN KEY (`articleno`) REFERENCES `pj_training` (`articleno`),
	CONSTRAINT `FK_pj_training_apply_pj_user` FOREIGN KEY (`userno`) REFERENCES `pj_user` (`userno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;