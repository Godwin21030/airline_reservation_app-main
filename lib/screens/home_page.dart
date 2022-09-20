import 'package:airline_reservation_app/models/flight.dart';
import 'package:airline_reservation_app/screens/tickets.dart';
import 'package:airline_reservation_app/widgets/flight_form.dart';
import 'package:airline_reservation_app/widgets/popular_flight.dart';
import 'package:airline_reservation_app/widgets/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "4a07204f1a6e87071c3036797df24a552e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));

    AlanVoice.BUTTON_ALIGN_RIGHT.toInt() + 1;
  }

  int _currentIndex = 0;

  /// Tabs widgets
  List<Widget> screens = const [
    HomeTab(),
    TicketsTab(),
    ProfilesTab(),
  ];

  void _handleCommand(Map<String, dynamic> command) {
    String? departure;
    String? arrivalLoc;
    String? departureLoc;
    String? numberOfAdults;
    String? numberOfChildren;

    switch (command['command']) {
      case 'tickets':
        switchTabs(1);
        break;
      case 'profile':
        switchTabs(2);
        break;
      case 'Book-Flight':
        switchTabs(0);
        departure = command['date'].toString().split('T')[0];
        arrivalLoc = command['location'];
        departureLoc = "LON";
        numberOfAdults = command['adults'];
        numberOfChildren = command['children'];
        print(departureLoc);
        print(arrivalLoc);
        print(departure);
        print(numberOfChildren);
        print(numberOfAdults);
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: ((context) => TicketsPage(
                  departure: departure,
                  locationArrival: arrivalLoc,
                  locationDeparture: departureLoc,
                  adults: numberOfAdults,
                  children: numberOfChildren,
                )),
          ),
        );
        break;
      default:
        debugPrint('Unknown command');
    }
  }

  void switchTabs(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_currentIndex == 0)
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: const [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        CupertinoIcons.settings,
                        color: Colors.white,
                      ))
                ])
          : (_currentIndex == 1)
              ? AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    'My Tickets',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              : AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 0,
                  centerTitle: true,
                  title: const Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
      body: SafeArea(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        iconSize: 20,
        currentIndex: _currentIndex,
        onTap: (int index) => switchTabs(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ticket),
            label: "Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          )
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: ListView(
        children: [
          const FlightForm(),
          const Text(
            'Popular Flights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            'All flights are One-Way',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(
            height: 7,
          ),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: ((context, index) => PopularFlightWidget(
                  img: popularFlights[index].img,
                  destination: popularFlights[index].destination,
                )),
            itemCount: popularFlights.length,
          )
        ],
      ),
    );
  }
}

class TicketsTab extends StatelessWidget {
  const TicketsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        // TicketWidget(),
        // TicketWidget(),
        // TicketWidget(),
      ],
    );
  }
}

class ProfilesTab extends StatelessWidget {
  const ProfilesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Colors.blue,
                          Theme.of(context).primaryColor
                        ])),
                    child: Image.asset(
                      'assets/images/mexico.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.transparent, Colors.black54])),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: Transform.translate(
                  offset: const Offset(0, 40),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: const AssetImage('assets/images/user.jpg'),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Eric Opoku',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                        child: Text(".",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Text('@erik01'),
                      SizedBox(
                        height: 10,
                      ),
                      // Text('A very short profile description about the user')
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "erikopoku1@gmail.com",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Column(children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                // ignore: sort_child_properties_last
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: const Text(
                    "CONTENT",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38),
                  ),
                ),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 232, 232)),
                margin: const EdgeInsets.only(top: 12),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.calendar_today),
                title: Text("Booking Status"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.arrow_down_circle),
                title: Text("Booking Status"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ]),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            // ignore: sort_child_properties_last
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: const Text(
                "PREFERENCES",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black38),
              ),
            ),
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 235, 232, 232)),
            margin: const EdgeInsets.only(top: 12),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.globe),
            title: const Text("Language"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("English"),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.moon),
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: false,
              onChanged: (val) {},
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text("Settings"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.info),
            title: Text("About"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
