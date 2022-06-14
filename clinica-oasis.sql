CREATE DATABASE clinica_oasis;

CREATE TABLE `accounts` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `wpp` VARCHAR(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `scheduling` (
  `id_scheduling` int NOT NULL AUTO_INCREMENT,
  `time` TIME NOT NULL,
  `date` date NOT NULL,
  `professional` varchar(100) NOT NULL,
  `procedure` varchar(100) NOT NULL,
  `id_client` int NOT NULL,
  PRIMARY KEY (`id_scheduling`),
  KEY `id_client_idx` (`id_client`),
  CONSTRAINT `id_client` FOREIGN KEY (`id_client`) REFERENCES `accounts` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;