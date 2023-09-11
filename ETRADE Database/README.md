# ETRADE Veritabanı

Bu repository, bir e-ticaret (ETRADE) veritabanını temsil eder. Veritabanı, birçok tablodan oluşur ve işte bu tabloların daha ayrıntılı açıklamaları:

## COUNTRIES Tablosu

- **ID**: Ülkelerin benzersiz kimliğini temsil eder. Bu alan tinyint veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **COUNTRY**: Ülkenin adını içerir. Bu alan varchar(50) veri türündedir.

## CITIES Tablosu

- **ID**: Şehirlerin benzersiz kimliğini temsil eder. Bu alan smallint veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **COUNTRYID**: Şehrin bağlı olduğu ülkenin kimliğini içerir ve `COUNTRIES` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan tinyint veri türündedir.
- **CITY**: Şehrin adını içerir. Bu alan varchar(50) veri türündedir.

## TOWNS Tablosu

- **ID**: İlçelerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **CITYID**: İlçenin bağlı olduğu şehrin kimliğini içerir ve `CITIES` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan smallint veri türündedir.
- **TOWN**: İlçenin adını içerir. Bu alan varchar(50) veri türündedir.

## INVOICES Tablosu

- **ID**: Faturaların benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **ORDERID**: Faturanın bağlı olduğu siparişin kimliğini içerir. Bu alan int veri türündedir.
- **DATE_**: Faturanın tarihini kaydeder. Bu alan datetime veri türündedir.
- **ADDRESSID**: Faturanın gönderileceği adresin kimliğini içerir ve `ADDRESS` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **CARGOFICHENO**: Kargonun fiş numarasını içerir. Bu alan varchar(20) veri türündedir.
- **TOTALPRICE**: Faturanın toplam tutarını içerir. Bu alan decimal(18,4) veri türündedir.

## ADDRESS Tablosu

- **ID**: Adreslerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **USERID**: Adresin bağlı olduğu kullanıcının kimliğini içerir ve `USERS` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **COUNTRYID**: Adresin bulunduğu ülkenin kimliğini içerir ve `COUNTRIES` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan tinyint veri türündedir.
- **CITYID**: Adresin bulunduğu şehrin kimliğini içerir ve `CITIES` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan smallint veri türündedir.
- **TOWNID**: Adresin bulunduğu ilçenin kimliğini içerir ve `TOWNS` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **DISTRICTID**: Adresin bulunduğu semtin kimliğini içerir. Bu alan int veri türündedir.
- **POSTALCODE**: Adresin posta kodunu içerir. Bu alan varchar(10) veri türündedir.
- **ADDRESSTEXT**: Adresin metin bilgisini içerir. Bu alan varchar(500) veri türündedir.

## USERS Tablosu

- **ID**: Kullanıcıların benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **USERNAME_**: Kullanıcının kullanıcı adını içerir. Bu alan varchar(50) veri türündedir.
- **PASSWORD_**: Kullanıcının şifresini içerir. Bu alan varchar(50) veri türündedir.
- **NAMESURNAME**: Kullanıcının adını ve soyadını içerir. Bu alan varchar(100) veri türündedir.
- **EMAIL**: Kullanıcının e-posta adresini içerir. Bu alan varchar(100) veri türündedir.
- **GENDER**: Kullanıcının cinsiyetini belirtir. Bu alan varchar(1) veri türündedir.
- **BIRTHDATE**: Kullanıcının doğum tarihini saklar. Bu alan date veri türündedir.
- **CREATEDDATE**: Kullanıcının hesabının oluşturulma tarihini içerir. Bu alan datetime veri türündedir.
- **TELNR1**: Kullanıcının birinci telefon numarasını içerir. Bu alan varchar(15) veri türündedir.
- **TELNR2**: Kullanıcının ikinci telefon numarasını içerir. Bu alan varchar(15) veri türündedir.

## DISTRICTS Tablosu

- **ID**: Semtlerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **TOWNID**: Semtin bağlı olduğu ilçenin kimliğini içerir ve `TOWNS` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **DISTRICT**: Semtin adını içerir. Bu alan varchar(50) veri türündedir.

