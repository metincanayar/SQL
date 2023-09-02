--SQLHW1
--Aþaðýdaki sorgu senaryolarýný dvdrental örnek veri tabaný üzerinden gerçekleþtiriniz.
--1- film tablosunda bulunan title ve description sütunlarýndaki verileri sýralayýnýz.
SELECT title, description FROM film
--2- film tablosunda bulunan tüm sütunlardaki verileri film uzunluðu (length) 60 dan büyük VE 75 ten küçük olma koþullarýyla sýralayýnýz.
SELECT * FROM film
WHERE length>60 AND length<75;
--3- film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koþullarýyla sýralayýnýz.
SELECT * FROM film
WHERE (rental_rate=0.99 AND replacement_cost=12.99) OR replacement_cost=28.99;
--4- customer tablosunda bulunan first_name sütunundaki deðeri 'Mary' olan müþterinin last_name sütunundaki deðeri nedir?
SELECT * FROM customer
WHERE first_name='Mary';
--5- film tablosundaki uzunluðu(length) 50 ten büyük OLMAYIP ayný zamanda rental_rate deðeri 2.99 veya 4.99 OLMAYAN verileri sýralayýnýz.
SELECT * FROM film
WHERE NOT (length>50) AND NOT (rental_rate = 2.99 OR rental_rate= 4.99);

--SQLHW2
--1- film tablosunda bulunan tüm sütunlardaki verileri replacement cost deðeri 12.99 dan büyük eþit ve 16.99 küçük olma koþuluyla sýralayýnýz ( BETWEEN - AND yapýsýný kullanýnýz.)
SELECT * FROM film 
WHERE replacement_cost BETWEEN 12.99 AND 16.99 AND replacement_cost!=16.99 ;
--2-.actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' deðerleri olmasý koþuluyla sýralayýnýz. ( IN operatörünü kullanýnýz.)
SELECT first_name,last_name FROM actor 
WHERE first_name IN('Nick','Ed','Penelope');
--3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koþullarýyla sýralayýnýz. ( IN operatörünü kullanýnýz.)
SELECT * FROM film 
WHERE rental_rate IN(0.99,2.99,4.99) AND replacement_cost IN(12.99,15.99,28.99);

--SQLHW3
--1- country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile baþlayýp 'a' karakteri ile sonlananlarý sýralayýnýz
SELECT country FROM country WHERE country LIKE 'A%a';
--2- country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluþan ve sonu 'n' karakteri ile sonlananlarý sýralayýnýz.
SELECT country FROM country WHERE country LIKE '_____%n';
--3- film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sýralayýnýz.
SELECT title FROM film WHERE title ILIKE '%t%t%t%T%' OR title ILIKE 'T%T%T%T%';
--4- film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile baþlayan ve uzunluðu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sýralayýnýz.
SELECT title, length, rental_rate FROM film WHERE (title LIKE 'C%') AND (length > 90) AND (rental_rate = 2.99);

--SQLHW4
--1- film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklý deðerleri sýralayýnýz.
SELECT DISTINCT replacement_cost FROM film;
--2- film tablosunda bulunan replacement_cost sütununda birbirinden farklý kaç tane veri vardýr?
SELECT COUNT(DISTINCT replacement_cost) from film;
--3- film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile baþlar ve ayný zamanda rating 'G' ye eþittir?
SELECT COUNT(title) FROM film
WHERE LIKE 'T%' AND rating = 'G';
--4- country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluþmaktadýr?
SELECT COUNT(country) FROM country
WHERE country LIKE '_____';
--5- city tablosundaki þehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
SELECT COUNT(*) FROM city
WHERE city ILIKE '%R'

--SQLHW5

--1- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sýralayýnýz.
SELECT title,length FROM film
WHERE title LIKE '%n'
ORDER BY length desc
LIMIT 5;
--2- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kýsa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sýralayýnýz.
SELECT title,length FROM film
WHERE title LIKE '%n'
ORDER BY length
OFFSET 5
LIMIT 5;
--3- customer tablosunda bulunan last_name sütununa göre azalan yapýlan sýralamada store_id 1 olmak koþuluyla ilk 4 veriyi sýralayýnýz.
SELECT last_name,store_id FROM customer
WHERE store_id = 1 
ORDER BY last_name DESC
LIMIT 4

--SQLHW6

