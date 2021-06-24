class Book {
  String title;
  String writer;
  String image;
  String description;
  String url;
  int pages;
  double rating;

  Book({
    this.title,
    this.writer,
    this.image,
    this.description,
    this.pages,
    this.url,
    this.rating,
  });
}

final List<Book> books = [
  Book(
      title: 'Harry Potter ve Felsefe Taşı',
      writer: 'J.K. Rowling',
      image: 'assets/images/hp1.jpg',
      url: "hp1.pdf",
      description:
          "Bir gün Harry ve arkadaşları okulda girilmesi yasak olan üçüncü koridora giderler. Burada üç başlı bir canavarın koruduğu “Felsefe Taşı” bulunmaktadır. Felsefe Taşı sahibine ölümsüzlük ve üstün güçler vermektedir. Harry'nin anne ve babasını öldüren kötü büyücü Voldemort da Felsefe Taşının peşindedir.",
      pages: 371,
      rating: 4.48),
  Book(
      title: 'Harry Potter ve Sırlar Odası',
      writer: 'J.K. Rowling',
      image: 'assets/images/hp2.jpg',
      url: "hp2.pdf",
      description:
          "'Bir komplo var, Harry Potter. Bu yıl Hogwarts Cadılık ve Büyücülük Okulu'nda dehşet verici şeyler yapmak için bir komplo.' Dursley'ler o yaz öylesine çekilmez olmuşlardır ki, Harry bir an önce okulu Hogwarts'a geri dönmek için can atmaktadır.",
      pages: 418,
      rating: 4.43),
  Book(
      title: 'Harry Potter ve Azkaban Tutsağı',
      writer: 'J.K. Rowling',
      image: 'assets/images/hp3.jpg',
      url: "hp3.pdf",
      description:
          "Sirius Black adında azılı bir katil, tüyler ürpertici Azkaban kalesinde tam on iki yıl boyunca tutsak kalmıştır. Tek lanetle on üç kişiyi birden öldüren Black'in, Karanlık Lord Voldemort'un hizmetkârı olduğuna kesin gözüyle bakılmaktadır. Bir yolunu bulup Azkaban'dan kaçan Black'in peşinde olduğu bir tek kişi vardır: Harry Potter. Harry, büyücülük okulunun sihirli duvarları arasındayken, arkadaşları ve öğretmenleriyle birlikteyken bile güvende değildir. Çünkü aralarında bir hain olabilir.",
      pages: 533,
      rating: 4.57),
  Book(
      title: 'Harry Potter ve Ateş Kadehi',
      writer: 'J.K. Rowling',
      image: 'assets/images/hp4.jpg',
      url: "hp4.pdf",
      description:
          "Harry Potter dizisinin dördüncü kitabı Harry Potter ve Ateş Kadehi, Hogwarts Cadılık ve Büyücülük Okulu'nda dördüncü sınıfa geçen Harry'nin başından geçenleri konu alıyor."
          "Yaz tatilinde yanlarında kaldığı Dursley'lerden bir an önce kurtulmak isteyen Harry, bir yolunu bulup arkadaşlarıyla birlikte Quidditch Dünya Kupası finalini izlemeye gidiyor. Bu yıl okuldaki en büyük yenilik ise Üçbüyücü Turnuvası. Hogwarts'ın yanı sıra iki rakip büyücülük okulunun katılımıyla gerçekleşen bu etkinlik, yüz yıldan beri ilk kez düzenleniyor."
          "Büyücülük dünyasında her şey her zaman olduğu gibi heyecanla, sürükleyici ve şaşırtıcı. Ancak Harry'nin alnındaki yara izinin ikide bir acıması, korkunç bir olayın yaklaşmakta olduğunun habercisi.",
      pages: 912,
      rating: 4.56),
  Book(
      title: 'Harry Potter ve Zümrüdüanka Yoldaşlığı',
      writer: 'J.K. Rowling',
      image: 'assets/images/hp5.jpg',
      url: "hp5.pdf",
      description:
          "Hogwarts Cadılık ve Büyücülük Okulu'ndaki beşinci yılında Harry, hayatını cehenneme çeviren sihirli/sihirsiz pek çok şeyle başa çıkmak zorunda: Yaz tatilini yanlarında harcadığı aptal akrabaları; ergenlik çağının isyanları, heyecanları, korkuları; onun gösteriş düşkünü bir yalancı olduğunu düşünenler; okulun işleyişine burnunu sokan Sihir Bakanlığı; öncekileri mumla aratan yeni bir Karanlık Sanatlara Karşı Savunma öğretmeni; yine karşı karşıya geldiği Ruh Emici'ler ve Ölüm Yiyen'ler; varlığını her zamankinden çok hissettiren Voldemort; ağır dersler, zor sınavlar, acımasız cezalar; sürekli yinelenen bir kabus ve acıyan yara izi; ona en yakın insanlardan birinin ölümü; beş yıl gecikmeyle öğrendiği bir gerçek...",
      pages: 1230,
      rating: 4.5),
  Book(
      title: 'Harry Potter ve Melez Prens',
      writer: 'J.K. Rowling',
      image: 'assets/images/hp6.jpg',
      url: "hp6.pdf",
      description:
          "Kitapta, Lord Voldemort Draco Malfoy'u Albus Dumbledore'u öldürmekle görevlendirmiştir. Eğer Draco beceremezse bunu Snape yapacaktır; bunu kendi evinde, Bellatrix'in yaptığı bozulmaz yeminde söylemektedir. Draco, ailesinin geçmişini öğrenir; babasının bir Ölüm Yiyen olduğunu, Voldemort'un en sadık yandaşlarından biri olduğunu ve bu görevin ailesinde soydan gelen bir gelenek olduğunu öğrenir. Harry, Melez Prens yardımı ile bir ödül olarak kazandığıFelix Felicis, (Sıvı Şans), adlı iksiri içer ve Slughorn'dan hortkuluklar hakkındaki anısını alır. Harry, kitabın sonuna doğru Dumbledore ile bir mağaraya gider ve Dumbledore içtiği iksir yüzünden zayıf düşer. Okula döndüklerinde üzerinde Kranlık İşareti gördükleri için Astronomi kulesine giderler. Orada Dumbledore Harry'i dondurur ve o anda da Draco Malfoy Dumbledore'un asasını uçurur. Diğer Ölüm Yiyenler de okula gelir ve Draco'yu, Dumbledor'u öldürmesi konusunda kışkırtırlar. O anda Snape gelir ve Kadavra Laneti ile Dumbledore'u öldürür. Melez Prens ise aslında Snape'tir.",
      pages: 1487,
      rating: 4.57),
  Book(
      title: 'Harry Potter ve Ölüm Yadigarları',
      writer: 'J.K. Rowling',
      image: 'assets/images/hp7.jpg',
      url: "hp7.pdf",
      description:
          "Sihir dünyası savaşta! Karanlık Lord iyice güç kazanırken iyiler de boş durmuyor. Yedinci yılında Hogwarts Cadılık ve Büyücülük Okulu\'na dönmeyen Harry Potter, Dumbledore\'un ona bıraktığı görevi tamamlamaya çalışıyor. Yanında -her zamanki gibi- Ron ve Hermione\'yle, bir yandan Voldemort\'tan ve onun Ölüm Yiyen\'lerinden kaçarken bir yandan da Hortkuluklar\'ı yok etmek, Ölüm Yadigârları\'nın sırrını keşfetmek zorunda olan Harry kendi geçmişiyle ilgili de pek çok şey öğreniyor.",
      rating: 4.62),
  Book(
      title: 'Olasılıksız',
      writer: 'Adam Fawer',
      image: 'assets/images/olasiliksiz.png',
      url: "olasiliksiz.pdf",
      description:
          "Kitap, David Caine'in bir takım deneysel tedaviler sonucunda kazandığı gelişmiş olasılıkları hesaplama yeteneği sayesinde, tahminlerinin geleceği görmek haline geldiğini anlamasıyla başından geçenleri konu almaktadır.",
      pages: 239,
      rating: 4.12),
  Book(
      title: 'The Witcher Elflerin Kanı',
      writer: 'J.K. Rowling',
      image: 'assets/images/witcher.png',
      url: "witcher_elfler.pdf",
      description:
          "Yüzyıldan fazla bir süredir insanlar, cüceler ve elfler barış içinde yaşıyordu. Ancak zaman değişti. Barış sona erdi ve farklı ırklar tekrar savaşmaya başladı. Hem birbirlerine karşı hem de kendi aralarında. Cüceler hısımlarını öldürüyor, elfler de insanları ve insanlarla dostluk kuran elfleri. "
          "Bu çalkantılı çağda kâhinlerin beklediği bir çocuk doğar. Cintra Aslanı Kraliçe Calanthe’nin torunu Ciri’nin garip güçleri ve daha da garip bir kaderi vardır. Kehanetler onu “Alev” diye niteliyor, iyi veya kötü dünyayı değiştirecek kişi olarak. ",
      pages: 390,
      rating: 4.10),
];
