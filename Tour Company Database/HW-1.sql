-- �lkesi A harfi ile bitmeyen m��terileri listeleyin.
SELECT *
FROM Customers 
WHERE Country NOT LIKE '%A'

/* �r�n adlar�n� ve fiyatlar�n�, 
her birine %18 olarak uygulanmak �zere 
KDV bilgisiyle beraber listeleyin. 
KDV bilgisi ayr� bir s�tun olarak gelmeli. 
UrunAdi | UrunFiyati | KDVliFiyat | KDV */

SELECT ProductName AS Urun_Adi, 
       UnitPrice AS Urun_Fiyati,
       UnitPrice+UnitPrice*18/100 AS KDVli_Fiyat,
       (UnitPrice*18/100)/UnitPrice AS KDV_Orani   
FROM Products

/* Ya�ad��� �ehir London ve Seattle olmayan �al��anlar�m�z kimlerdir?
FullName | City */ 

SELECT FirstName + ' ' + LastName AS FullName,City
FROM Employees
WHERE City != 'London' AND City != 'Seattle'

--Stok miktar� kritik seviyeye veya alt�na d��mesine ra�men 
--hala sipari�ini vermedi�im �r�nler hangileridir? ProductName

SELECT ProductName
FROM Products
WHERE UnitsInStock<=10 AND Discontinued=1

-- Amerika'ya teslimat� geciken sipari�ler hangileridir?

SELECT *
FROM Orders
WHERE RequiredDate>ShippedDate AND ShipCountry='USA'

-- Son g�n�nde teslim edilen sipari�ler hangileridir?

SELECT *
FROM Orders
WHERE RequiredDate = ShippedDate

-- En y�ksek kargo �creti �denmi� 5 sipari� hangi �lkelere g�nderilmi�?

SELECT TOP 5 *
FROM Orders
ORDER BY Freight DESC

-- Bu zamana kadar satt���m en ucuz �r�nden, o ucuz fiyata ka� tane satm���m?

SELECT TOP 1 ProductName,UnitPrice, QuantityPerUnit
FROM Products
ORDER BY UnitPrice ASC   
        
-- Art�k sat��ta olmayan en pahal� �r�n�m hangisidir?

SELECT TOP 1 *
FROM Products
WHERE Discontinued=1
ORDER BY UnitPrice DESC

-- Japonya ve �talya'daki tedarikcileri listeleyin. TedarikciAdi | Ulke

SELECT ContactName AS TedarikciAdi,
       Country AS Ulke
FROM Suppliers
WHERE Country IN ('Japan','Italy')

-- Son teslim edilen 10 sipari�i g�sterin.

SELECT TOP 10 *
FROM Orders
ORDER BY ShippedDate DESC

--Londra'da ya�ayan �al��anlar�n ilgilendi�i m��terilerden Almanya'da ya�ayanlar kimlerdir?

SELECT *
FROM Employees E
JOIN Orders O
ON E.EmployeeID = O.EmployeeID
JOIN Customers C 
ON C.CustomerID = O.CustomerID
WHERE E.City= 'London' AND O.ShipCountry ='Germany'

-- ALFKI kodlu m��teri hangi kategorilerden sipari� vermi�tir?

SELECT CustomerID, CategoryName
FROM Orders O
JOIN Categories C
ON O.EmployeeID= C.CategoryID
WHERE CustomerID='ALFKI'

-- Steven Buchanan adl� �al��an�n satt��� �r�nlerden Speedy Express ile ta��nanlar� hangileridir?

SELECT *
FROM Employees E
JOIN Orders O
ON E.EmployeeID = O.EmployeeID
JOIN Shippers S 
ON S.ShipperID = O.ShipVia
WHERE S.ShipperID = 1 AND E.EmployeeID = 

-- Do�u konumundaki b�lgeleri listeleyin.

SELECT TerritoryDescription
FROM Territories T
JOIN Region R
ON R.RegionID= T.RegionID
WHERE RegionDescription= 'Eastern'