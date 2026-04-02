class GoogleOffice {
  final String id;
  final String address;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String region;

  GoogleOffice({
    required this.id,
    required this.address,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.region,
  });

  @override
  String toString() {
    return 'GoogleOffice(id: $id, address: $address, image: $image, lat: $lat, lng: $lng, name: $name, phone: $phone, region: $region)';
  }
}

final List<GoogleOffice> listOfGoogleOffice = [
  GoogleOffice(
    address: "Aabogade 15, 8200 Aarhus, Denmark",
    id: "aarhus",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/de/8f/0e91481f467eb95db4fe2b355b3e/dk-aar-son.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: 56.172249,
    lng: 10.187372,
    name: "Aarhus",
    phone: "+45 1 2345 6789",
    region: "europe",
  ),
  GoogleOffice(
    address: "2300 Traverwood Dr., Ann Arbor, MI 48105, United States",
    id: "ann-arbor",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/6a/2f/647a785840dc8422b5fffc172b5d/us-arb-trav.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: 42.3063848,
    lng: -83.7140833,
    name: "Ann Arbor",
    phone: "+1 734-332-6500",
    region: "north-america",
  ),
  GoogleOffice(
    address:
        "Pacific Century Place Tower Level 45 SCBD Lot 10, Jl. Jend. Sudirman No.53, RT.5/RW.3, Senayan, Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12190, Indonesia",
    id: "jakarta",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/47/64/24c98889401baade503c19d4e6c6/id-cgk-pcp.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: -6.227664,
    lng: 106.808471,
    name: "Jakarta",
    phone: "+62 81-2345-6789",
    region: "asia-pacific",
  ),
  GoogleOffice(
    address:
        "No. 3, RMZ Infinity - Tower E, Old Madras Road, 4th and 5th Floors, Bangalore, 560 016, India",
    id: "bangalore",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/45/d4/b13d4c7048dba19be3c3613f00c8/in-blr-rmz.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: 12.99332,
    lng: 77.660176,
    name: "Bangalore",
    phone: "+91-80-67218000",
    region: "asia-pacific",
  ),
  GoogleOffice(
    address:
        "Boulevard Corporate Tower, Av. dos Andradas, 3000 - Andares 14-17, Santa Efigênia, Belo Horizonte, 30260-070, Brazil",
    id: "belo-horizonte",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/6e/98/a1ae8a784489b763de77a1d7e483/br-bhz-blv.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: -19.920225,
    lng: -43.920845,
    name: "Belo Horizonte",
    phone: "+55-31-2128-6800",
    region: "latin-america",
  ),
  GoogleOffice(
    address: "Tucholskystraße 2, 10117 Berlin, Germany",
    id: "berlin",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/00/ed/f9b1654f47f2bf6df43074895736/de-ber-tsky2.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: 52.5231079,
    lng: 13.39203120000002,
    name: "Berlin",
    phone: "+49 30 303986300",
    region: "europe",
  ),
  GoogleOffice(
    address:
        "Alicia M. De Justo 350, 2nd Floor, Buenos Aires, C1107AAH, Argentina",
    id: "buenos-aires",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/47/c8/25d2a5c64bc4b9af20a3494746f1/ar-bue-ali.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: -34.602734,
    lng: -58.366992,
    name: "Buenos Aires",
    phone: "+54-11-5530-3000",
    region: "latin-america",
  ),
  GoogleOffice(
    address: "TECOM Zone, Dubai Internet City, Dubai, United Arab Emirates",
    id: "dubai",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/ad/fc/999e7797498db18e4e5b2fc54941/ae-dxb-hub2.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: 25.0929,
    lng: 55.1591,
    name: "Dubai",
    phone: "+971 4 4509500",
    region: "africa-middle-east",
  ),
  GoogleOffice(
    address: "Gordon House, Barrow St, Dublin 4, Ireland",
    id: "dublin",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/50/8f/dfb70b5e46659e2fd6f0423b6769/ie-dub-gor.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: 53.3399526,
    lng: -6.2360967,
    name: "Dublin",
    phone: "+353 1 9876 5432",
    region: "europe",
  ),
  GoogleOffice(
    address: "803 11th Avenue, Sunnyvale, CA 94089, United States",
    id: "sunnyvale",
    image:
        "https://www.gstatic.com/marketing-cms/assets/images/35/42/a9f33b784e0a94a4e2272aa04a98/us-svl-mp6.jpg=s552-fcrop64=1,00003811ffffc7ef-rw",
    lat: 37.403694,
    lng: -122.031583,
    name: "Sunnyvale",
    phone: "+408 1 2345 6789",
    region: "north-america",
  ),
];
