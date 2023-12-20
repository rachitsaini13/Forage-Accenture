-- Cleaning Content
---------------------
------------------

SELECT TRIM(ContentID) AS ContentID, 
      TRIM(User_ID) AS User_ID, 
      LOWER(TRIM(Type)) AS Type,
      REPLACE(LOWER(TRIM(Category)),'"', '') AS Category
FROM `capstone-402023.ForageAccenture.Content`

-- Cleaning Reactions Table 
----------------------
  ----------------------

-- checking for duplicates 
SELECT Content_ID, User_ID,Datetime, COUNT(*) FROM `capstone-402023.ForageAccenture.Reactions` GROUP BY Content_ID, User_ID, Datetime 
HAVING COUNT(*)>1
--Type as null percentage 
SELECT (COUNT(*)/(SELECT COUNT(*) FROM `capstone-402023.ForageAccenture.Reactions`))*100
 FROM `capstone-402023.ForageAccenture.Reactions` WHERE Type IS NULL

-- Whole cleaning script
SELECT Content_ID,
        CASE WHEN User_ID IS NULL THEN "anonymous"
        ELSE User_ID  END
              AS User_ID,
        LOWER(TRIM(Type)) AS Type, 
        Datetime
FROM `capstone-402023.ForageAccenture.Reactions` 
WHERE Type IS NOT NULL


-------------------------------
-------------------------
--Cleaning ReactionTypes Table

