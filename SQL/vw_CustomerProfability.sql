CREATE VIEW vw_CustomerProfitability AS
SELECT
    o.CustomerName,
    o.State,
    o.City,
    SUM(d.Profit) AS TotalProfit,
    COUNT(d.Order_ID) AS NumberOfOrders
FROM
    dbo.Details d
INNER JOIN
    dbo.Orders o ON d.Order_ID = o.Order_ID
GROUP BY
    o.CustomerName,
    o.State,
    o.City;
