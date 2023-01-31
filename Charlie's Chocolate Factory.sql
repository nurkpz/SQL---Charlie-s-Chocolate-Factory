
USE Manufacturer

CREATE SCHEMA Manufacturer;

CREATE TABLE Manufacturer.Product(
	prod_id int PRIMARY KEY NOT NULL,
	prod_name VARCHAR(50) NOT NULL,
	quantity int NOT NULL
);

CREATE TABLE Manufacturer.Prod_Comp(
	prod_id int NOT NULL,
	comp_id int NOT NULL,
	quantity_comp int NOT NULL,
	PRIMARY KEY(prod_id, comp_id)
);

CREATE TABLE Manufacturer.Component(
	comp_id int PRIMARY KEY NOT NULL,
	comp_name VARCHAR(50) NOT NULL,
	description VARCHAR(50) NOT NULL,
	quantity_comp int NOT NULL
)

CREATE TABLE Manufacturer.Supplier(
	supp_id int PRIMARY KEY NOT NULL,
	supp_name VARCHAR(50) NOT NULL,
	supp_location VARCHAR(50) NOT NULL,
	supp_country VARCHAR(50) NOT NULL,
	is_active bit NOT NULL
)

CREATE TABLE Manufacturer.Comp_Supp(
	supp_id int NOT NULL,
	comp_id int NOT NULL,
	order_date DATE NOT NULL,
	quantity int NOT NULL
	PRIMARY KEY(supp_id, comp_id)
)

ALTER TABLE Manufacturer.Prod_Comp
ADD CONSTRAINT FK_prod
FOREIGN KEY (prod_id)
REFERENCES Manufacturer.Product (prod_id);

ALTER TABLE Manufacturer.Prod_Comp
ADD CONSTRAINT FK_comp1
FOREIGN KEY (comp_id)
REFERENCES Manufacturer.Component (comp_id);

ALTER TABLE Manufacturer.Comp_Supp
ADD CONSTRAINT FK_comp2
FOREIGN KEY (comp_id)
REFERENCES Manufacturer.Component (comp_id);

ALTER TABLE Manufacturer.Comp_Supp
ADD CONSTRAINT FK_supp
FOREIGN KEY (supp_id)
REFERENCES Manufacturer.Supplier (supp_id);