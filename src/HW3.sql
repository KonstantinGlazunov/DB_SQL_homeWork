--1. Вывести ко-во поставщиков не из UK и не из China
SELECT COUNT(*) AS Not_UK_China_suppliers 

FROM [Suppliers]
WHERE
Country NOT IN ('UK', 'China')

--2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT 
AVG(Price) AS avg_price, MAX(Price) AS max_price, MIN(Price) AS min_price, 
SUM (Unit) AS Total_quantity

FROM [Products]
WHERE CategoryId IN (3,5)

--3 Вывести общую сумму проданных товаров
  SELECT 
  SUM (Quantity * Price) AS Total_SUM
  FROM [Products]
  JOIN OrderDetails ON OrderDetails.ProductId = Products.ProductId

  --4 Вывести ко-во стран, которые поставляют напитки
  SELECT DISTINCT SUM (Country) AS Total_Countries_Beverages
  FROM [Products]
  JOIN Suppliers ON Suppliers.SupplierID= Products.SupplierID
  JOIN Categories ON Products.CategoryID = Categories.CategoryID
  WHERE
	CategoryName = 'Beverages'

  --5 Вывести сумму, на которую было отправлено товаров клиентам в Germany
    SELECT  SUM (Quantity * Price) AS Total_SUM_Germany
  FROM [Products]
  JOIN OrderDetails ON OrderDetails.ProductId = Products.ProductId
  JOIN Orders ON Orders.OrderId = OrderDetails.OrderId
  JOIN Customers ON Customers.CustomerID = Orders.CustomerID
  WHERE
  Country= 'Germany'