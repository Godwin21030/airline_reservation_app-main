class PopularFlight {
  String img;
  String destination;
  PopularFlight({required this.img, required this.destination});
}

List<PopularFlight> popularFlights = [
  PopularFlight(img: 'assets/images/mexico.jpg', destination: 'MEXICO'),
  PopularFlight(img: 'assets/images/spain.jpg', destination: 'SPAIN'),
  PopularFlight(img: 'assets/images/berlin.jpg', destination: 'BERLIN'),
];

class City {
  City({
    required this.label,
    required this.iataCode,
    required this.value,
  });
  String? label;
  String? iataCode;
  String? value;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      label: json["address"]["cityName"] +
          " - " +
          json["name"] +
          " - " +
          json["iataCode"],
      iataCode: json["iataCode"],
      value: json['iataCode'],
    );
  }
}
