import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionService {
  const ConnectionService();

  Future<bool> hasInternet() async {
    try {
      final result = await InternetConnection().hasInternetAccess;

      return result;
    } catch (e) {
      return false;
    }
  }
}
