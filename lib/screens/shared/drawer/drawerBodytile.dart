import 'package:flutter/material.dart';

class DrawerBodyTile extends StatelessWidget {
  final IconData icon;
  final String route;
  final String title;

  const DrawerBodyTile(
      {Key? key, required this.route, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
            onPressed: () {
              // if (route != 'logout') {
              Navigator.pushReplacementNamed(context, route);
              // } else if (route == 'logout') {
              //   _auth.signOut().then((value) =>
              //       Navigator.pushReplacementNamed(context, 'authCheck/'));
              // }
            },
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            label: Text(
              title,
              style: TextStyle(color: Colors.white),
            )),
        Divider(
          thickness: 2,
          color: Colors.white,
        )
      ],
    );
  }
}
