CREATE TABLE `litecms`.`wy_admins` (
  `adminid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL DEFAULT '',
  `password` VARCHAR(32) NOT NULL DEFAULT '',
  `uid` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  `allowip` VARCHAR(200) NOT NULL,
  `lastlogindate` DATETIME NOT NULL,
  `lastloginip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`adminid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `litecms`.`wy_articles` (
  `articleid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeid` INTEGER UNSIGNED NOT NULL DEFAULT 0,
  `title` VARCHAR(45) NOT NULL,
  `summary` VARCHAR(45) NOT NULL,
  `uid` INTEGER UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `postdate` DATETIME NOT NULL,
  `commentcount` INTEGER UNSIGNED NOT NULL,
  `viewcount` INTEGER UNSIGNED NOT NULL,
  `sort` INTEGER UNSIGNED NOT NULL,
  `ip` VARCHAR(45) NOT NULL,
  `image` VARCHAR(200) NOT NULL,
  `del` INTEGER UNSIGNED NOT NULL,
  `content` TEXT NOT NULL,
  `goodcount` INTEGER UNSIGNED NOT NULL,
  `badcount` INTEGER UNSIGNED NOT NULL,
  `highlight` VARCHAR(45) NOT NULL,
  `recommend` INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY (`articleid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `litecms`.`wy_articletype` (
  `typeid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `typename` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`typeid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE `litecms`.`wy_attachments` (
  `attachmentid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(45) NOT NULL,
  `filepath` VARCHAR(45) NOT NULL,
  `filetype` INTEGER UNSIGNED NOT NULL,
  `posterid` INTEGER UNSIGNED NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`attachmentid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `litecms`.`wy_columns` (
  `columnid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `columnname` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `allowpost` VARCHAR(45) NOT NULL,
  `allowedit` VARCHAR(45) NOT NULL,
  `allowdel` VARCHAR(45) NOT NULL,
  `shenghe` INTEGER UNSIGNED NOT NULL,
  `parentid` INTEGER UNSIGNED NOT NULL,
  `del` INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY (`columnid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `litecms`.`wy_comments` (
  `commentid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `articleid` INTEGER UNSIGNED NOT NULL,
  `uid` INTEGER UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `postdate` DATETIME NOT NULL,
  `del` INTEGER UNSIGNED NOT NULL,
  `content` VARCHAR(200) NOT NULL,
  `goodcount` INTEGER UNSIGNED NOT NULL,
  `badcount` INTEGER UNSIGNED NOT NULL,
  `articletitle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`commentid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `litecms`.`wy_groups` (
  `groupid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupname` VARCHAR(45) NOT NULL,
  `allowpost` INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY (`groupid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `litecms`.`wy_templates` (
  `templateid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `folder` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`templateid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `litecms`.`wy_users` (
  `uid` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `groupid` INTEGER UNSIGNED NOT NULL,
  `adminid` INTEGER UNSIGNED NOT NULL,
  `qq` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `msn` VARCHAR(100) NOT NULL,
  `hi` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `realname` VARCHAR(45) NOT NULL,
  `regip` VARCHAR(45) NOT NULL,
  `del` INTEGER UNSIGNED NOT NULL,
  `articlecount` INTEGER UNSIGNED NOT NULL,
  `topiccount` INTEGER UNSIGNED NOT NULL,
  `replycount` INTEGER UNSIGNED NOT NULL,
  `lastlogip` VARCHAR(45) NOT NULL,
  `bdday` DATETIME NOT NULL,
  `lastlogdate` DATETIME NOT NULL,
  `regdate` DATETIME NOT NULL,
  `secques` VARCHAR(45) NOT NULL,
  `secans` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`uid`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;




ALTER TABLE `litecms`.`wy_articles` MODIFY COLUMN `title` VARCHAR(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
 MODIFY COLUMN `summary` VARCHAR(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
 MODIFY COLUMN `uid` INTEGER UNSIGNED NOT NULL DEFAULT 0,
 MODIFY COLUMN `username` VARCHAR(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
 MODIFY COLUMN `postdate` DATETIME NOT NULL,
 MODIFY COLUMN `commentcount` INTEGER UNSIGNED NOT NULL DEFAULT 0,
 MODIFY COLUMN `viewcount` INTEGER UNSIGNED NOT NULL DEFAULT 0,
 MODIFY COLUMN `sort` INTEGER UNSIGNED NOT NULL DEFAULT 0,
 MODIFY COLUMN `ip` VARCHAR(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
 MODIFY COLUMN `image` VARCHAR(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
 MODIFY COLUMN `del` INTEGER UNSIGNED NOT NULL DEFAULT 0,
 MODIFY COLUMN `content` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
 MODIFY COLUMN `goodcount` INTEGER UNSIGNED NOT NULL DEFAULT 0,
 MODIFY COLUMN `badcount` INTEGER UNSIGNED NOT NULL DEFAULT 0,
 MODIFY COLUMN `highlight` VARCHAR(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
 MODIFY COLUMN `recommend` INTEGER UNSIGNED NOT NULL DEFAULT 0;


CREATE TABLE `litecms`.`wy_feeds` (
  `feed_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeid` INTEGER UNSIGNED NOT NULL,
  `accesslevel` INTEGER UNSIGNED NOT NULL,
  `title` VARCHAR(90) NOT NULL,
  `content` VARCHAR(180) NOT NULL,
  `senddate` DATETIME NOT NULL,
  PRIMARY KEY (`feed_id`)
)
ENGINE = InnoDB
CHARACTER SET utf8 COLLATE utf8_general_ci;