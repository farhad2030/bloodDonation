import "package:flutter/material.dart";
import 'package:connectivity/connectivity.dart';

class Conection extends StatefulWidget {
  const Conection({Key? key}) : super(key: key);

  @override
  _ConectionState createState() => _ConectionState();
}

class _ConectionState extends State<Conection> {
  String _isconnected = "0";

  checkConection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return _isconnected = "1";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return _isconnected = "2";
    } else {
      return _isconnected = "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isconnected == "0") {
      return Container(
        child: Text("No connection"),
      );
    } else if (_isconnected == "1") {
      return Container(
        child: Text("Mobile connection"),
      );
    } else {
      return Container(
        child: Text("Wifi connection"),
      );
    }
  }
}
