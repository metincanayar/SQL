--SQLHW1
--A�a��daki sorgu senaryolar�n� dvdrental �rnek veri taban� �zerinden ger�ekle�tiriniz.
--1- film tablosunda bulunan title ve description s�tunlar�ndaki verileri s�ralay�n�z.
SELECT title, description FROM film
--2- film tablosunda bulunan t�m s�tunlardaki verileri film uzunlu�u (length) 60 dan b�y�k VE 75 ten k���k olma ko�ullar�yla s�ralay�n�z.
SELECT * FROM film
WHERE length>60 AND length<75;
--3- film tablosunda bulunan t�m s�tunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma ko�ullar�yla s�ralay�n�z.
SELECT * FROM film
WHERE (rental_rate=0.99 AND replacement_cost=12.99) OR replacement_cost=28.99;
--4- customer tablosunda bulunan first_name s�tunundaki de�eri 'Mary' olan m��terinin last_name s�tunundaki de�eri nedir?
SELECT * FROM customer
WHERE first_name='Mary';
--5- film tablosundaki uzunlu�u(length) 50 ten b�y�k OLMAYIP ayn� zamanda rental_rate de�eri 2.99 veya 4.99 OLMAYAN verileri s�ralay�n�z.
SELECT * FROM film
WHERE NOT (length>50) AND NOT (rental_rate = 2.99 OR rental_rate= 4.99);

--SQLHW2
--1- film tablosunda bulunan t�m s�tunlardaki verileri replacement cost de�eri 12.99 dan b�y�k e�it ve 16.99 k���k olma ko�uluyla s�ralay�n�z ( BETWEEN - AND yap�s�n� kullan�n�z.)
SELECT * FROM film 
WHERE replacement_cost BETWEEN 12.99 AND 16.99 AND replacement_cost!=16.99 ;
--2-.actor tablosunda bulunan first_name ve last_name s�tunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' de�erleri olmas� ko�uluyla s�ralay�n�z. ( IN operat�r�n� kullan�n�z.)
SELECT first_name,last_name FROM actor 
WHERE first_name IN('Nick','Ed','Penelope');
--3-film tablosunda bulunan t�m s�tunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma ko�ullar�yla s�ralay�n�z. ( IN operat�r�n� kullan�n�z.)
SELECT * FROM film 
WHERE rental_rate IN(0.99,2.99,4.99) AND replacement_cost IN(12.99,15.99,28.99);

--SQLHW3
--1- country tablosunda bulunan country s�tunundaki �lke isimlerinden 'A' karakteri ile ba�lay�p 'a' karakteri ile sonlananlar� s�ralay�n�z
SELECT country FROM country WHERE country LIKE 'A%a';
--2- country tablosunda bulunan country s�tunundaki �lke isimlerinden en az 6 karakterden olu�an ve sonu 'n' karakteri ile sonlananlar� s�ralay�n�z.
SELECT country FROM country WHERE country LIKE '_____%n';
--3- film tablosunda bulunan title s�tunundaki film isimlerinden en az 4 adet b�y�k ya da k���k harf farketmesizin 'T' karakteri i�eren film isimlerini s�ralay�n�z.
SELECT title FROM film WHERE title ILIKE '%t%t%t%T%' OR title ILIKE 'T%T%T%T%';
--4- film tablosunda bulunan t�m s�tunlardaki verilerden title 'C' karakteri ile ba�layan ve uzunlu�u (length) 90 dan b�y�k olan ve rental_rate 2.99 olan verileri s�ralay�n�z.
SELECT title, length, rental_rate FROM film WHERE (title LIKE 'C%') AND (length > 90) AND (rental_rate = 2.99);

--SQLHW4
--1- film tablosunda bulunan replacement_cost s�tununda bulunan birbirinden farkl� de�erleri s�ralay�n�z.
SELECT DISTINCT replacement_cost FROM film;
--2- film tablosunda bulunan replacement_cost s�tununda birbirinden farkl� ka� tane veri vard�r?
SELECT COUNT(DISTINCT replacement_cost) from film;
--3- film tablosunda bulunan film isimlerinde (title) ka� tanesini T karakteri ile ba�lar ve ayn� zamanda rating 'G' ye e�ittir?
SELECT COUNT(title) FROM film
WHERE LIKE 'T%' AND rating = 'G';
--4- country tablosunda bulunan �lke isimlerinden (country) ka� tanesi 5 karakterden olu�maktad�r?
SELECT COUNT(country) FROM country
WHERE country LIKE '_____';
--5- city tablosundaki �ehir isimlerinin ka� tanesi 'R' veya r karakteri ile biter?
SELECT COUNT(*) FROM city
WHERE city ILIKE '%R'

