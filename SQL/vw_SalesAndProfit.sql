CREATE VIEW vw_SalesAndProfit AS
SELECT
    'Category' AS Dimension,
    Category AS DimensionValue,
    SUM(Amount) AS TotalAmount,
    SUM(Profit) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity
FROM
    dbo.Details
GROUP BY
    Category

UNION ALL

SELECT
    'Sub_Category' AS Dimension,
    Sub_Category AS DimensionValue,
    SUM(Amount) AS TotalAmount,
    SUM(Profit) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity
FROM
    dbo.Details
GROUP BY
    Sub_Category

UNION ALL

SELECT
    'City' AS Dimension,
    o.City AS DimensionValue,
    SUM(d.Amount) AS TotalAmount,
    SUM(d.Profit) AS TotalProfit,
    SUM(d.Quantity) AS TotalQuantity
FROM
    dbo.Details d
INNER JOIN
    dbo.Orders o ON d.Order_ID = o.Order_ID
GROUP BY
    o.City

UNION ALL

SELECT
    'State' AS Dimension,
    o.State AS DimensionValue,
    SUM(d.Amount) AS TotalAmount,
    SUM(d.Profit) AS TotalProfit,
    SUM(d.Quantity) AS TotalQuantity
FROM
    dbo.Details d
INNER JOIN
    dbo.Orders o ON d.Order_ID = o.Order_ID
GROUP BY
    o.State

UNION ALL

SELECT
    'PaymentMode' AS Dimension,
    PaymentMode AS DimensionValue,
    SUM(Amount) AS TotalAmount,
    SUM(Profit) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity
FROM
    dbo.Details
GROUP BY
    PaymentMode

UNION ALL

SELECT
    'Month' AS Dimension,
    CAST(MONTH(o.Order_Date) AS VARCHAR(2)) AS DimensionValue,
    SUM(d.Amount) AS TotalAmount,
    SUM(d.Profit) AS TotalProfit,
    SUM(d.Quantity) AS TotalQuantity
FROM
    dbo.Details d
INNER JOIN
    dbo.Orders o ON d.Order_ID = o.Order_ID
GROUP BY
    MONTH(o.Order_Date);
