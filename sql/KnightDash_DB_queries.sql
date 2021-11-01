
--
-- This SQL script implements sample queries on the KnightDash database.
--
-- @author mindysport
-- @version Fall, 2021
--
-- Get all Order records.
SELECT *
  FROM KOrder
  ;

-- View DiningHall
SELECT * 
  FROM DiningHall
  ;
  
-- Get all the users' orders
SELECT *
  FROM KUSER ku
  INNER JOIN Korder ko
  ON ku.ID = ko.ID
 ;
 
-- Get all the users with active orders
SELECT *
  FROM KUSER ku
  INNER JOIN Korder ko
  	ON ku.ID = ko.ID
  WHERE ko.status = 'active'
 ;

-- Get item prices in order.
  SELECT DISTINCT 	 itemName
  				   , price
    FROM FoodItem
ORDER BY price DESC
   ;