--SQLHW5

--1- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi s�ralay�n�z.
SELECT title,length FROM film
WHERE title LIKE '%n'
ORDER BY length desc
LIMIT 5;
--2- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en k�sa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) s�ralay�n�z.
SELECT title,length FROM film
WHERE title LIKE '%n'
ORDER BY length
OFFSET 5
LIMIT 5;
--3- customer tablosunda bulunan last_name s�tununa g�re azalan yap�lan s�ralamada store_id 1 olmak ko�uluyla ilk 4 veriyi s�ralay�n�z.
SELECT last_name,store_id FROM customer
WHERE store_id = 1 
ORDER BY last_name DESC
LIMIT 4

--SQLHW6

--1- film tablosunda bulunan rental_rate s�tunundaki de�erlerin ortalamas� nedir?
SELECT ROUND(AVG(rental_rate),3) FROM film;
--2- film tablosunda bulunan filmlerden ka� tanesi 'C' karakteri ile ba�lar?
SELECT COUNT(title) FROM film
WHERE title LIKE 'C%';
--3- film tablosunda bulunan filmlerden rental_rate de�eri 0.99 a e�it olan en uzun (length) film ka� dakikad�r?
SELECT MAX(length) FROM film
WHERE rental_rate IN(0.99);
--4- film tablosunda bulunan filmlerin uzunlu�u 150 dakikadan b�y�k olanlar�na ait ka� farkl� replacement_cost de�eri vard�r?
SELECT COUNT(DISTRICT (replacement_cost)) FROM film
WHERE length > 150;

--SQLHW7

--1- film tablosunda bulunan filmleri rating de�erlerine g�re gruplay�n�z.
SELECT rating, COUNT(rating) FROM film
GROUP BY rating;
--2- film tablosunda bulunan filmleri replacement_cost s�tununa g�re gruplad���m�zda film say�s� 50 den fazla olan replacement_cost de�erini ve kar��l�k gelen film say�s�n� s�ralay�n�z.
SELECT replacement_cost,COUNT(*) FROM film
GROUP BY replacement_cost
HAVING COUNT(*)>50;
--3- customer tablosunda bulunan store_id de�erlerine kar��l�k gelen m��teri say�lar�n� nelerdir?
SELECT store_id, COUNT(customer) FROM customer
GROUP BY store_id;
--4- city tablosunda bulunan �ehir verilerini country_id s�tununa g�re grupland�rd�ktan sonra en fazla �ehir say�s� bar�nd�ran country_id bilgisini ve �ehir say�s�n� payla��n�z.
SELECT country_id, COUNT(city) FROM city
GROUP BY country_id
ORDER BY COUNT(city) DESC
LIMIT 1

--SQLHW8

--1- test veritaban�n�zda employee isimli s�tun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo olu�tural�m.
CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	birthday DATE,
	email VARCHAR(100)
);
--2- Olu�turdu�umuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
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
--3- S�tunlar�n her birine g�re di�er s�tunlar� g�ncelleyecek 5 adet UPDATE i�lemi yapal�m.
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
--4- S�tunlar�n her birine g�re ilgili sat�r� silecek 5 adet DELETE i�lemi yapal�m.
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

--1- city tablosu ile country tablosunda bulunan �ehir (city) ve �lke (country) isimlerini birlikte g�rebilece�imiz INNER JOIN sorgusunu yaz�n�z.
SELECT city, country FROM country
INNER JOIN city ON city.country_id = country.country_id;
--2- customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte g�rebilece�imiz INNER JOIN sorgusunu yaz�n�z.
SELECT payment_id, first_name, last_name FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id;
--3- customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte g�rebilece�imiz INNER JOIN sorgusunu yaz�n�z.
SELECT rental_id, first_name, last_name FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id;

