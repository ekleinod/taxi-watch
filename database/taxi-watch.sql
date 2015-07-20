SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `salt` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `role` VARCHAR(20) NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC),
  UNIQUE INDEX `salt_UNIQUE` (`salt` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '\n';


-- -----------------------------------------------------
-- Table `incidents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incidents` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `date` DATE NOT NULL,
  `description` TEXT NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `plate` VARCHAR(10) NULL,
  `taxi_number` VARCHAR(10) NULL,
  `time` TIME NULL,
  `city` VARCHAR(100) NULL,
  `street` VARCHAR(200) NULL,
  `latitude` DOUBLE NULL COMMENT '\n',
  `longitude` DOUBLE NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_events_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_events_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comments` (
  `id` INT NOT NULL,
  `incident_id` INT UNSIGNED NOT NULL,
  `comment` TEXT NOT NULL,
  `user_id` INT UNSIGNED NULL,
  `name` VARCHAR(255) NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_users1_idx` (`user_id` ASC),
  INDEX `fk_comments_incidents1_idx` (`incident_id` ASC),
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_incidents1`
    FOREIGN KEY (`incident_id`)
    REFERENCES `incidents` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tags` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `incidents_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incidents_tags` (
  `incident_id` INT UNSIGNED NOT NULL,
  `tag_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`incident_id`, `tag_id`),
  INDEX `fk_incidents_tags_tags1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_incidents_tags_tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tags` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidents_tags_incidents1`
    FOREIGN KEY (`incident_id`)
    REFERENCES `incidents` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
