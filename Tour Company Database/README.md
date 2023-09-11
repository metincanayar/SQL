# Tour Company Uygulaması

Bu doküman geliştirilecek Tour Company adlı uygulamanın analizini içermektedir. Projenin amacı turizm
sektöründe hizmet veren Tour Company isimli firmanın organizasyonunu yönetebilmesidir.
Tour Company isimli şirket, İstanbul’un çeşitli yerlerini rehberler eşliğinde turistlere gezdiren ve tanıtan
bir şirkettir. Düzenlediği turlar günübirlik turlardır.
Uygulama ile düzenlenen turlar belirlenecek, belirlenen turların satışı yapılabilecektir. Şirketle çalışan
rehberler de uygulama üzerinde tanımlanabilecektir.
- Uygulamayı sadece şirket yetkilisi kullanacaktır.
- Uygulama üzerinde tur şirketinin hizmet verdiği bölgeler tanımlanmalıdır. Şirket yetkilisi tur
tanımlaması yaparken gezilecek bölgeleri seçecektir.
- Şirket farklı kanallardan yaptığı satışları da uygulama üzerinden sisteme girecektir.
- Turlara katılacak turistlerin bilgileri girilecek ve ardından fatura oluşturulacaktır.
- Şirket tur satışını uygulamaya girerken çalıştığı rehberlerden birini seçecektir.


## Proje Açıklaması

Bu repo, "Tour Company" adlı bir turizm şirketinin organizasyonunu yönetebilmek amacıyla geliştirilen bir uygulamanın analizini içermektedir. Tour Company, İstanbul'da turistlere çeşitli bölgeleri rehberler eşliğinde gezdirip tanıtan bir şirkettir. Şirket, günübirlik turlar düzenlemektedir. Bu uygulama, şirket yetkilileri tarafından kullanılacaktır ve aşağıdaki temel özellikleri içermektedir:

- Tur tanımlama
- Tur satışı yapma
- Rehber tanımlama
- Fatura oluşturma
- Raporlar

## Kullanım Senaryoları

### Tur Tanımlama

- Şirket yetkilisi, uygulama üzerinden tur tanımlaması yapabilir.
- Tanımlanan turlar için gezilecek bölgeleri seçebilir.
- Tur ismi en fazla 150 karakter olabilir.
- Tur tanımlamak için önceden hizmet verilen bölgeleri sisteme girmelidir.
- Bölge adı en fazla 30 karakter olmalıdır.
- Turun ücreti, içerdiği bölgelerin ücretlerinin toplamını yansıtmalıdır.
- Şirket yetkilisi yeni bölgeler ekleyebilir, mevcut bölgeleri silebilir ve hizmet ücretlerini değiştirebilir.
- Satışı yapılmamış turlar üzerinde değişiklik yapabilir veya turu iptal edebilir.

### Tur Satışı Yapma

- Şirket yetkilisi, ilgili ekrandan tur satışlarını sisteme girmelidir.
- Satılan turu ve katılacak turistleri belirtmelidir.
- Turun gerçekleşeceği tarihi ve görevlendirilecek rehberi seçmelidir.
- Turisti/turistleri belirtirken ad, soyad, cinsiyet, doğum tarihi, uyruk ve geldiği ülke bilgilerini girmelidir.
- Ad en fazla 20, soyad ise en fazla 40 karakter olmalıdır.
- Eğer daha önce tur satın almış bir turistse, bilgileri tekrar girmemeli ve turisti sistemden bulup eklemelidir.

### Rehber Tanımlama

- Şirket, çalıştığı rehberlerin kaydını sistemde tutar.
- Şirket yetkilisi, rehber ekleyebilir, rehber bilgilerini düzenleyebilir ve çalışmayı sonlandırdığı rehberi sistemden kaldırabilir.
- Rehber eklerken ad, soyad, cinsiyet, telefon numarası bilgilerini girmelidir.
- Rehberler en az bir yabancı dil bilmelidir ve sisteme eklenirken bu bilgi de tanımlanmalıdır.
- Rehberler, hizmet verilen tüm bölgeler hakkında bilgi sahibi olmalıdır.
- Ad en fazla 20, soyadı ise en fazla 40 karakter olmalıdır.

### Fatura Oluşturma

- Satış yetkilisi, turların satışını sisteme girdikten sonra satın alan turistler için fatura oluşturur.
- Bir turist aynı anda birden fazla tur satın alabilir, bu nedenle her tur satışı birer fatura kalemi oluşturur.
- Fatura ücreti, içerdiği turların toplam ücretini yansıtmalıdır.
- 60 yaş üstü turistler için %15 indirim uygulanır.
- Satış yetkilisi, sistemde kayıtlı faturaları görüntüleyebilir.
- Fatura numarası, fatura kesilme tarihi, faturanın kesildiği turist ve toplam ücret bilgilerini içermelidir.

### Raporlar

1. En çok gezilen yer/yerler neresidir?
2. Ağustos ayında en çok çalışan rehber/rehberler kimdir/kimlerdir?
3. Kadın turistlerin gezdiği yerleri, toplam ziyaret edilme sayılarıyla beraber listeleyin
4. İngiltere’den gelip de Kız Kulesi’ni gezen turistler kimlerdir?
5. Gezilen yerler hangi yılda kaç defa gezilmiştir?
6. 2’den fazla tura rehberlik eden rehberlerin en çok tanıttıkları yerler nelerdir?
7. İtalyan turistler en çok nereyi gezmiştir?
8. Kapalı Çarşı’yı gezen en yaşlı turist kimdir?
9. Yunanistan’dan gelen Finlandiyalı turistin gezdiği yerler nerelerdir?
10. Dolmabahçe Sarayı’na en son giden turistler ve rehberi listeleyin.

## Database Data Modelling

![alt text](https://github.com/metincanayar/SQL/blob/main/Tour%20Company%20Database/TourCompany%20Data%20Model.jpeg)
