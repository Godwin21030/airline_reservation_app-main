import 'package:airline_reservation_app/models/ticket.dart';
import 'package:airline_reservation_app/providers/bookings.dart';
import 'package:airline_reservation_app/widgets/dashed_ticket_separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  late Future<TicketDetail> futureTicket;
  @override
  void initState() {
    super.initState();
    futureTicket = context.read<TicketProvider>().flightPrice(widget.data);
  }

  Widget _buildTicketHeader(TicketDetail data) => Container(
        margin: const EdgeInsets.only(top: 20, left: 44, right: 44, bottom: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: const [
              Text(
                'Passenger',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(
                height: 2,
              ),
              Text('Nathan Nunana')
            ],
          ),
          Column(
            children: const [
              Text(
                'Airline',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(
                height: 2,
              ),
              Text('Kotoka Airport')
            ],
          ),
        ]),
      );

  Widget _buildTicketDateTimeWidget(TicketDetail data) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.07),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Date'),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.calendar,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data.departureDate.toString().substring(0, 10),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.07),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Time'),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.clock,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          data.departureTime.toString().substring(11),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      );
  Widget _buildTicketFlightDetails(TicketDetail data) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 33, vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Terminal',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        data.terminal.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: const [
                  //     Text(
                  //       'Seat',
                  //       style: TextStyle(color: Colors.black54),
                  //     ),
                  //     SizedBox(
                  //       height: 3,
                  //     ),
                  //     Text(
                  //       '10B',
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Flight No',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '${data.validatingAirlineCodes} ${data.aircraft}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Class',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '${data.cabin}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Image.asset('assets/images/barcode.png')
          ],
        ),
      );

  Widget _buildTicketContent(TicketDetail data) => Expanded(
          child: Column(children: [
        Text(
          '${data.validatingAirlineCodes} ${data.aircraft}',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    data.departure.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.departureTime.toString().substring(11),
                    style: const TextStyle(color: Colors.black54),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                  child: Divider(
                color: Colors.black54,
                thickness: .5,
              )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.airplane,
                  size: 18,
                  color: Colors.black45,
                ),
              ),
              const Expanded(
                  child: Divider(
                color: Colors.black54,
                thickness: .5,
              )),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    data.arrival.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.arrivalTime.toString().substring(11),
                    style: const TextStyle(color: Colors.black54),
                  )
                ],
              )
            ],
          ),
        ),
        _buildTicketDateTimeWidget(data),
        const DashedTicketSeparator(),
        _buildTicketFlightDetails(data)
      ]));

  Widget _buildTicketDownloadButton() => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Theme.of(context).primaryColor.withOpacity(.9)),
        child: TextButton(
          child: const Text(
            'Book Flight',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // print('Data: ${widget.data}');
            // Navigator.push(context, CupertinoPageRoute(builder: (_)=>));
            context.read<TicketProvider>().createFlightOrder(widget.data);
          },
        ),
      );

  Widget _buildTicketDetails(TicketDetail data) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildTicketHeader(data),
                const DashedTicketSeparator(),
                _buildTicketContent(data),
                _buildTicketDownloadButton(),
              ],
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Note:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                """Please be at the airport an hour and a half before your flight time.Carry a valid ID and make sure your passport and other documents relating to your border crossing are valid""",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    letterSpacing: 1),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor.withOpacity(.1)),
          child: TextButton(
            child: const Text('See All the Rules and Instructions',
                style: TextStyle(color: Color.fromARGB(190, 102, 122, 235))),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ticket Details'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return _buildTicketDetails(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          future: futureTicket,
        ));
  }
}
