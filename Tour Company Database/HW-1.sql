-- Ülkesi A harfi ile bitmeyen müþterileri listeleyin.
SELECT *
FROM Customers 
WHERE Country NOT LIKE '%A'

/* Ürün adlarýný ve fiyatlarýný, 
her birine %18 olarak uygulanmak üzere 
KDV bilgisiyle beraber listeleyin. 
KDV bilgisi ayrý bir sütun olarak gelmeli. 
UrunAdi | UrunFiyati | KDVliFiyat | KDV */

SELECT ProductName AS Urun_Adi, 
       UnitPrice AS Urun_Fiyati,
       UnitPrice+UnitPrice*18/100 AS KDVli_Fiyat,
       (UnitPrice*18/100)/UnitPrice AS KDV_Orani   
FROM Products

/* Yaþadýðý þehir London ve Seattle olmayan çalýþanlarýmýz kimlerdir?
FullName | City */ 

SELECT FirstName + ' ' + LastName AS FullName,City
FROM Employees
WHERE City != 'London' AND City != 'Seattle'

--Stok miktarý kritik seviyeye veya altýna düþmesine raðmen 
--hala sipariþini vermediðim ürünler hangileridir? ProductName

SELECT ProductName
FROM Products
WHERE UnitsInStock<=10 AND Discontinued=1

-- Amerika'ya teslimatý geciken sipariþler hangileridir?

SELECT *
FROM Orders
WHERE RequiredDate>ShippedDate AND ShipCountry='USA'

-- Son gününde teslim edilen sipariþler hangileridir?

SELECT *
FROM Orders
WHERE RequiredDate = ShippedDate

-- En yüksek kargo ücreti ödenmiþ 5 sipariþ hangi ülkelere gönderilmiþ?

SELECT TOP 5 *
FROM Orders
ORDER BY Freight DESC

-- Bu zamana kadar sattýðým en ucuz üründen, o ucuz fiyata kaç tane satmýþým?

SELECT TOP 1 ProductName,UnitPrice, QuantityPerUnit
FROM Products
ORDER BY UnitPrice ASC   
        
-- Artýk satýþta olmayan en pahalý ürünüm hangisidir?

SELECT TOP 1 *
FROM Products
WHERE Discontinued=1
ORDER BY UnitPrice DESC

-- Japonya ve Ýtalya'daki tedarikcileri listeleyin. TedarikciAdi | Ulke

SELECT ContactName AS TedarikciAdi,
       Country AS Ulke
FROM Suppliers
WHERE Country IN ('Japan','Italy')

-- Son teslim edilen 10 sipariþi gösterin.

SELECT TOP 10 *
FROM Orders
ORDER BY ShippedDate DESC

--Londra'da yaþayan çalýþanlarýn ilgilendiði müþterilerden Almanya'da yaþayanlar kimlerdir?

SELECT *
FROM Employees E
JOIN Orders O
ON E.EmployeeID = O.EmployeeID
JOIN Customers C 
ON C.CustomerID = O.CustomerID
WHERE E.City= 'London' AND O.ShipCountry ='Germany'

-- ALFKI kodlu müþteri hangi kategorilerden sipariþ vermiþtir?

SELECT CustomerID, CategoryName
FROM Orders O
JOIN Categories C
ON O.EmployeeID= C.CategoryID
WHERE CustomerID='ALFKI'

-- Steven Buchanan adlý çalýþanýn sattýðý ürünlerden Speedy Express ile taþýnanlarý hangileridir?

SELECT *
FROM Employees E
JOIN Orders O
ON E.EmployeeID = O.EmployeeID
JOIN Shippers S 
ON S.ShipperID = O.ShipVia
WHERE S.ShipperID = 1 AND E.EmployeeID = 

-- Doðu konumundaki bölgeleri listeleyin.

SELECT TerritoryDescription
FROM Territories T
JOIN Region R
ON R.RegionID= T.RegionID
WHERE RegionDescription= 'Eastern'