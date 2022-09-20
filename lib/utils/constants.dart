class AirlineValues {
  AirlineValues({required this.baseDomain});
  final String baseDomain;
}

class AirlineConfig {
  factory AirlineConfig({required AirlineValues values}) {
    return _instance ??= AirlineConfig._internal(values);
  }
  AirlineConfig._internal(this.values);

  final AirlineValues values;
  static AirlineConfig? _instance;
  static AirlineConfig? get instance => _instance;
}
