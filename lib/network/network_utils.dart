import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hng_task3/configs/sessions.dart';

class NetworkUtils {
  static Future<Map<String, String>> headers() async {
    var token = await SessionManager().getToken();
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return headers;
  }

  static Future<bool> hasNetwork() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }
}
