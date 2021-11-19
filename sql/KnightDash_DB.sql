--
-- This SQL script builds the KnightDash database, deleting any pre-existing version.
--
-- @author kvlinden
-- @developer mindysport
-- @version Summer, 2015
-- @updated Fall, 2021
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.

DROP TABLE IF EXISTS FoodItem;
DROP TABLE IF EXISTS KOrder;
DROP TABLE IF EXISTS KUser;
DROP TABLE IF EXISTS DiningHall;

-- Create the schema.
CREATE TABLE DiningHall (
	ID integer PRIMARY KEY,
	name varchar(40),
	openTime time,
	closeTime time,
	phoneNumber varchar(11)
	);
CREATE TABLE KUser (
	ID integer PRIMARY KEY,
	fname varchar(40),
	lname varchar(40),
	location varchar(40)
);
CREATE TABLE KOrder (
	ID integer PRIMARY KEY,
	userID integer REFERENCES KUser(ID),
	diningHallId integer REFERENCES DiningHall(ID),
	status varchar(40) NOT NULL
);
CREATE TABLE FoodItem (
	orderID integer REFERENCES KOrder(ID),
    itemName varchar(20),
	description varchar(50),
	price money NOT NULL,
	itemType varchar(20),
	image varchar (60) 
);

-- Allow users to select data from the tables.
GRANT SELECT ON KUser TO PUBLIC;
GRANT SELECT ON KOrder TO PUBLIC;
GRANT SELECT ON DiningHall TO PUBLIC;
GRANT SELECT ON FoodItem TO PUBLIC;


INSERT INTO DiningHall VALUES (1, 'Johnnys', '7:00:00', '17:00:00', '6165143256');
INSERT INTO KUser VALUES (1, 'Nathan', 'Minderhoud', 'offcampus');
INSERT INTO KUser VALUES (2, 'Jacob', 'Williams', 'offcampus');
INSERT INTO Korder VALUES (1, 1, 1, 'active');
INSERT INTO Korder VALUES (2, 1, 1, 'complete');
INSERT INTO Korder VALUES (3, 2, 1, 'active');
INSERT INTO FoodItem VALUES (1, 'burger', null, '5', 'food', null);
INSERT INTO FoodItem VALUES (1, 'burger', null, '5', 'food', null);
INSERT INTO FoodItem VALUES (2, 'pizza', null, '10', 'food', null);
INSERT INTO FoodItem VALUES (3, 'hotdog', null, '2', 'food', null);
INSERT INTO FoodItem VALUES (3, 'Pepsi', 'Wild Cherry', '1.75', 'drink', 'https://m.media-amazon.com/images/I/71pfiM3E5EL.jpg');




