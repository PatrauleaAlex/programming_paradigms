CREATE DATABASE `pp_loan_manager`;

USE `pp_loan_manager`;

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `newsletter` int(1) NOT NULL,
  `admin` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `banks`;

CREATE TABLE `banks` (
  `id` int(11) not null auto_increment,
  `name` varchar(255) not null,
  `address` varchar(255) not null,
  primary key (`id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `loans`;

CREATE TABLE `loans` (
  `id` int(11) not null auto_increment,
  `user_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `ammount` int(6) not null,
  `rate` int(2) not null,
  `noMonths` int(3) not null,
  `paid` int(6),
  `toBePaid` int(6),
  `completed` int(1) not null,
  primary key (`id`),
  KEY `user_id` (`user_id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`)
) engine=InnoDB;


DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(11) not null auto_increment,
  `loan_id` int(11) not null,
  `ammount` int(6) not null,
  `date` varchar(255),
  `info` varchar(255),
  primary key (`id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`)
) engine=InnoDB;
  
INSERT INTO `banks` VALUES (default, "BCR", "Address 1"), (default, "BRD", "Address 2"), (default, "Raiffeisen", "Address 3"), (default, "Libra Bank", "Address 4"), (default, "ING", "Address 5");