--1- film tablosunda bulunan rental_rate sütunundaki deðerlerin ortalamasý nedir?
SELECT ROUND(AVG(rental_rate),3) FROM film;
--2- film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile baþlar?
SELECT COUNT(title) FROM film
WHERE title LIKE 'C%';
--3- film tablosunda bulunan filmlerden rental_rate deðeri 0.99 a eþit olan en uzun (length) film kaç dakikadýr?
SELECT MAX(length) FROM film
WHERE rental_rate IN(0.99);
--4- film tablosunda bulunan filmlerin uzunluðu 150 dakikadan büyük olanlarýna ait kaç farklý replacement_cost deðeri vardýr?
SELECT COUNT(DISTRICT (replacement_cost)) FROM film
WHERE length > 150;

--SQLHW7

--1- film tablosunda bulunan filmleri rating deðerlerine göre gruplayýnýz.
SELECT rating, COUNT(rating) FROM film
GROUP BY rating;
--2- film tablosunda bulunan filmleri replacement_cost sütununa göre grupladýðýmýzda film sayýsý 50 den fazla olan replacement_cost deðerini ve karþýlýk gelen film sayýsýný sýralayýnýz.
SELECT replacement_cost,COUNT(*) FROM film
GROUP BY replacement_cost
HAVING COUNT(*)>50;
--3- customer tablosunda bulunan store_id deðerlerine karþýlýk gelen müþteri sayýlarýný nelerdir?
SELECT store_id, COUNT(customer) FROM customer
GROUP BY store_id;
--4- city tablosunda bulunan þehir verilerini country_id sütununa göre gruplandýrdýktan sonra en fazla þehir sayýsý barýndýran country_id bilgisini ve þehir sayýsýný paylaþýnýz.
SELECT country_id, COUNT(city) FROM city
GROUP BY country_id
ORDER BY COUNT(city) DESC
LIMIT 1

--SQLHW8

