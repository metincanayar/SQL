# HR Veritabanı README

Bu repository, bir İnsan Kaynakları (HR) veritabanını temsil eder. Veritabanı, üç ana tablodan oluşur: `POSITION`, `PERSON`, ve `DEPARTMENT`. Aşağıda bu tabloların daha ayrıntılı açıklamalarını bulabilirsiniz:

## POSITION Tablosu

- **ID**: Pozisyonun benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **POSITION**: Pozisyonun adını içerir. Bu alan varchar(50) veri türündedir.

## PERSON Tablosu

- **ID**: Kişinin benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **CODE**: Kişinin işe alınma kodunu saklar. Bu alan varchar(10) veri türündedir.
- **TCNUMBER**: Kişinin TC Kimlik numarasını içerir. Bu alan varchar(11) veri türündedir.
- **NAME_**: Kişinin adını içerir. Bu alan varchar(50) veri türündedir.
- **SURNAME**: Kişinin soyadını içerir. Bu alan varchar(50) veri türündedir.
- **GENDER**: Kişinin cinsiyetini belirtir. Bu alan varchar(1) veri türündedir.
- **BIRTHDATE**: Kişinin doğum tarihini kaydeder. Bu alan date veri türündedir.
- **INDATE**: Kişinin işe başlama tarihini kaydeder. Bu alan date veri türündedir.
- **OUTDATE**: Kişinin işten ayrılma tarihini belirtir. Bu alan date veri türündedir.
- **DEPARTMENTID**: Kişinin bağlı olduğu bölümün kimliğini içerir. Bu alan int veri türündedir.
- **POSITIONID**: Kişinin görev aldığı pozisyonun kimliğini içerir. Bu alan int veri türündedir.
- **PARENTPOSITIONID**: Kişinin bağlı olduğu pozisyonun üst pozisyonunun kimliğini saklar. Bu alan int veri türündedir.
- **MANAGERID**: Kişinin yöneticisinin kimliğini belirtir. Bu alan int veri türündedir.
- **TELNR**: Kişinin telefon numarasını içerir. Bu alan varchar(15) veri türündedir.
- **SALARY**: Kişinin maaşını kaydeder. Bu alan float veri türündedir.

## DEPARTMENT Tablosu

- **ID**: Bölümün benzersiz kimliğini temsil eder. Bu alan int veri türündedir ve birincil anahtar (Primary Key) olarak işlev görür.
- **DEPARTMENT**: Bölümün adını içerir. Bu alan varchar(50) veri türündedir.

Bu veritabanı, bir kuruluşun personel yönetimi ve departman yapısını takip etmek için kullanılabilir. Her tablo, ilgili bilgileri saklamak için kullanılır ve ilişkilendirilmiş anahtarlarla birbirine bağlanabilir.

![alt text](https://github.com/metincanayar/SQL/blob/main/HR%20Database/HR%20Data%20Model.jpeg)
