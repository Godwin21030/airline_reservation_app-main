part of airline_utils;

class AppRouter {
  static const String homeRoute = '/home';
  static const String onboardingRoute = '/onboarding';
  static const String ticketDetails = '/ticket';
  static const String buyTicketRoute = '/buyTicket';

  static Route<dynamic> genenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _route(
          page: const HomePage(),
          route: homeRoute,
        );
      case onboardingRoute:
        return _route(
          page: const OnboardingScreen(),
          route: onboardingRoute,
        );
      // case ticketDetails:
      //   return _route(
      //     page: TicketDetails(),
      //     route: ticketDetails,
      //   );
      // case buyTicketRoute:
      //   return _route(
      //     page: TicketDetails(),
      //     route: buyTicketRoute,
      //   );
      default:
        return _route(
          page: Scaffold(
            appBar: AppBar(
              title: const Text('AirRev'),
            ),
            body: const Center(
              child: Text('AirRev'),
            ),
          ),
          route: 'unknown',
        );
    }
  }

  static Route<dynamic> _route({required Widget page, String? route}) {
    return CupertinoPageRoute(builder: (context) => page);
  }
}
