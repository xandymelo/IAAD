-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aeroporto_alexandre
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aeroporto_alexandre
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aeroporto_alexandre` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `aeroporto_alexandre` ;

-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`aeroporto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`aeroporto` (
  `Codigo_Aeroporto` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NULL DEFAULT NULL,
  `Estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Codigo_Aeroporto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`voo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`voo` (
  `Numero_voo` INT NOT NULL,
  `Companhia_aerea` VARCHAR(45) NULL DEFAULT NULL,
  `Dias_da_semana` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Numero_voo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`trecho_voo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`trecho_voo` (
  `Numero_trecho` INT NOT NULL,
  `Numero_voo` INT NOT NULL,
  `Codigo_aeroporto_partida` INT NULL DEFAULT NULL,
  `Horario_partida_previsto` VARCHAR(45) NULL DEFAULT NULL,
  `Codigo_aeroporto_chegada` INT NULL DEFAULT NULL,
  `Horario_chegada_previsto` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `Numero_voo_idx` (`Numero_voo` ASC) VISIBLE,
  PRIMARY KEY (`Numero_trecho`, `Numero_voo`),
  INDEX `Codigo_aeroporto_idx` (`Codigo_aeroporto_chegada` ASC, `Codigo_aeroporto_partida` ASC) VISIBLE,
  CONSTRAINT `Numero_voo`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `aeroporto_alexandre`.`voo` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Codigo_aeroporto`
    FOREIGN KEY (`Codigo_aeroporto_chegada` , `Codigo_aeroporto_partida`)
    REFERENCES `aeroporto_alexandre`.`aeroporto` (`Codigo_Aeroporto` , `Codigo_Aeroporto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`AERONAVE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`AERONAVE` (
  `Codigo_aeronave` INT NOT NULL,
  `Numero_total_assentos` INT NULL,
  `Tipo_aeronave` VARCHAR(45) NULL,
  PRIMARY KEY (`Codigo_aeronave`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`Instancia_trecho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`Instancia_trecho` (
  `Numero_voo` INT NOT NULL,
  `Numero_trecho` INT NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Numero_assentos_disponiveis` INT NOT NULL,
  `Codigo_aeronave` INT NULL,
  `Codigo_aeroporto_partida` INT NULL,
  `Horario_partida` VARCHAR(45) NULL,
  `Codigo_aeroporto_chegada` INT NULL,
  `Horario_chegada` VARCHAR(45) NULL,
  PRIMARY KEY (`Numero_voo`, `Numero_trecho`, `Data`),
  INDEX `Numero_trecho_idx` (`Numero_trecho` ASC) VISIBLE,
  INDEX `codigo_aeroporto_idx` (`Codigo_aeroporto_partida` ASC, `Codigo_aeroporto_chegada` ASC) VISIBLE,
  INDEX `codigo_aeronave_idx` (`Codigo_aeronave` ASC) VISIBLE,
  CONSTRAINT `Numero_voo`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `aeroporto_alexandre`.`voo` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Numero_trecho`
    FOREIGN KEY (`Numero_trecho`)
    REFERENCES `aeroporto_alexandre`.`trecho_voo` (`Numero_trecho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_aeroporto`
    FOREIGN KEY (`Codigo_aeroporto_partida` , `Codigo_aeroporto_chegada`)
    REFERENCES `aeroporto_alexandre`.`aeroporto` (`Codigo_Aeroporto` , `Codigo_Aeroporto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_aeronave`
    FOREIGN KEY (`Codigo_aeronave`)
    REFERENCES `aeroporto_alexandre`.`AERONAVE` (`Codigo_aeronave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`TARIFA` (
  `Numero_voo` INT NOT NULL,
  `Codigo_tarifa` INT NOT NULL,
  `Quantidade` INT NULL,
  `Restricoes` VARCHAR(45) NULL,
  PRIMARY KEY (`Numero_voo`, `Codigo_tarifa`),
  CONSTRAINT `Numero_voo`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `aeroporto_alexandre`.`voo` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`TIPO_AERONAVE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`TIPO_AERONAVE` (
  `Nome_tipo_aeronave` VARCHAR(45) NOT NULL,
  `Qtd_max_assentos` INT NULL,
  `Companhia` VARCHAR(45) NULL,
  PRIMARY KEY (`Nome_tipo_aeronave`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`PODE_POUSAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`PODE_POUSAR` (
  `Nome_tipo_aeronave` VARCHAR(45) NOT NULL,
  `Codigo_aeroporto` INT NOT NULL,
  PRIMARY KEY (`Nome_tipo_aeronave`, `Codigo_aeroporto`),
  INDEX `Codigo_aeroporto_idx` (`Codigo_aeroporto` ASC) VISIBLE,
  CONSTRAINT `Codigo_aeroporto`
    FOREIGN KEY (`Codigo_aeroporto`)
    REFERENCES `aeroporto_alexandre`.`aeroporto` (`Codigo_Aeroporto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Nome_tipo_aeronave`
    FOREIGN KEY (`Nome_tipo_aeronave`)
    REFERENCES `aeroporto_alexandre`.`TIPO_AERONAVE` (`Nome_tipo_aeronave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aeroporto_alexandre`.`RESERVA_ASSENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeroporto_alexandre`.`RESERVA_ASSENTO` (
  `Numero_voo` INT NOT NULL,
  `Numero_trecho` INT NOT NULL,
  `data` VARCHAR(45) NOT NULL,
  `Numero_assento` INT NOT NULL,
  `Nome_cliente` VARCHAR(45) NULL,
  `Telefone_cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`Numero_voo`, `Numero_trecho`, `data`, `Numero_assento`),
  INDEX `Numero_trecho_idx` (`Numero_trecho` ASC) VISIBLE,
  CONSTRAINT `Numero_voo`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `aeroporto_alexandre`.`voo` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Numero_trecho`
    FOREIGN KEY (`Numero_trecho`)
    REFERENCES `aeroporto_alexandre`.`trecho_voo` (`Numero_trecho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
