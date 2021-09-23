import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/appversion/AppVersion.dart';
import 'package:blood_donation/screens/authCheck.dart';
import 'package:blood_donation/screens/authentication/forgotPassword.dart';
import 'package:blood_donation/screens/authentication/login.dart';
import 'package:blood_donation/screens/authentication/register.dart';
import 'package:blood_donation/screens/deleteAccount/deleteAcc.dart';
import 'package:blood_donation/screens/entryform/entryForm.dart';
import 'package:blood_donation/screens/home/home.dart';
import 'package:blood_donation/services/authServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>(
      create: (BuildContext context) => AuthServices().user,
      initialData: null,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Colors.red,
          title: 'blood donation',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.red[400],
            primarySwatch: Colors.red,
          ),
          // initialRoute: '/',
          routes: {
            '/': (context) => AuthCheck(),
            'login/': (context) => Login(title: 'Login'),
            'home/': (context) => Home(title: 'Flutter Demo Home Page'),
            'register/': (context) => Register(title: 'Register'),
            'entryForm/': (context) => EntryForm(title: 'Entry Form'),
            'authCheck/': (context) => AuthCheck(),
            'forgotPassword/': (context) =>
                ForgotPassword(title: 'Forgot password'),
            'deleteAccount/': (context) => DeleteAccount(
                  title: 'Delete Account',
                ),
            'appVersion/': (context) => AppVersion(
                  title: 'App version',
                ),
          }),
    );
  }
}
