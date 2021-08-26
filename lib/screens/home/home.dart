import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      drawer: DrawerWidget(),
      // drawerScrimColor: Colors.green,
      body: Container(
        // color: ,
        child: SingleChildScrollView(
          child: Column(
            children: [Text('data')],
          ),
        ),
      ),
    );
  }
}
