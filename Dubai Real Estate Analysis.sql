SELECT * FROM PROPERTIES


--What are the top 10 most expensive neighborhood based on average property price.
SELECT TOP 10 Neighborhood,
AVG(Price)  as 'Average Price'
FROM Properties
GROUP BY Neighborhood
ORDER BY 2 DESC


--Which Neighborhood have the highest average price per square foot.
SELECT TOP 1 Neighborhood,
ROUND(AVG(Price_per_sqft),2) as 'Price per sqft'
FROM Properties
GROUP BY Neighborhood
ORDER BY 2 DESC


--Which Neighborhood offers the best value(lowest price per sqft).
SELECT TOP 1 Neighborhood,
ROUND(AVG(Price_per_sqft),2) as 'Price per sqft'
FROM Properties
GROUP BY Neighborhood
ORDER BY 2


--What is the average price by number of bedrooms.
WITH Bedrooms AS
(
Select No_of_bedrooms as 'Bedrooms',
AVG(PRICE) AS 'Average Price'
FROM PROPERTIES
GROUP BY No_of_bedrooms
)
SELECT 
CASE WHEN Bedrooms = 0 THEN 'Studio'
WHEN Bedrooms = 1 THEN '1 Bedroom'
WHEN Bedrooms = 2 THEN '2 Bedrooms'
WHEN Bedrooms = 3 THEN '3 Bedrooms'
WHEN Bedrooms = 4 THEN '4 Bedrooms'
WHEN Bedrooms = 5 THEN '5 Bedrooms'
END AS Bedrooms
,
[Average Price] FROM Bedrooms
ORDER BY Bedrooms DESC


--Which Bedroom category contributes the highest total market value.
SELECT TOP 1 no_of_bedrooms AS 'Bedrooms',
SUM(PRICE) 'Sale Price'
FROM Properties
GROUP BY no_of_bedrooms
ORDER BY 2 DESC


--What is the average price difference between private pool vs without private pool.
WITH CTE AS (
SELECT PRIVATE_POOL,
AVG(PRICE) AS 'Average Price'
FROM PROPERTIES
GROUP BY PRIVATE_POOL
)
SELECT 
CASE WHEN PRIVATE_POOL = 1 THEN 'With Private Pool'
ELSE 'Without Private Pool' END AS 'Private_Pool',
[Average Price]
FROM CTE


--Properties with higher than average price.
SELECT * FROM PROPERTIES WHERE PRICE > 
2*
(
SELECT AVG(PRICE) FROM PROPERTIES
)


--Properties which is best deals ( below the average price ).

SELECT * FROM PROPERTIES WHERE PRICE < 10*
(
SELECT AVG(PRICE) FROM PROPERTIES
)


--Most expensive properties in each neighborhood.
SELECT * FROM 
(SELECT *,
ROW_NUMBER() OVER (PARTITION BY NEIGHBORHOOD ORDER BY PRICE DESC ) RANK
FROM PROPERTIES
) T
WHERE RANK = 1
ORDER BY PRICE DESC


--Top 3 most expensive properties in each neighborhood.
SELECT * FROM 
(SELECT *,
ROW_NUMBER() OVER (PARTITION BY NEIGHBORHOOD ORDER BY PRICE DESC ) RANK
FROM PROPERTIES
) T
WHERE RANK <= 3
ORDER BY PRICE DESC


--Which neighborhood have the highest percentage of properties with a private pool.

--Change datatype from bit to int.
alter table properties
alter column private_pool int
--
SELECT Neighborhood, COUNT(*) AS total_properties,
SUM(private_pool) AS properties_with_private_pool,
CONCAT((SUM(private_pool)*100/COUNT(*)), '%')
FROM properties
GROUP BY neighborhood
ORDER BY CONCAT((SUM(private_pool)*100/COUNT(*)), '%') desc


--Find properties that have atleast 4 amanities and rank them by their price.
WITH Property_ranking as (
SELECT Id, Neighborhood, Price, Balcony, Private_gym, security, Private_pool 
FROM Properties
WHERE balcony =1 
AND private_gym = 1
AND security = 1
AND private_pool = 1
)
SELECT *, RANK() OVER (ORDER BY PRICE DESC ) Ranking
FROM Property_ranking


--Neighborhood where the gap between the cheapest and most expensive property is largest.
SELECT  TOP 10 Neighborhood,
MAX(PRICE)  AS 'Maximum Price',
MIN(PRICE) 'Minimum Price',
MAX(PRICE) - MIN(PRICE) AS 'Price Difference'
FROM PROPERTIES
GROUP BY NEIGHBORHOOD
ORDER BY 4 DESC 


--Some overpriced properties (quality low-medium but price of high).
WITH CTE AS
(
SELECT ID, NEIGHBORHOOD, PRICE,QUALITY
FROM PROPERTIES
WHERE QUALITY = 'Low'
OR quality = 'Medium'
)
SELECT * FROM CTE
WHERE PRICE >= (select avg(price) from properties where quality = 'High')
ORDER BY PRICE DESC