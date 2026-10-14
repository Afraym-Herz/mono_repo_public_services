import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Contract for checking network availability.
abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

/// Checks for both connectivity (wifi/mobile) AND actual internet access.
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  final Connectivity connectivity;

  NetworkInfoImpl({
    required this.connectionChecker,
    required this.connectivity,
  });

  @override
  Future<bool> get isConnected async {
    final results = await connectivity.checkConnectivity();

    // connectivity_plus v7 returns List<ConnectivityResult>
    if (results.contains(ConnectivityResult.none) || results.isEmpty) {
      return false;
    }

    // Verify actual internet access
    return connectionChecker.hasConnection;
  }

  @override
  Stream<bool> get onConnectivityChanged {
    return connectivity.onConnectivityChanged.asyncMap((results) async {
      if (results.contains(ConnectivityResult.none) || results.isEmpty) {
        return false;
      }
      return connectionChecker.hasConnection;
    });
  }
}
