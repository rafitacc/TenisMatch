import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionHelper {
  static Future<bool> hasInternet() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
