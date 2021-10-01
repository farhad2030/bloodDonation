import 'package:connectivity/connectivity.dart';
import "package:flutter/material.dart";

class Conection extends StatefulWidget {
  const Conection({Key? key}) : super(key: key);

  @override
  _ConectionState createState() => _ConectionState();
}

class _ConectionState extends State<Conection> {
  String _isconnected = "2";
  @override
  Widget build(BuildContext context) {
    checkConection() async {
      print("call connection");
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
        _isconnected = "1";
        setState(() {
          
        });
        print("mobile connection");
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        _isconnected = "2";
        setState(() {
          
        });
        print("wifi connection");
      } else {
        _isconnected = "0";
        setState(() {
          
        });
        print("no connection");
      }
    }

    return Container(
      child: Column(
        children: [
          _isconnected == "1"
              ? Text("Mobile connected")
              : _isconnected == "2"
                  ? Text("Wifi connected")
                  : Text("no connection"),
//                   if(_isconnected=="1"){
//  Text("Mobile connected")
//                   } else if(_isconnected=="2"){
//  Text("Wifi connected")
//                   }else{
//  Text("no connection"),
//                   }
          ElevatedButton(
              onPressed: checkConection, child: Text("check connection")),
        ],
      ),
    );
  }
}
