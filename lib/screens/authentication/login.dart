import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String title;
  const Login({Key? key, required this.title}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        child: Expanded(
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
                          decoration: continputDecoration('Enter your name'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration:
                              continputDecoration('Enter your password'),
                        ),
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[900]),
                        onPressed: () {},
                        child: Text('Login'),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'register/');
                          },
                          child: togolText(
                              'Already have an account? Please login')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  var circleLogin = Container(
    height: 70,
    width: 70,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.red[500],
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text('A+'),
      // child: Image.asset('assets/images/login_register.png'),
    ),
  );
}
