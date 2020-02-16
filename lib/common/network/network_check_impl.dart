import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mymy/common/network/network_check.dart';

class NetworkCheckImpl implements NetworkCheck {
  final Connectivity connectivity;

  NetworkCheckImpl({@required this.connectivity});

  @override
  Future<bool> isOnline() async {
    final result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.mobile) {
      return true;
    } else if(result == ConnectivityResult.wifi){
      return true;
    }
    return false;
  }
  
}