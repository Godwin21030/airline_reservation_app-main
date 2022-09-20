import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  NetworkUtil.internal();
  factory NetworkUtil() => _networkUtils;
  static final NetworkUtil _networkUtils = NetworkUtil.internal();

  Future<Map<String, dynamic>> getReq(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<Map<String, dynamic>> postReq(String url,
      {required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