## INVOICEDETAILS Tablosu

- **ID**: Fatura detaylarının benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **INVOICEID**: Fatura detaylarının bağlı olduğu faturanın kimliğini içerir. Bu alan int veri türündedir.
- **ORDERDETAILID**: Fatura detaylarının bağlı olduğu sipariş detayının kimliğini içerir. Bu alan int veri türündedir.
- **ITEMID**: Fatura detaylarının bağlı olduğu ürünün kimliğini içerir. Bu alan int veri türündedir.
- **AMOUNT**: Ürün miktarını içerir. Bu alan int veri türündedir.
- **UNITPRICE**: Ürün birim fiyatını içerir. Bu alan decimal(18,4) veri türündedir.
- **LINETOTAL**: Fatura detayının toplam tutarını içerir. Bu alan decimal(18,4) veri türündedir.

## ORDERDETAILS Tablosu

- **ID**: Sipariş detaylarının benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **ORDERID**: Sipariş detaylarının bağlı olduğu siparişin kimliğini içerir. Bu alan int veri türündedir.
- **ITEMID**: Sipariş detaylarının bağlı olduğu ürünün kimliğini içerir. Bu alan int veri türündedir.
- **AMOUNT**: Ürün miktarını içerir. Bu alan int veri türündedir.
- **UNITPRICE**: Ürün birim fiyatını içerir. Bu alan decimal(18,4) veri türündedir.
- **LINETOTAL**: Sipariş detayının toplam tutarını içerir. Bu alan decimal(18,4) veri türündedir.

## ITEMS Tablosu

- **ID**: Ürünlerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **ITEMCODE**: Ürünün kodunu içerir. Bu alan varchar(50) veri türündedir.
- **ITEMNAME**: Ürünün adını içerir. Bu alan varchar(100) veri türündedir.
- **UNITPRICE**: Ürünün birim fiyatını içerir. Bu alan float veri türündedir.
- **CATEGORY1**: Ürünün birinci kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY2**: Ürünün ikinci kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY3**: Ürünün üçüncü kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY4**: Ürünün dördüncü kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **BRAND**: Ürünün markasını içerir. Bu alan varchar(50) veri türündedir.

## SALEORDERS Tablosu

- **ID**: Satış siparişlerinin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **USERNAME_**: Siparişi veren kullanıcının adını içerir. Bu alan varchar(50) veri türündedir.
- **NAMESURNAME**: Siparişi veren kullanıcının adını ve soyadını içerir. Bu alan varchar(15) veri türündedir.
- **TELNR1**: Siparişi veren kullanıcının birinci telefon numarasını içerir. Bu alan varchar(15) veri türündedir.
- **TELNR2**: Siparişi veren kullanıcının ikinci telefon numarasını içerir. Bu alan varchar(15) veri türündedir.
- **COUNTRY**: Siparişin gönderileceği ülkeyi içerir. Bu alan varchar(50) veri türündedir.
- **CITY**: Siparişin gönderileceği şehri içerir. Bu alan varchar(50) veri türündedir.
- **TOWN**: Siparişin gönderileceği ilçeyi içerir. Bu alan varchar(50) veri türündedir.
- **ADDRESSTEXT**: Siparişin gönderileceği adresin metin bilgisini içerir. Bu alan varchar(500) veri türündedir.
- **ORDERID**: Siparişin kimliğini içerir. Bu alan varchar(50) veri türündedir.
- **ITEMCODE**: Sipariş edilen ürünün kodunu içerir. Bu alan varchar(100) veri türündedir.
- **ITEMNAME**: Sipariş edilen ürünün adını içerir. Bu alan varchar(50) veri türündedir.
- **BRAND**: Sipariş edilen ürünün markasını içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY1**: Sipariş edilen ürünün birinci kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY2**: Sipariş edilen ürünün ikinci kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY3**: Sipariş edilen ürünün üçüncü kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY4**: Sipariş edilen ürünün dördüncü kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **AMOUNT**: Ürün miktarını içerir. Bu alan int veri türündedir.
- **UNITPRICE**: Ürün birim fiyatını içerir. Bu alan decimal(18,4) veri türündedir.
- **LINETOTAL**: Sipariş edilen ürünün toplam tutarını içerir. Bu alan decimal(18,4) veri türündedir.
- **ORDERDATE**: Siparişin tarihini içerir. Bu alan date veri türündedir.
- **ORDERTIME**: Siparişin saatini içerir. Bu alan time(7) veri türündedir.
- **YEAR_**: Siparişin yapıldığı yılı içerir. Bu alan varchar(10) veri türündedir.
- **MONTH_**: Siparişin yapıldığı ayı içerir. Bu alan nvarchar(30) veri türündedir.
- **DAYOFWEEK_**: Siparişin yapıldığı haftanın gününü içerir.

