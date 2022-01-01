// ignore_for_file: avoid_print

import 'dart:io';

import 'package:connectivity/connectivity.dart';

class ConnectivityNetwork {
  // Singleton
  ConnectivityNetwork._();
  static final ConnectivityNetwork _instance = ConnectivityNetwork._();

  static ConnectivityNetwork get instance => _instance;

  Future<bool> _hasNetwork() async {
    try {
      final result = await InternetAddress.lookup("www.google.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<bool> hasConnect() async {
    ConnectivityResult _result = await (Connectivity().checkConnectivity());

    if (_result == ConnectivityResult.mobile) {
      print(ConnectivityResult.mobile);
      // I am connected to a mobile network, make sure there is actually a net connection.

      if (await _hasNetwork()) {
        // Mobile data detected & internet connection confirmed.

        return true;
      } else {
        // Mobile data detected but no internet connection found.

        return false;
      }
    } else if (_result == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await _hasNetwork()) {
        // Wifi detected & internet connection confirmed.
        return true;
      } else {
        // Wifi detected but no internet connection found.

        return false;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      return false;
    }
  }
}
