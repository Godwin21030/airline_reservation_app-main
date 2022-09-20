import 'package:airline_reservation_app/utils/_index.dart';
import 'package:airline_reservation_app/utils/singletons.dart';
import 'package:flutter/material.dart';
import 'package:airline_reservation_app/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  AirlineConfig(
    values:
        AirlineValues(baseDomain: 'https://airline-rest-api.herokuapp.com/'),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Singletons.registerProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff536DFE),
        ),
        initialRoute: AppRouter.onboardingRoute,
        onGenerateRoute: AppRouter.genenrateRoute,
      ),
    );
  }
}
