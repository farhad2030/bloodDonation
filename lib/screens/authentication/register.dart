import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final String title;
  const Register({Key? key, required this.title}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      drawer: DrawerWidget(),
      // drawerScrimColor: Colors.green,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circleLogin,
              Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: continputDecoration('Enter your email'),
                      validator: (val) {
                        if (val != null) {
                          if (val.contains('@'))
                            return 'Email must contains @ ';
                        } else
                          return 'Email is required';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: continputDecoration('Enter your password'),
                      validator: (val) {
                        if (val != null) {
                          if (val.length <= 8)
                            return ' Password must 8 character or large';
                        } else
                          return 'password is required';
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                    onPressed: () {},
                    child: Text('Register'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login/');
                      },
                      child:
                          togolText('Already have an account? Please login')),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
