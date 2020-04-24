-- TASK 1 -- 

CREATE DATABASE  IF NOT EXISTS `TASK1`;

CREATE TABLE IF NOT EXISTS `TASK1`.`Supplier` (
    supplierNr int AUTO_INCREMENT NOT NULL,
    supplierName VARCHAR(60) NOT NULL UNIQUE,
    countryLocation VARCHAR(60) NOT NULL,
    faxNr int(20) UNIQUE,
    PRIMARY KEY (`supplierNr`)
);

CREATE TABLE IF NOT EXISTS `TASK1`.`Item` (
    itemNr int AUTO_INCREMENT NOT NULL,
    itemName VARCHAR(30) NOT NULL UNIQUE,
    countryMade VARCHAR(60),
    PRIMARY KEY (`itemNr`)
 );

CREATE TABLE IF NOT EXISTS `TASK1`.`Supply` (
    supplierNr int NOT NULL,
    itemNr int NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY (`supplierNr`, `itemNr`),
    FOREIGN KEY (`supplierNr`) REFERENCES Supplier(`supplierNr`),
    FOREIGN KEY (`itemNr`) REFERENCES Item(`itemNr`)
);

CREATE TABLE IF NOT EXISTS `TASK1`.`Usage` (
    itemNr int NOT NULL UNIQUE,
    deptCode CHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY (`itemNr`, `deptCode`),
    FOREIGN KEY (`itemNr`) REFERENCES Item(`itemNr`)
 );


