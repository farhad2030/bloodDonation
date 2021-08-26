import 'package:blood_donation/screens/shared/drawer/drawerBody.dart';
import 'package:blood_donation/screens/shared/drawer/drawerHead.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          width: 380,
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Colors.red[400],
          child: Column(
            children: [
              DrawerHead(),
              DrawerBody(),
            ],
          ),
        ),
      ),
    );
  }
}
