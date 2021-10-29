--
-- This SQL script builds the KnightDash database, deleting any pre-existing version.
--
-- @author kvlinden
-- @developer mindysport
-- @version Summer, 2015
-- @updated Fall, 2021
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS KUser;
DROP TABLE IF EXISTS KOrder;
DROP TABLE IF EXISTS DiningHall;
DROP TABLE IF EXISTS FoodItem;

-- Create the schema.
CREATE TABLE DiningHall (
	ID integer PRIMARY KEY,
	openTime time,
	closeTime time,
	phoneNumber varchar(50)
	);
CREATE TABLE KUSER (
	ID integer PRIMARY KEY,
	fname varchar(40),
	lname varchar(40),
	location varchar(40)
);
CREATE TABLE KOrder (
	ID integer PRIMARY KEY,
	numItems integer,
	userID integer REFERENCES KUser(ID),
	status varchar(40) NOT NULL
	
);
CREATE TABLE FoodItem (
	ID integer PRIMARY KEY,
	orderID integer REFERENCES KOrder(ID),
	description varchar(50),
	price money NOT NULL
);

-- Allow users to select data from the tables.
GRANT SELECT ON KUser TO PUBLIC;
GRANT SELECT ON KOrder TO PUBLIC;
GRANT SELECT ON DiningHall TO PUBLIC;
GRANT SELECT ON FoodItem TO PUBLIC;

