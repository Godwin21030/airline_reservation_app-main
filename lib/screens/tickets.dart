import 'package:airline_reservation_app/providers/bookings.dart';
import 'package:airline_reservation_app/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage(
      {super.key,
      this.arrival,
      this.departure,
      this.locationArrival,
      this.locationDeparture,
      this.adults,
      this.children});
  final String? arrival;
  final String? departure;
  final String? locationArrival;
  final String? locationDeparture;
  final String? adults;
  final String? children;

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  Future<List<Map<String, dynamic>>>? getTicket;
  @override
  void initState() {
    super.initState();
    getTicket = context.read<TicketProvider>().flightOffer.call(
          departure: widget.departure!.trim(),
          locationArrival: widget.locationArrival!.trim(),
          locationDeparture: widget.locationDeparture!.trim(),
          adults: widget.adults!.trim(),
          children: widget.children!.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('Ticket Offers'),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length < 1) {
              return const Center(
                child: Text(
                  "No Flight Offers Available",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) => TicketWidget(
                    data: snapshot.data[index]['ticket'],
                    json: snapshot.data[index]['data'],
                  )),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error... ${snapshot.error}"),
            );
          } else {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting results'),
                  )
                ]));
          }
        },
        future: getTicket,
      ),
    );
  }
}
