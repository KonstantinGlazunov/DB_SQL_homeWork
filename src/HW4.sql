--1.Найти мин/стоимость товаров для каждой категории
SELECT	CategoryName, MIN(Price) as min_Price
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY Price
ORDER BY min_Price DESC

--2.Вывести ТОП-3 стран по количеству доставленных заказов
SELECT Country, COUNT(*) AS total_orders
FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Country
ORDER BY total_orders  DESC
LIMIT 3

--3.Вывести названия категорий, в которых более 10 товаров
SELECT  CategoryName, COUNT(*) AS total_Produts
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
HAVING total_Produts >= 10

--4.Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone=''
WHERE Suppliers.Country = "USA"

--5.Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT  FirstName, LastName	,  COUNT(*) AS total_Oders
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
HAVING total_Oders <= 15

--6.Вывести товар, который находится на втором месте по ко-ву заказов
SELECT ProductName, COUNT(*) AS total_orders
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY ProductName
ORDER BY total_orders  DESC
LIMIT 1  OFFSET 2