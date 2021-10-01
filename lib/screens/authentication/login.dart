import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/screens/authentication/connection.dart';
import 'package:blood_donation/services/authServices.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String title;
  const Login({Key? key, required this.title}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  final _auth = AuthServices();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String error = '';
  bool isloding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      // drawerScrimColor: Colors.green,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/login_register.png',
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 20),
                Conection(),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email :'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: continputDecoration('Enter your email'),
                          validator: (val) {
                            if (val != null) {
                              if (val.isEmpty) return 'Enter valid email';
                              if (!val.contains('@gmail.com'))
                                return '@gmail.com must contains';
                            } else
                              return 'Enter your email';
                          },
                        ),
                      ),
                      Text('Password :'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration:
                              continputDecoration('Enter your password'),
                          validator: (val) {
                            if (val != null) {
                              if (val.isEmpty || val.length < 8)
                                return 'Password must contains 8 character';
                            } else
                              return 'Enter a password';
                          },
                        ),
                      ),
                      Text(error),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[400],
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                print('login clicked');
                                print('email:${_emailController.text}');
                                print('email:${_passwordController.text}');
                                setState(() {
                                  isloding = true;
                                });
                                _auth
                                    .signinWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then((value) => {
                                          setState(() {
                                            isloding = false;
                                          }),
                                          if (value.runtimeType == UserModel)
                                            Navigator.pushReplacementNamed(
                                                context, '/')
                                          else
                                            setState(() {
                                              print(value);
                                              error = value.toString();
                                            })
                                        });
                              }
                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),
                      if (isloding == true) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                                strokeWidth: 2.0, color: Colors.white)
                          ],
                        ),
                      ],
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'register/');
                          },
                          child: togolText(
                              'Already have an account? Please login')),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'forgotPassword/');
                          },
                          child: togolText('Are you forgot your password ? ')),
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
}
