import 'dart:async';

import 'package:airline_reservation_app/models/flight.dart';
import 'package:airline_reservation_app/models/ticket.dart';
import 'package:airline_reservation_app/utils/constants.dart';
import 'package:airline_reservation_app/utils/network.dart';
import 'package:flutter/cupertino.dart';

class TicketProvider extends ChangeNotifier {
  final String flightOfferUrl =
      '${AirlineConfig.instance!.values.baseDomain}date';
  final String searchCityUrl =
      '${AirlineConfig.instance!.values.baseDomain}citysearch';
  final String flightPriceUrl =
      '${AirlineConfig.instance!.values.baseDomain}flightprice';
  final String flightCreateOrderUrl =
      '${AirlineConfig.instance!.values.baseDomain}flightorder';

  final NetworkUtil _networkUtil = NetworkUtil();

  Future<List> searchCity(String keyword) async {
    List airportList = [];
    await _networkUtil.postReq(searchCityUrl, body: {
      'keywords': keyword,
    }).then((value) {
      List city = value['data'];
      airportList = city.map((data) {
        return City.fromJson(data);
      }).toList();
    });
    return airportList;
  }

  Future<List<Map<String, dynamic>>> flightOffer(
      {String? departure,
      String? locationDeparture,
      String? locationArrival,
      String? adults,
      String? children}) async {
    List<Map<String, dynamic>> tickets = [];

    await _networkUtil.postReq(flightOfferUrl, body: {
      'departure': departure,
      'locationDeparture': locationDeparture
          .toString()
          .substring(locationDeparture.toString().length - 3)
          .trim(),
      'locationArrival': locationArrival
          .toString()
          .substring(locationArrival.toString().length - 3)
          .trim(),
      'adults': adults,
      'children': children
    }).then((value) {
      List<dynamic> tick = value['data'] ?? [];
      tickets = tick
          .map((data) => {'data': data, 'ticket': Ticket.fromJson(data)})
          .toList();
  
    });

    return tickets;
  }

  Future<TicketDetail> flightPrice(Map<String, dynamic> data) async {
    TicketDetail? ticket;
    await _networkUtil.postReq(flightPriceUrl, body: {
      'inputFlight': [data],
    }).then((value) {
      ticket = TicketDetail.fromJson(value['data']);

    });
    return ticket!;
  }

  Future createFlightOrder(Map<String, dynamic> data) async {
    Map<String, dynamic> body = {
      "inputFlightCreateOrder": data,
      "dob": "2000-09-25",
      "gender": "MALE",
      "email": "nathanormanel1@gmail.com",
      "callCode": "+233",
      "phone": "540209195",
      "fname": "Opoku",
      "lname": "Eric"
    };
    await _networkUtil.postReq(flightCreateOrderUrl, body: body).then((value) {
      print('Value: $value');
    });
  }
}
