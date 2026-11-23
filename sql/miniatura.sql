-- Tabela do CRUD de Miniaturas, no mesmo banco "portfolio" do projeto.
-- Rode no phpMyAdmin (aba SQL). Depois, cole este trecho no final do portfolio.sql
-- para o repositório entregar a base de dados completa (BBDD).
CREATE DATABASE IF NOT EXISTS portfolio CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE portfolio;

CREATE TABLE IF NOT EXISTS `miniatura` (
  `id`          INT          NOT NULL AUTO_INCREMENT,
  `categoria`   TINYINT      NOT NULL COMMENT '1 Mainline, 2 Premium, 3 Matchbox, 4 Outras',
  `quantidade`  INT          NOT NULL,
  `marca`       VARCHAR(60)  NOT NULL,
  `modelo`      VARCHAR(100) NOT NULL,
  `cor`         VARCHAR(40)  NOT NULL,
  `ano`         SMALLINT     NOT NULL,
  `imagem`      MEDIUMBLOB   NULL,
  `imagem_tipo` VARCHAR(50)  NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ck_miniatura_categoria`  CHECK (`categoria` BETWEEN 1 AND 4),
  CONSTRAINT `ck_miniatura_quantidade` CHECK (`quantidade` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
