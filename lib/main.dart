import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'blood donation',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}
