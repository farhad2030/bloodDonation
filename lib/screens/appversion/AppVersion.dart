import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:flutter/material.dart';

class AppVersion extends StatefulWidget {
  final String title;
  const AppVersion({Key? key, required this.title}) : super(key: key);

  @override
  _AppVersionState createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("App version 1.0.0"),
            Text("Give your opinion example@gmail.com"),
          ],
        ),
      ),
    );
  }
}
