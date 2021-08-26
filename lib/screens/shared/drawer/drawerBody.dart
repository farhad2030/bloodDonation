import 'package:blood_donation/screens/shared/drawer/drawerBodytile.dart';
import 'package:flutter/material.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerBodyTile(route: '/', title: 'Home', icon: Icons.home),
            DrawerBodyTile(
                route: '/',
                title: 'Delete Account',
                icon: Icons.delete_forever),
            DrawerBodyTile(
                route: '/', title: 'App version', icon: Icons.verified),
          ],
        ),
      ),
    ));
  }
}
