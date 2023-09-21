-- 1.Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT
ProductName, Price * 0.95 AS Price_$
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY Price DESC
LIMIT 1

--2.Вывести два самых дорогих товара из категории Beverages из USA
SELECT
*
FROM Products
JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryName = 'Beverages' AND Suppliers.Country = 'USA'
ORDER BY Price DESC
LIMIT 2

--3.Удалить товары с ценой менее 5 EUR
DELETE FROM Products
WHERE Price < 5

--4.Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT Suppliers.Country FROM [OrderDetails]
JOIN Orders ON Orders.OrderID= OrderDetails.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE 	CategoryName ='Seafood'

--5.Очистить поле ContactName у всех клиентов не из China
UPDATE [Customers]
SET ContactName = ''
WHERE Country != 'China'