--1- test veritabanýnýzda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluþturalým.
CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	birthday DATE,
	email VARCHAR(100)
);
--2- Oluþturduðumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
insert into employee (name, birthday, email) values ('Cecelia', '1956-01-16', 'cpiddington0@google.fr');
insert into employee (name, birthday, email) values ('Claudina', '1957-02-27', 'cmatuszyk1@telegraph.co.uk');
insert into employee (name, birthday, email) values ('Pauletta', '1970-12-23', 'pcatlette2@gizmodo.com');
insert into employee (name, birthday, email) values ('Crissy', '1981-07-02', 'cwicher3@cbslocal.com');
insert into employee (name, birthday, email) values ('Boniface', '1962-05-23', 'ballaway4@cmu.edu');
insert into employee (name, birthday, email) values ('Roosevelt', '1973-01-16', 'rblenkiron5@admin.ch');
insert into employee (name, birthday, email) values ('Lisabeth', '1960-09-03', 'lfolca6@hp.com');
insert into employee (name, birthday, email) values ('Alexina', '1960-11-16', 'adack7@phpbb.com');
insert into employee (name, birthday, email) values ('Phillida', '1993-12-26', 'pmusso8@abc.net.au');
insert into employee (name, birthday, email) values ('Layne', '1974-04-29', 'lvine9@webeden.co.uk');
insert into employee (name, birthday, email) values ('Cal', '1956-03-06', 'ccornillia@state.gov');
insert into employee (name, birthday, email) values ('Sianna', '1969-03-19', 'sbrotherhedb@weibo.com');
insert into employee (name, birthday, email) values ('Jay', null, null);
insert into employee (name, birthday, email) values ('Franciskus', '1958-03-08', 'fknathd@nps.gov');
insert into employee (name, birthday, email) values ('Barbabas', '1982-07-13', 'bdyersone@wufoo.com');
insert into employee (name, birthday, email) values ('Milly', '1987-08-25', 'mhambribef@mozilla.org');
insert into employee (name, birthday, email) values ('Lind', '1991-12-02', 'lnewittg@unc.edu');
insert into employee (name, birthday, email) values ('Issiah', '1995-01-07', 'ijoseh@reverbnation.com');
insert into employee (name, birthday, email) values ('Alberto', '1993-08-09', 'aantonioi@delicious.com');
insert into employee (name, birthday, email) values ('Benedikt', '1962-11-19', 'brawlinsonj@princeton.edu');
insert into employee (name, birthday, email) values ('Jens', '1983-01-21', 'jbeaumentk@elegantthemes.com');
insert into employee (name, birthday, email) values ('Tabina', '1977-07-17', 'tfairl@wiley.com');
insert into employee (name, birthday, email) values ('Alida', '1991-07-01', 'agiorgiettom@oakley.com');
insert into employee (name, birthday, email) values ('Hartwell', '1993-09-23', 'hhobbenn@slideshare.net');
insert into employee (name, birthday, email) values ('Allen', '1976-04-22', 'amonksfieldo@ovh.net');
insert into employee (name, birthday, email) values ('Creigh', '1976-05-28', 'cduckfieldp@dailymotion.com');
insert into employee (name, birthday, email) values ('Gideon', '1969-01-15', 'gmaddyq@163.com');
insert into employee (name, birthday, email) values ('Jakie', '1970-01-20', 'jremmerr@shinystat.com');
insert into employee (name, birthday, email) values ('Eunice', '1992-05-21', 'eswyers@arizona.edu');
insert into employee (name, birthday, email) values ('Josh', '1962-09-04', 'jleest@sakura.ne.jp');
insert into employee (name, birthday, email) values ('Paige', '1974-06-26', 'psilcoxu@patch.com');
insert into employee (name, birthday, email) values ('Issy', '1983-08-31', 'ijagielskiv@merriam-webster.com');
insert into employee (name, birthday, email) values ('Waylen', '1952-02-14', 'wtrusew@simplemachines.org');
insert into employee (name, birthday, email) values ('Jory', null, null);
insert into employee (name, birthday, email) values ('Joannes', '1979-01-09', 'jpowtery@nsw.gov.au');
insert into employee (name, birthday, email) values ('Allyce', '1990-02-12', 'aknevitz@altervista.org');
insert into employee (name, birthday, email) values ('Horton', '1990-11-02', 'hoaten10@facebook.com');
insert into employee (name, birthday, email) values ('Delila', '1961-11-21', 'dclewarth11@devhub.com');
insert into employee (name, birthday, email) values ('Bobine', '1995-08-30', 'bvonderempten12@europa.eu');
insert into employee (name, birthday, email) values ('Theodoric', '1966-01-24', 'tgammel13@newsvine.com');
insert into employee (name, birthday, email) values ('Rhys', '1977-03-31', 'rromney14@1und1.de');
insert into employee (name, birthday, email) values ('Boyce', '1989-03-13', 'bvater15@slate.com');
insert into employee (name, birthday, email) values ('Lorette', '1984-05-23', 'lcoxon16@vimeo.com');
insert into employee (name, birthday, email) values ('Bonny', '1960-07-27', 'bbasire17@feedburner.com');
insert into employee (name, birthday, email) values ('Hersh', '1980-02-03', 'hstafford18@sciencedirect.com');
insert into employee (name, birthday, email) values ('Ashlie', '1952-03-30', 'agoldhawk19@yellowpages.com');
insert into employee (name, birthday, email) values ('Chris', '1981-02-22', 'ccampaigne1a@google.co.uk');
insert into employee (name, birthday, email) values ('Bary', '1955-12-23', 'bcaplan1b@china.com.cn');
insert into employee (name, birthday, email) values ('Mandy', '1969-08-21', 'mknutton1c@springer.com');
insert into employee (name, birthday, email) values ('Ezri', '1958-06-04', 'etrue1d@sakura.ne.jp');
--3- Sütunlarýn her birine göre diðer sütunlarý güncelleyecek 5 adet UPDATE iþlemi yapalým.
UPDATE employee
SET name = 'M___'
WHERE name LIKE 'M%'
RETURNING *;

UPDATE employee
SET email = null
WHERE name = 'M___'
RETURNING *;

UPDATE employee
SET birthday = '1983-01-21'
WHERE name = 'M___'
RETURNING *;

UPDATE employee
SET name = 'Metin'
WHERE name = 'M___'
RETURNING *;

UPDATE employee
SET birthday = '1960-07-27'
WHERE name = 'Bary'
RETURNING *;
--4- Sütunlarýn her birine göre ilgili satýrý silecek 5 adet DELETE iþlemi yapalým.
DELETE FROM employee
WHERE email LIKE 'm%'
RETURNING *;

DELETE FROM employee
WHERE employee_id >39
RETURNING *;

DELETE FROM employee
WHERE name = 'Metin';

DELETE FROM employee
WHERE name LIKE '%D'
RETURNING *;

DELETE FROM employee
WHERE email ILIKE '%a%a'
RETURNING *;

--SQLHW9

--1- city tablosu ile country tablosunda bulunan þehir (city) ve ülke (country) isimlerini birlikte görebileceðimiz INNER JOIN sorgusunu yazýnýz.
SELECT city, country FROM country
INNER JOIN city ON city.country_id = country.country_id;
--2- customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceðimiz INNER JOIN sorgusunu yazýnýz.
SELECT payment_id, first_name, last_name FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id;
--3- customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceðimiz INNER JOIN sorgusunu yazýnýz.
SELECT rental_id, first_name, last_name FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id;

