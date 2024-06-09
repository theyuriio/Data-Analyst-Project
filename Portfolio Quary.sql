--Sum of orders by category.
SELECT sum(Amount) as 'sum of amount', sum(Profit) as 'sum of profit', sum(Quantity) as 'quantity', Category
FROM dbo.Details
Group by Category;



--Looking for the most profitble customers.
SELECT d.Order_ID, o.CustomerName, Profit, State, City
FROM dbo.Details d
INNER JOIN dbo.Orders o ON d.Order_ID=o.Order_ID
ORDER by Profit desc;



--Profit by state
SELECT o.State, SUM(profit) as "Profit"
FROM dbo.Details d
INNER JOIN dbo.Orders o ON d.Order_ID = o.Order_ID
Group by State 
Order by Profit desc



--Profit by city
SELECT o.City, SUM(profit) as "Profit"
FROM dbo.Details d
INNER JOIN dbo.Orders o ON d.Order_ID = o.Order_ID
Group by City 
Order by Profit desc;



--Profit by Sub_Category
SELECT sum(Amount) as 'sum of amount', sum(Profit) as 'sum of profit', sum(Quantity) as 'quantity', Sub_Category
FROM dbo.Details
Group by Sub_Category
Order by 'sum of profit' desc;



--Most popular Payment Mode
SELECT sum(Amount) as 'sum of amount', sum(Profit) as 'sum of profit', sum(Quantity) as 'quantity', PaymentMode
FROM dbo.Details
Group by PaymentMode
Order by quantity desc;



--Profit by Month
SELECT sum(d.amount) as 'Amount', sum(d.Quantity) as 'Quantity', sum(Profit) as 'Profit', MONTH(o.Order_Date) as 'Month'
FROM dbo.Details d 
INNER JOIN DBO.Orders o ON d.Order_ID = o.Order_ID
GROUP by MONTH(o.Order_Date)
ORDER by 'Profit' desc;



--Profit by Month
SELECT sum(d.amount) as 'Amount', sum(d.Quantity) as 'Quantity', sum(Profit) as 'Profit', MONTH(o.Order_Date) as 'Month'
FROM dbo.Details d 
INNER JOIN DBO.Orders o ON d.Order_ID = o.Order_ID
GROUP by MONTH(o.Order_Date)
ORDER by 'Profit' desc;
