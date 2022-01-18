START TRANSACTION;

-- Use (swtich to) webapp_db 
USE webapp_db;

-- Drop the Persons table if it exists
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Firearms;
DROP TABLE IF EXISTS F_Type;
DROP TABLE IF EXISTS Mech_R;
DROP TABLE IF EXISTS Mech_S;
DROP TABLE IF EXISTS Condition;
DROP TABLE IF EXISTS Section;


-- Create the Credentias table and set the uniqe auto_incrementing ID
CREATE TABLE Users (
    UserId int NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    userpwd varchar(255) NOT NULL,

    PRIMARY KEY (credId)
);

-- Create the Persons table and set the uniqe auto_incrementing ID
CREATE TABLE Clients (
    ClientID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    Address1 varchar(255),
    Address2 varchar(255),    
    Address3 varchar(255),
    Address4 varchar(255),
    Postcode varchar(8),
    CertType varchar(255),
    CertType varchar(255),
    CertNo varchar(255),
    CertNo varchar(255),

    PRIMARY KEY (ClientID),
    FOREIGN KEY (CertType) REFERENCES Certs(CertType)
);

CREATE TABLE Certs (
    CertType varchar NOT NULL,

    PRIMARY KEY (CertType),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Firearms (
    StockID int NOT NULL AUTO_INCREMENT,
    SerialNumber varchar NOT NULL,
    F_Type varchar(255) NOT NULL,
    Make varchar(255),
    Model varchar(255),
    Calibre varchar(255),
    Mech_Rifle varchar(255),
    Mech_Shot varchar(255),
    Condition varchar(255) NOT NULL,
    Buy varchar(255),
    Sell varchar(255),
    Section varchar(255) NOT NULL,
    ClientIn varchar(255),
    ClientOut varchar(255),

    PRIMARY KEY (StockID),
--  FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
    FOREIGN KEY (F_Type) REFERENCES F_Type(F_Type),
    FOREIGN KEY (Mech_Rifle) REFERENCES Mech_R(Mech_Rifle),
    FOREIGN KEY (Mech_Shot) REFERENCES Mech_S(Mech_Shot),
    FOREIGN KEY (Condition) REFERENCES Condition(Condition),
    FOREIGN KEY (Sect) REFERENCES Section(Sect),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
);

CREATE TABLE F_Type (
    F_Type varchar NOT NULL,

    PRIMARY KEY (F_Type),
);

INSERT into F_Type (F_Type) VALUES ('Rifle');
INSERT into F_Type (F_Type) VALUES ('Shotgun');
INSERT into F_Type (F_Type) VALUES ('Pistol');
INSERT into F_Type (F_Type) VALUES ('Air Rifle');

CREATE TABLE Condition (
    Condition varchar NOT NULL,

    PRIMARY KEY (Condition),
);

INSERT into Condition (Condition) VALUES ('Used');
INSERT into Condition (Condition) VALUES ('New');

CREATE TABLE Mech_R (
    Mech_Rifle varchar NOT NULL,

    PRIMARY KEY (Mech_Rifle),
);

CREATE TABLE Mech_S (
    Mech_Shot varchar NOT NULL,

    PRIMARY KEY (Mech_Shot),
);

INSERT into Mech_Shot(Mech_S) VALUES ('Over and Under');
INSERT into Mech_Shot(Mech_S) VALUES ('Side by side');
INSERT into Mech_Shot(Mech_S) VALUES ('Bolt Action');
INSERT into Mech_Shot(Mech_S) VALUES ('Martini');
INSERT into Mech_Shot(Mech_S) VALUES ('Pump Action');
INSERT into Mech_Shot(Mech_S) VALUES ('Semi-auto');

CREATE TABLE Section (
    Sect varchar NOT NULL,

    PRIMARY KEY (Sect),
);

INSERT into Sect (Section) VALUES ('Sect 1');
INSERT into Sect (Section) VALUES ('Sect 2');
INSERT into Sect (Section) VALUES ('Sect 58');
INSERT into Sect (Section) VALUES ('N/A');


-- INSERT into Persons (LastName, email) VALUES ('Shams0', 'shams0.mail.com');

-- Create the orders table
CREATE TABLE Orders (
    OrderID int NOT NULL AUTO_INCREMENT,
    OrderNumber int NOT NULL,
    OrderDesc varchar(1024),
    PersonID int NOT NULL,

    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

