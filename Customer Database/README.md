# Customers Veritabanı README

Bu repository, bir müşteri yönetimi veritabanını temsil eder. Veritabanı, üç ana tablodan oluşur: `CITIES`, `CUSTOMERS`, ve `DISTRICTS`. Aşağıda bu tabloların daha ayrıntılı açıklamalarını bulabilirsiniz:

## CITIES Tablosu

- **ID**: Şehirlerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **CITY**: Şehirlerin adını içerir. Bu alan varchar(50) veri türündedir.

## CUSTOMERS Tablosu

- **ID**: Müşterilerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **CUSTOMERNAME**: Müşterinin adını içerir. Bu alan varchar(100) veri türündedir.
- **TCNUMBER**: Müşterinin TC Kimlik numarasını içerir. Bu alan varchar(11) veri türündedir.
- **GENDER**: Müşterinin cinsiyetini belirtir. Bu alan varchar(1) veri türündedir.
- **EMAIL**: Müşterinin e-posta adresini içerir. Bu alan varchar(100) veri türündedir.
- **BIRTHDATE**: Müşterinin doğum tarihini saklar. Bu alan date veri türündedir.
- **CITYID**: Müşterinin şehir bilgisini içerir ve `CITIES` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **DISTRICTID**: Müşterinin ilçe bilgisini içerir ve `DISTRICTS` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **TELNR1**: Müşterinin birinci telefon numarasını içerir. Bu alan varchar(15) veri türündedir.
- **TELNR2**: Müşterinin ikinci telefon numarasını içerir. Bu alan varchar(15) veri türündedir.

## DISTRICTS Tablosu

- **ID**: İlçelerin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **CITYID**: İlçenin bağlı olduğu şehir bilgisini içerir ve `CITIES` tablosuna bir dış anahtar (Foreign Key) olarak bağlanır. Bu alan int veri türündedir.
- **DISTRICT**: İlçenin adını içerir. Bu alan varchar(50) veri türündedir.

Bu veritabanı, müşteri bilgilerini ve müşterilerin yaşadığı şehir ve ilçe bilgilerini saklamak için kullanılabilir. Her tablo, ilgili bilgileri saklamak için kullanılır ve ilişkilendirilmiş anahtarlarla birbirine bağlanabilir.

## Data Model
![alt text](https://github.com/metincanayar/SQL/blob/main/Customer%20Database/Customers%20Data%20Model.jpeg)
