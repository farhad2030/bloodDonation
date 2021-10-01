import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/shared/drawer/drawerBody.dart';
import 'package:blood_donation/screens/shared/drawer/drawerHead.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawerHeadButton.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    UserModel? _user = Provider.of<UserModel?>(context);
    DatabaseService _db = DatabaseService(uid: _user!.uid);
    Future<String> _bloodgroup =
        // String _bloodgroup = "-";
        _db.sDonor().then((value) => value.bloodGroup
            // print("blood group of value ${value.bloodGroup}")

            );
    print("blood Group $_bloodgroup");

    return SafeArea(
      child: Drawer(
        child: Container(
          width: 380,
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Colors.red[400],
          child: Column(
            children: [
              // _bloodgroup == '-' ? DrawerHeadButton() : DrawerHead(),
              FutureBuilder<String>(
                future: _bloodgroup,
                initialData: "-",
                builder: (context, data) {
                  return data.data == "-" ? DrawerHeadButton() : DrawerHead();
                },
              ),

              DrawerBody(),
              // Consumer<DocumentSnapshot>(
              //   builder: (context, a, index) {
              //     print(a['name']);
              //     return Text('data');
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
