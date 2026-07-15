-- -- Data Validation
SELECT UnitPrice,Description, StockCode, Quantity 
FROM dbo.online_retail
WHERE UnitPrice =0 AND Quantity <0; 

-- -- Removing rows with negative values for quantity and when UnitPrice = 0
DELETE FROM dbo.online_retail
WHERE Quantity < 0
  AND UnitPrice = 0
  AND Description IS NULL;

SELECT UnitPrice,Description, Quantity 
FROM dbo.online_retail
WHERE UnitPrice =0 AND Quantity <0; 

DELETE FROM dbo.online_retail
WHERE Quantity < 0;

DELETE FROM dbo.online_retail
WHERE UnitPrice = 0;

-- -- SUMMARY STATISTICS - Qauntity, UnitPrice & Revenue
-- -- Quantity
SELECT 
    MIN(Quantity) AS MinQuantity,
    MAX(Quantity) AS MaxQuantity,
    AVG(Quantity) AS MeanQuantity,
    STDEV(Quantity) AS StdDevQuantity
FROM dbo.online_retail;

SELECT DISTINCT
PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY Quantity)
OVER () AS MedianQuantity
FROM dbo.online_retail;

-- -- UnitPrice
SELECT
    MIN(UnitPrice) AS MinUnitPrice,
    MAX(UnitPrice) AS MaxUnitPrice,
    AVG(UnitPrice) AS MeanUnitPrice,
    STDEV(UnitPrice) AS StdDevUnitPrice
FROM dbo.online_retail;

SELECT DISTINCT
PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY UnitPrice)
OVER () AS MedianUnitPrice
FROM dbo.online_retail;

-- -- Revenue
SELECT
    MIN(Quantity * UnitPrice) AS MinRevenue,
    MAX(Quantity * UnitPrice) AS MaxRevenue,
    AVG(Quantity * UnitPrice) AS MeanRevenue,
    STDEV(Quantity * UnitPrice) AS StdDevRevenue
FROM dbo.online_retail;

SELECT DISTINCT
    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY Quantity * UnitPrice)
    OVER () AS MedianRevenue
FROM dbo.online_retail;

-- -- Exploring data patterns 
-- -- Top selling products
SELECT
    Description,
    SUM(Quantity) AS TotalUnitsSold
FROM dbo.online_retail
WHERE Quantity > 0
GROUP BY Description
ORDER BY TotalUnitsSold DESC;

-- -- Highest Revenue Generating Countries
SELECT
    Country,
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM dbo.online_retail
WHERE Quantity > 0
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- -- Monthly Sales Trends
SELECT
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    SUM(Quantity * UnitPrice) AS Sales
FROM dbo.online_retail
WHERE Quantity > 0
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;

SELECT *
FROM dbo.online_retail;







