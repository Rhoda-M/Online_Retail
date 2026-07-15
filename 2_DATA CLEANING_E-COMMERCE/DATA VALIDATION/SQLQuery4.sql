-- -- SUMMARY STATISTICS
SELECT MIN(Quantity) AS MinimumQuantity
FROM dbo.online_retail
WHERE Quantity NOT LIKE '-%';

SELECT Description, Quantity 
FROM dbo.online_retail
WHERE Quantity = 80995;

SELECT Description, Quantity, UnitPrice,StockCode 
FROM dbo.online_retail
WHERE Quantity = -80995;

SELECT Description, Quantity
FROM dbo.online_retail
WHERE Quantity<0;