--SQLHW10

--1- city tablosu ile country tablosunda bulunan þehir (city) ve ülke (country) isimlerini birlikte görebileceðimiz LEFT JOIN sorgusunu yazýnýz.
SELECT city.city,country.country FROM country
LEFT JOIN city ON city.country_id=country.country_id;
--2- customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceðimiz RIGHT JOIN sorgusunu yazýnýz.
SELECT payment.payment_id,customer.first_name,customer.last_name FROM customer
RIGHT JOIN payment ON payment.customer_id=customer.customer_id;
--3- customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceðimiz FULL JOIN sorgusunu yazýnýz.
SELECT customer.first_name,customer.last_name,rental.rental_id FROM customer
FULL JOIN rental ON rental.customer_id=customer.customer_id;

--SQLHW11

--1- actor ve customer tablolarýnda bulunan first_name sütunlarý için tüm verileri sýralayalým.
(SELECT first_name FROM actor)
UNION
(SELECT first_name FROM customer)
--2- actor ve customer tablolarýnda bulunan first_name sütunlarý için kesiþen verileri sýralayalým.
(SELECT first_name FROM actor)
INTERSECT
(SELECT first_name FROM customer)
--3- actor ve customer tablolarýnda bulunan first_name sütunlarý için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sýralayalým.
(SELECT first_name FROM actor)
EXCEPT
(SELECT first_name FROM customer)
--4- Ýlk 3 sorguyu tekrar eden veriler için de yapalým.
--1--
(SELECT first_name FROM actor)
UNION ALL
(SELECT first_name FROM customer)
--2--
(SELECT first_name FROM actor)
INTERSECT ALL
(SELECT first_name FROM customer)
--3--
(SELECT first_name FROM actor)
EXCEPT ALL
(SELECT first_name FROM customer)

--SQLHW12


--1- film tablosunda film uzunluðu length sütununda gösterilmektedir. Uzunluðu ortalama film uzunluðundan fazla kaç tane film vardýr?
SELECT COUNT(*) FROM film
WHERE length > (SELECT AVG(length) FROM film);
--2- film tablosunda en yüksek rental_rate deðerine sahip kaç tane film vardýr?
SELECT COUNT(*) FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);
--3- film tablosunda en düþük rental_rate ve en düþün replacement_cost deðerlerine sahip filmleri sýralayýnýz.
SELECT * FROM film
WHERE rental_rate = ANY
(
	SELECT MIN(rental_rate) FROM film
)
AND replacement_cost = ANY
(
	SELECT MIN(replacement_cost) FROM film
);
--4- payment tablosunda en fazla sayýda alýþveriþ yapan müþterileri(customer) sýralayýnýz.
SELECT customer.first_name, customer.last_name FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount =
(
    SELECT MAX(amount) FROM payment
);

--SQLRecap
--Bu çalýþmamamýzda þimdiye kadar üzerine konuþtuðumuz tüm konularý 5 farklý senaryo üzerinden tekrar etmeye çalýþtýk. Aþaðýda ilgili senaryolarý bulabilirsiniz.

--1- film tablosundan 'K' karakteri ile baþlayan en uzun ve replacenet_cost u en düþük 4 filmi sýralayýnýz.
SELECT title, length, replacement_cost FROM film
WHERE title LIKE 'K%'
ORDER BY length DESC, replacement_cost ASC
LIMIT 4;
--2- film tablosunda içerisinden en fazla sayýda film bulunduran rating kategorisi hangisidir?
SELECT rating, COUNT(*) FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC
LIMIT 1;
--3- cutomer tablosunda en çok alýþveriþ yapan müþterinin adý nedir?
SELECT first_name, last_name, SUM(amount) AS total_amount_of_spending FROM payment AS p
INNER JOIN customer AS c ON p.customer_id = c.customer_id
GROUP BY first_name, last_name, p.customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;
--4- category tablosundan kategori isimlerini ve kategori baþýna düþen film sayýlarýný sýralayýnýz.
SELECT cat.name, COUNT(*) FROM category AS cat
INNER JOIN film_category AS fc ON fc.category_id = cat.category_id
GROUP BY fc.category_id, cat.name
--5- film tablosunda isminde en az 4 adet 'e' veya 'E' karakteri bulunan kç tane film vardýr?
SELECT COUNT(*) FROM film
WHERE title ILIKE '%e%e%e%e%';