## ORDERS Tablosu

- **ID**: Siparişlerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **USERID**: Siparişi veren kullanıcının kimliğini içerir ve `USERS` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **DATE_**: Siparişin tarihini içerir. Bu alan datetime veri türündedir.
- **TOTALPRICE**: Siparişin toplam tutarını içerir. Bu alan decimal(18,4) veri türündedir.
- **STATUS_**: Siparişin durumunu belirtir. Bu alan tinyint veri türündedir.
- **ADDRESSID**: Siparişin gönderileceği adresin kimliğini içerir ve `ADDRESS` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.

## ITEMS_LOG Tablosu

- **ID**: Ürünlerin günlük log kayıtlarının benzersiz kimliğini temsil eder. Bu alan varchar(50) veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **ITEMCODE**: Log kaydının bağlı olduğu ürünün kodunu içerir. Bu alan varchar(100) veri türündedir.
- **ITEMNAME**: Log kaydının bağlı olduğu ürünün adını içerir. Bu alan float veri türündedir.
- **UNITPRICE**: Log kaydının bağlı olduğu ürünün birim fiyatını içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY1**: Log kaydının bağlı olduğu ürünün birinci kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY2**: Log kaydının bağlı olduğu ürünün ikinci kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **CATEGORY3**: Log kaydının bağlı olduğu ürünün üçüncü kategori bilgisini içerir. Bu alan varchar(10) veri türündedir.
- **CATEGORY4**: Log kaydının bağlı olduğu ürünün dördüncü kategori bilgisini içerir. Bu alan varchar(50) veri türündedir.
- **BRAND**: Log kaydının bağlı olduğu ürünün markasını içerir. Bu alan varchar(50) veri türündedir.
- **LOG_ACTIONTYPE**: Log kaydının yapılan işlem türünü belirtir. Bu alan varchar(20) veri türündedir.
- **LOG_DATE**: Log kaydının tarihini içerir. Bu alan datetime veri türündedir.
- **LOG_USERNAME**: Log kaydını oluşturan kullanıcının adını içerir. Bu alan varchar(50) veri türündedir.
- **LOG_PROGRAMNAME**: Log kaydını oluşturan programın adını içerir. Bu alan varchar(50) veri türündedir.
- **LOG_HOSTNAME**: Log kaydını oluşturan cihazın adını içerir. Bu alan varchar(50) veri türündedir.

## PAYMENTS Tablosu

- **ID**: Ödemelerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **ORDERID**: Ödemenin bağlı olduğu siparişin kimliğini içerir. Bu alan int veri türündedir.
- **PAYMENTTYPE**: Ödeme türünü belirtir. Bu alan tinyint veri türündedir.
- **DATE_**: Ödemenin tarihini içerir. Bu alan datetime veri türündedir.
- **ISOK**: Ödeme durumunu belirtir. Bu alan bit veri türündedir.
- **APPROVECODE**: Ödemenin onay kodunu içerir. Bu alan varchar(100) veri türündedir.
- **PAYMENTTOTAL**: Ödemenin toplam tutarını içerir. Bu alan decimal(18,4) veri türündedir.

# Data Model

![alt text](https://github.com/metincanayar/SQL/blob/main/ETRADE%20Database/ETRADE%20Data%20Model.jpeg)
