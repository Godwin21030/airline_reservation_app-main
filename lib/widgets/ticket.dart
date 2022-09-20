import 'package:airline_reservation_app/screens/ticket_details.dart';
import 'package:airline_reservation_app/widgets/dashed_ticket_separator.dart';
import 'package:airline_reservation_app/models/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key, required this.data, required this.json});

  final Ticket data;
  final Map<String, dynamic> json;
  // Ticket Header
  Widget _buildHeader() => Container(
        margin: const EdgeInsets.only(top: 20, left: 44, right: 44, bottom: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            data.lastTicketingDate.toString(),
            style: const TextStyle(color: Colors.black54),
          ),
          Text(
            data.cabin.toString(),
            style: const TextStyle(color: Colors.black54),
          ),
        ]),
      );

  // Ticket Body
  Widget _buildContent() => Expanded(
          child: Column(children: [
        Text(
          data.aircraft.toString(),
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
        )
      ]));

  Widget _buildButton(context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Theme.of(context).primaryColor.withOpacity(.9)),
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EUR ${data.price}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => TicketDetails(data: json)));
                  },
                  child: Row(
                    children: const [
                      Text(
                        'Order',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  )),
            ],
          ),
        ),
      );

  // Build Method
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.8,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const DashedTicketSeparator(),
          _buildContent(),
          _buildButton(context),
        ],
      ),
    );
  }
}