--SQLHW10

--1- city tablosu ile country tablosunda bulunan �ehir (city) ve �lke (country) isimlerini birlikte g�rebilece�imiz LEFT JOIN sorgusunu yaz�n�z.
SELECT city.city,country.country FROM country
LEFT JOIN city ON city.country_id=country.country_id;
--2- customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte g�rebilece�imiz RIGHT JOIN sorgusunu yaz�n�z.
SELECT payment.payment_id,customer.first_name,customer.last_name FROM customer
RIGHT JOIN payment ON payment.customer_id=customer.customer_id;
--3- customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte g�rebilece�imiz FULL JOIN sorgusunu yaz�n�z.
SELECT customer.first_name,customer.last_name,rental.rental_id FROM customer
FULL JOIN rental ON rental.customer_id=customer.customer_id;

--SQLHW11

--1- actor ve customer tablolar�nda bulunan first_name s�tunlar� i�in t�m verileri s�ralayal�m.
(SELECT first_name FROM actor)
UNION
(SELECT first_name FROM customer)
--2- actor ve customer tablolar�nda bulunan first_name s�tunlar� i�in kesi�en verileri s�ralayal�m.
(SELECT first_name FROM actor)
INTERSECT
(SELECT first_name FROM customer)
--3- actor ve customer tablolar�nda bulunan first_name s�tunlar� i�in ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri s�ralayal�m.
(SELECT first_name FROM actor)
EXCEPT
(SELECT first_name FROM customer)
--4- �lk 3 sorguyu tekrar eden veriler i�in de yapal�m.
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


--1- film tablosunda film uzunlu�u length s�tununda g�sterilmektedir. Uzunlu�u ortalama film uzunlu�undan fazla ka� tane film vard�r?
SELECT COUNT(*) FROM film
WHERE length > (SELECT AVG(length) FROM film);
--2- film tablosunda en y�ksek rental_rate de�erine sahip ka� tane film vard�r?
SELECT COUNT(*) FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);
--3- film tablosunda en d���k rental_rate ve en d���n replacement_cost de�erlerine sahip filmleri s�ralay�n�z.
SELECT * FROM film
WHERE rental_rate = ANY
(
	SELECT MIN(rental_rate) FROM film
)
AND replacement_cost = ANY
(
	SELECT MIN(replacement_cost) FROM film
);
--4- payment tablosunda en fazla say�da al��veri� yapan m��terileri(customer) s�ralay�n�z.
SELECT customer.first_name, customer.last_name FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount =
(
    SELECT MAX(amount) FROM payment
);

--SQLRecap
--Bu �al��mamam�zda �imdiye kadar �zerine konu�tu�umuz t�m konular� 5 farkl� senaryo �zerinden tekrar etmeye �al��t�k. A�a��da ilgili senaryolar� bulabilirsiniz.

--1- film tablosundan 'K' karakteri ile ba�layan en uzun ve replacenet_cost u en d���k 4 filmi s�ralay�n�z.
SELECT title, length, replacement_cost FROM film
WHERE title LIKE 'K%'
ORDER BY length DESC, replacement_cost ASC
LIMIT 4;
--2- film tablosunda i�erisinden en fazla say�da film bulunduran rating kategorisi hangisidir?
SELECT rating, COUNT(*) FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC
LIMIT 1;
--3- cutomer tablosunda en �ok al��veri� yapan m��terinin ad� nedir?
SELECT first_name, last_name, SUM(amount) AS total_amount_of_spending FROM payment AS p
INNER JOIN customer AS c ON p.customer_id = c.customer_id
GROUP BY first_name, last_name, p.customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;
--4- category tablosundan kategori isimlerini ve kategori ba��na d��en film say�lar�n� s�ralay�n�z.
SELECT cat.name, COUNT(*) FROM category AS cat
INNER JOIN film_category AS fc ON fc.category_id = cat.category_id
GROUP BY fc.category_id, cat.name
--5- film tablosunda isminde en az 4 adet 'e' veya 'E' karakteri bulunan k� tane film vard�r?
SELECT COUNT(*) FROM film
WHERE title ILIKE '%e%e%e%e%';