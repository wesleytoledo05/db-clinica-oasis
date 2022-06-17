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

CREATE TABLE `proceedings` (
  `id_proceedings` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`id_proceedings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO proceedings(name, price) VALUES
('Depilação a laser', '89.90'),
('Design de sobrancelha', '20.00'),
('Extensão de Cilios', '40.00'), 
('Limpeza Facial', '150.00'),
('Massagens', '120.90'),
('Ondas de choque', '80.00'),
('Preenchimento labial', '230.00'), 
('Redução de Gordura', '460.00'),
('Tratamento de Olheiras', '240.00');
 

CREATE TABLE `scheduling` (
  `id_scheduling` int NOT NULL AUTO_INCREMENT,
  `time` TIME NOT NULL,
  `date` date NOT NULL,
  `professional` varchar(100) NOT NULL,
  `canceled` BOOLEAN DEFAULT false NOT NULL,
  `id_client` int NOT NULL,
  `id_proceedings` int NOT NULL,
  PRIMARY KEY (`id_scheduling`),
  KEY `id_client_idx` (`id_client`),
  KEY `id_proceedings_idx` (`id_proceedings`),
  CONSTRAINT `id_client` FOREIGN KEY (`id_client`) REFERENCES `accounts` (`id_client`),
  CONSTRAINT `id_proceedings` FOREIGN KEY (`id_proceedings`) REFERENCES `proceedings` (`id_proceedings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO scheduling(time, date, professional, canceled, id_client, id_proceedings) VALUES
('14:00:00', '2022-10-10', 'GABRIELE AMANDA', FALSE, 13, 1),
('10:00:00', '2022-07-10', 'GABRIELE AMANDA', FALSE, 13, 1);

--------------------------------------------------------------------------------
-- para adicionar o campo canceled caso nao exista na tabela
ALTER TABLE `scheduling` ADD `canceled` NOT NULL DEFAULT false;


-- Adicionar chave estrangeira na tabela ja criada
ALTER TABLE `scheduling` ADD COLUMN `id_proceedings` int NOT NULL DEFAULT 1;
ALTER TABLE `scheduling` ADD CONSTRAINT `id_proceedings` 
FOREIGN KEY(`id_proceedings`) REFERENCES `proceedings` (`id_proceedings`);