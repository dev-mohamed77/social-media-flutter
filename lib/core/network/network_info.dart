import 'package:socailmedia/core/network/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  final ConnectivityNetwork connectivity;

  NetworkInfoImpl({
    required this.connectivity,
  });
  @override
  Future<bool> get isConnected => connectivity.hasConnect();
}
