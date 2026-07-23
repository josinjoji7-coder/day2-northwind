-- 

SELECT
    Products.ProductName,
    SUM([Order Details].Quantity) AS TotalSold
FROM Products
JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
GROUP BY Products.ProductName
ORDER BY TotalSold DESC
LIMIT 10;

SELECT
Customers.CompanyName,

SUM(
[Order Details].UnitPrice *
[Order Details].Quantity
) AS Revenue

FROM Customers

JOIN Orders

ON Customers.CustomerID=Orders.CustomerID

JOIN [Order Details]

ON Orders.OrderID=[Order Details].OrderID

GROUP BY Customers.CompanyName

ORDER BY Revenue DESC

LIMIT 10;

SELECT

strftime('%Y-%m', Orders.OrderDate) AS Month,

SUM(
[Order Details].UnitPrice *
[Order Details].Quantity
) AS MonthlySales

FROM Orders

JOIN [Order Details]

ON Orders.OrderID=[Order Details].OrderID

GROUP BY Month

ORDER BY Month;

SELECT

Categories.CategoryName,

SUM(
[Order Details].UnitPrice *
[Order Details].Quantity
) AS Revenue

FROM Categories

JOIN Products

ON Categories.CategoryID=Products.CategoryID

JOIN [Order Details]

ON Products.ProductID=[Order Details].ProductID

GROUP BY Categories.CategoryName

ORDER BY Revenue DESC;

SELECT

Customers.CompanyName,

COUNT(Orders.OrderID) AS TotalOrders

FROM Customers

JOIN Orders

ON Customers.CustomerID=Orders.CustomerID

GROUP BY Customers.CompanyName

ORDER BY TotalOrders DESC;