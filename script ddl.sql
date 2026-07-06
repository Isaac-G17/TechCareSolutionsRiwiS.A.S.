DROP DATABASE IF EXISTS bd_isaac_guzman_cumbia;
CREATE DATABASE bd_isaac_guzman_cumbia
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE bd_isaac_guzman_cumbia;


CREATE TABLE riwi_city (
    id_riwi_city    INT AUTO_INCREMENT PRIMARY KEY,
    name_riwi_city       VARCHAR(80) NOT NULL,
    CONSTRAINT uq_riwi_city_name UNIQUE (name_riwi_city)
) ENGINE=InnoDB;


CREATE TABLE riwi_branch (
    id_riwi_branch  INT AUTO_INCREMENT PRIMARY KEY,
    name_riwi_branch     VARCHAR(100) NOT NULL,
    id_riwi_city    INT NOT NULL,
    CONSTRAINT uq_riwi_branch_name UNIQUE (name_riwi_branch),
    CONSTRAINT fk_branch_city FOREIGN KEY (id_riwi_city)
        REFERENCES riwi_city (id_riwi_city)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE riwi_client (
    id_riwi_client  INT AUTO_INCREMENT PRIMARY KEY,
    name_riwi_client     VARCHAR(120) NOT NULL,
    id_riwi_branch  INT NOT NULL,
    CONSTRAINT uq_riwi_client_name UNIQUE (name_riwi_client),
    CONSTRAINT fk_client_branch FOREIGN KEY (id_riwi_branch)
        REFERENCES riwi_branch (id_riwi_branch)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE riwi_technician (
    id_riwi_technician  INT AUTO_INCREMENT PRIMARY KEY,
    name_riwi_technician     VARCHAR(120) NOT NULL,
    CONSTRAINT uq_name_riwi_technician UNIQUE (name_riwi_technician)
) ENGINE=InnoDB;


CREATE TABLE riwi_service (
    id_riwi_service  INT AUTO_INCREMENT PRIMARY KEY,
    name_riwi_service     VARCHAR(80) NOT NULL,
    CONSTRAINT uq_name_riwi_service UNIQUE (name_riwi_service)
) ENGINE=InnoDB;


CREATE TABLE riwi_equipment_category (
    id_riwi_equipment_category  INT AUTO_INCREMENT PRIMARY KEY,
    name_riwi_equipment_category               VARCHAR(80) NOT NULL,
    CONSTRAINT uq_name_riwi_equipment_category UNIQUE (name_riwi_equipment_category)
) ENGINE=InnoDB;


CREATE TABLE riwi_equipment (
    id_riwi_equipment            INT AUTO_INCREMENT PRIMARY KEY,
    name_riwi_equipment               VARCHAR(120) NOT NULL,
    id_riwi_equipment_category   INT NOT NULL,
    CONSTRAINT uq_name_riwi_equipment UNIQUE (name_riwi_equipment),
    CONSTRAINT fk_equipment_category FOREIGN KEY (id_riwi_equipment_category)
        REFERENCES riwi_equipment_category (id_riwi_equipment_category)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE riwi_work_order (
    id_riwi_work_order    INT AUTO_INCREMENT PRIMARY KEY,
    riwi_work_order       VARCHAR(20) NOT NULL,
    riwi_service_date     DATE NOT NULL,
    riwi_hours            DECIMAL(5,2) NOT NULL,
    riwi_cost             DECIMAL(10,2) NOT NULL,
    id_riwi_technician     INT NOT NULL,
    id_riwi_client         INT NOT NULL,
    id_riwi_equipment      INT NOT NULL,
    id_riwi_service   INT NOT NULL,
    CONSTRAINT uq_riwi_order_code UNIQUE (riwi_work_order ),
    CONSTRAINT chk_hours_positive CHECK (riwi_hours > 0),
    CONSTRAINT chk_cost_positive CHECK (riwi_cost >= 0),
    CONSTRAINT fk_order_technician FOREIGN KEY (id_riwi_technician)
        REFERENCES riwi_technician (id_riwi_technician)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_order_client FOREIGN KEY (id_riwi_client)
        REFERENCES riwi_client (id_riwi_client)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_order_equipment FOREIGN KEY (id_riwi_equipment)
        REFERENCES riwi_equipment (id_riwi_equipment)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_order_service FOREIGN KEY (id_riwi_service)
        REFERENCES riwi_service (id_riwi_service)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;
