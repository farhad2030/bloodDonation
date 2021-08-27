import 'package:blood_donation/screens/authentication/login.dart';
import 'package:blood_donation/screens/authentication/register.dart';
import 'package:blood_donation/screens/entryform/entryForm.dart';
import 'package:blood_donation/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.red,
        title: 'blood donation',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.red[400],
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        // home: Home(title: 'Flutter Demo Home Page'),
        routes: {
          '/': (context) => Home(title: 'Home'),
          'login/': (context) => Login(title: 'Login'),
          'register/': (context) => Register(title: 'Register'),
          'entryForm/': (context) => EntryForm(title: 'Entry Form'),
        });
  }
}
