import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    UserModel? _user = Provider.of<UserModel?>(context);

    if (_user != null) {
      print('object:');
      print(_user.uid);
      return Home(title: 'Home');
    } else {
      print('nulll uid');
      return Login(title: 'Login');
    }
  }
}
