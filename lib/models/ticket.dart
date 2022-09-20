class Ticket {
  Ticket({
    this.lastTicketingDate,
    this.cabin,
    this.departure,
    this.arrival,
    this.validatingAirlineCodes,
    this.aircraft,
    this.arrivalTime,
    this.departureTime,
    this.price,
  });
  final String? lastTicketingDate;
  final String? cabin;
  final String? departure;
  final String? arrival;
  final String? departureTime;
  final String? arrivalTime;
  final String? price;
  final String? validatingAirlineCodes;
  final String? aircraft;

  factory Ticket.fromJson(Map<String, dynamic> json) {
    final int len = json['itineraries'][0]['segments'].length - 1;
    return Ticket(
      lastTicketingDate: json['lastTicketingDate'],
      cabin: json['travelerPricings'][0]['fareDetailsBySegment'][0]['cabin'],
      departure: json['itineraries'][0]['segments'][0]['departure']['iataCode'],
      arrival: json['itineraries'][0]['segments'][len]['arrival']['iataCode'],
      validatingAirlineCodes: json['validatingAirlineCodes'][0],
      aircraft: json['itineraries'][0]['segments'][0]['aircraft']['code'],
      arrivalTime: json['itineraries'][0]['segments'][len]['arrival']['at'],
      departureTime: json['itineraries'][0]['segments'][0]['departure']['at'],
      price: json['price']['total'],
    );
  }
}

class TicketDetail {
  TicketDetail({
    this.departureDate,
    this.cabin,
    this.departure,
    this.arrival,
    this.validatingAirlineCodes,
    this.aircraft,
    this.arrivalTime,
    this.departureTime,
    this.price,
    this.terminal,
  });
  final String? departureDate;
  final String? cabin;
  final String? departure;
  final String? arrival;
  final String? departureTime;
  final String? arrivalTime;
  final String? price;
  final String? validatingAirlineCodes;
  final String? aircraft;
  final String? terminal;

  factory TicketDetail.fromJson(Map<String, dynamic> json) {
    final int len =
        json['flightOffers'][0]['itineraries'][0]['segments'].length - 1;
    return TicketDetail(
      departureDate: json['flightOffers'][0]['itineraries'][0]['segments'][0]
          ['departure']['at'],
      cabin: json['flightOffers'][0]['travelerPricings'][0]
          ['fareDetailsBySegment'][0]['cabin'],
      departure: json['flightOffers'][0]['itineraries'][0]['segments'][0]
          ['departure']['iataCode'],
      arrival: json['flightOffers'][0]['itineraries'][0]['segments'][len]
          ['arrival']['iataCode'],
      validatingAirlineCodes: json['flightOffers'][0]['validatingAirlineCodes']
          [0],
      aircraft: json['flightOffers'][0]['itineraries'][0]['segments'][0]
          ['aircraft']['code'],
      arrivalTime: json['flightOffers'][0]['itineraries'][0]['segments'][len]
          ['arrival']['at'],
      departureTime: json['flightOffers'][0]['itineraries'][0]['segments'][0]
          ['departure']['at'],
      price: json['flightOffers'][0]['price']['total'],
      terminal: json['flightOffers'][0]['itineraries'][0]['segments'][0]
          ['departure']['terminal']
    );
  }
}
