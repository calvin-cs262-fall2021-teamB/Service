--
-- This SQL script builds the KnightDash database, deleting any pre-existing version.
--
-- @author kvlinden
-- @developer mindysport
-- @version Summer, 2015
-- @updated Fall, 2021
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.

DROP TABLE IF EXISTS KOrderItem;
DROP TABLE IF EXISTS FoodDrinkItem;
DROP TABLE IF EXISTS KOrder;
DROP TABLE IF EXISTS KUser;
DROP TABLE IF EXISTS DiningHall;

-- Create the schema.
CREATE TABLE DiningHall (
	ID integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
	ID integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	userID integer REFERENCES KUser(ID),
	diningHallId integer REFERENCES DiningHall(ID),
	status varchar(40) NOT NULL
);
CREATE TABLE FoodDrinkItem (
	ID integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    itemName varchar(20),
	description varchar(50),
	price money NOT NULL,
	itemType varchar(20),
	image varchar (300) 
);
CREATE TABLE KOrderItem (
	orderID integer REFERENCES KOrder(ID),
	foodDrinkItemID integer REFERENCES FoodDrinkItem(ID)
);

-- Allow users to select data from the tables.
GRANT SELECT ON KUser TO PUBLIC;
GRANT SELECT ON KOrder TO PUBLIC;
GRANT SELECT ON DiningHall TO PUBLIC;
GRANT SELECT ON FoodDrinkItem TO PUBLIC;


INSERT INTO DiningHall(name, openTime, closeTime, phoneNumber) VALUES ('Johnnys', '7:00:00', '17:00:00', '6165143256');
INSERT INTO KUser(ID, fname, lname, location) VALUES (1234567, 'Professor', 'Vander Linden', 'offcampus');
INSERT INTO KUser(ID, fname, lname, location) VALUES (2345678, 'Jacob', 'Williams', 'offcampus');
INSERT INTO Korder(userID, diningHallId, status) VALUES (1234567, 1, 'active');
INSERT INTO Korder(userID, diningHallId, status) VALUES (1234567, 1, 'in-transit');
INSERT INTO Korder(userID, diningHallId, status)  VALUES (1234567, 1, 'complete');
INSERT INTO Korder(userID, diningHallId, status)  VALUES (2345678, 1, 'active');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Burger', null, '5', 'food', 'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_21/2870431/190524-classic-american-cheeseburger-ew-207p.jpg');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Pizza', null, '10', 'food', 'https://www.simplyrecipes.com/thmb/8caxM88NgxZjz-T2aeRW3xjhzBg=/2000x1125/smart/filters:no_upscale()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-8f256746d649404baa36a44d271329bc.jpg');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Hotdog', null, '2', 'food', 'https://media.istockphoto.com/photos/hotdog-picture-id185123377?b=1&k=20&m=185123377&s=170667a&w=0&h=m1L2w5WFqYOsXvpSEybhUifdhhwQUJCZY2YY-bFPyeE=');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Pepsi', 'Wild Cherry', '1.75', 'drink', 'https://m.media-amazon.com/images/I/71pfiM3E5EL.jpg');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Pepsi', 'Original', '1.75', 'drink', 'https://i5.walmartimages.com/asr/3bcc0155-c9d4-420d-a72d-b51df2f74272.b6728445b72558acb521af846c99591b.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Diet Pepsi', 'Wild Cherry', '1.75', 'drink', 'https://s.cornershopapp.com/product-images/3889218.jpg?versionId=dgTSilsJAeIrWU0cqq3Chsjy3LNbHGNe');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Diet Pepsi', 'Original', '1.75', 'drink', 'https://static.wixstatic.com/media/afa195_fdcb0bec834f48078a1f229d0963ae41~mv2.jpeg/v1/fill/w_3000,h_3000,al_c,q_85/afa195_fdcb0bec834f48078a1f229d0963ae41~mv2.jpeg');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Pepsi', 'Zero Sugar', '1.75', 'drink', 'https://images.freshop.com/00012000018770/b1ba84fb45fdd89a06c268587ba5b326_large.png');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Salad', null, '4.50', 'food', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0JwiZVzO1j8j2K4pKHauapX5ekpPXja_8hA&usqp=CAU');
INSERT INTO FoodDrinkItem(itemName, description, price, itemType, image) VALUES ('Cookie', null, '0.50', 'food', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-ms-fields-cookies-024-1544735513.jpg');
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (1, 1);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (1, 2);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (1, 4);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (2, 1);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (2, 3);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (2, 5);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (3, 1);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (3, 2);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (3, 4);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (3, 1);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (3, 3);
INSERT INTO KOrderItem(orderID, foodDrinkItemID) VALUES (3, 5);

