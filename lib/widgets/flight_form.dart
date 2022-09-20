import 'package:airline_reservation_app/providers/bookings.dart';
import 'package:airline_reservation_app/screens/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:textfield_search/textfield_search.dart';

class FlightForm extends StatefulWidget {
  const FlightForm({super.key});
  @override
  State<StatefulWidget> createState() => _FlightFormState();
}

class _FlightFormState extends State<FlightForm> {
  final TextEditingController _departureDate = TextEditingController();
  final TextEditingController _arrivalLocation = TextEditingController();
  final TextEditingController _departureLocation = TextEditingController();
  final TextEditingController _noOfAdults = TextEditingController();
  final TextEditingController _noOfChildren = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _departureLocation.dispose();
    _departureDate.dispose();
    _arrivalLocation.dispose();
    _noOfAdults.dispose();
    _noOfChildren.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFieldSearch(
            decoration: InputDecoration(
              hintText: 'Departure Location',
              prefixIcon: const Icon(
                Icons.my_location,
                size: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 2, color: Colors.blueGrey.shade200),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.blue.withOpacity(.8)),
              ),
            ),
            label: 'airport search',
            controller: _departureLocation,
            future: () {
              return context
                  .read<TicketProvider>()
                  .searchCity(_departureLocation.text);
            },
            getSelectedValue: (value) {
              print(value.toString());
            },
          ),
          const SizedBox(height: 16),
          TextFieldSearch(
            itemsInView: 5,
            decoration: InputDecoration(
              hintText: 'Arrival Location',
              prefixIcon: const Icon(
                Icons.location_pin,
                size: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 2, color: Colors.blueGrey.shade200),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.blue.withOpacity(.8)),
              ),
            ),
            label: 'airport search',
            controller: _arrivalLocation,
            future: () {
              return context
                  .read<TicketProvider>()
                  .searchCity(_arrivalLocation.text);
            },
            getSelectedValue: (value) {
              print(value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            validator: (value) {
              if (value.toString().isEmpty) {
                return "Enter the date";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.datetime,
            controller: _departureDate,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                String formatedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  _departureDate.text = formatedDate;
                });
              } else {
                debugPrint('No date selected!');
              }
            },
            readOnly: true,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: 'Departure',
              prefixIcon: const Icon(
                Icons.calendar_month,
                size: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 2, color: Colors.blueGrey.shade200),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.blue.withOpacity(.8)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Enter the number of adults";
                    } else {
                      return null;
                    }
                  },
                  controller: _noOfAdults,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'No of Adults',
                    prefixIcon: const Icon(
                      Icons.man,
                      size: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blueGrey.shade200),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1, color: Colors.blue.withOpacity(.8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Enter the number of children";
                    } else {
                      return null;
                    }
                  },
                  controller: _noOfChildren,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'No of children',
                    prefixIcon: const Icon(
                      Icons.child_care,
                      size: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blueGrey.shade200),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1, color: Colors.blue.withOpacity(.8)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
              height: 45,
              margin: const EdgeInsets.symmetric(vertical: 25),
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Search For Flight',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  if (_arrivalLocation.text.isNotEmpty &&
                      _departureLocation.text.isNotEmpty &&
                      _departureDate.text.isNotEmpty &&
                      _noOfAdults.text.isNotEmpty &&
                      _noOfChildren.text.isNotEmpty) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => TicketsPage(
                                  departure: _departureDate.text,
                                  locationArrival: _arrivalLocation.text,
                                  locationDeparture: _departureLocation.text,
                                  adults: _noOfAdults.text,
                                  children: _noOfChildren.text,
                                )));
                  }
                },
              )),
        ],
      ),
    );
  }
}
