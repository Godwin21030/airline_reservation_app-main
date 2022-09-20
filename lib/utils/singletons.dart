import 'package:airline_reservation_app/providers/bookings.dart';
import 'package:provider/provider.dart';

class Singletons {
  static List<ChangeNotifierProvider> registerProviders() =>
      <ChangeNotifierProvider>[
        ChangeNotifierProvider<TicketProvider>(create: (_) => TicketProvider()),
      ];
}
