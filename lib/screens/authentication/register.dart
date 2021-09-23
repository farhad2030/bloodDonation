import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/services/authServices.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final String title;
  const Register({Key? key, required this.title}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email :'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: continputDecoration('Enter your email'),
                            validator: (val) {
                              if (val != null) {
                                if (!val.contains('@'))
                                  return 'Email must contains @ ';
                              } else if (val == null)
                                return 'Email is required';
                            },
                          ),
                        ),
                        Text('Password :'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration:
                                continputDecoration('Enter your password'),
                            validator: (val) {
                              if (val != null) {
                                if (val.length < 8)
                                  return ' Password must 8 character or large';
                              } else
                                return 'password is required';
                            },
                          ),
                        ),
                        Text(error),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red[900]),
                              onPressed: () {
                                if (_formkey.currentState!.validate())
                                  setState(() {
                                    isloding = true;
                                  });
                                _auth
                                    .registerWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then((value) => {
                                          setState(() {
                                            isloding = false;
                                          }),
                                          if (value.runtimeType == UserModel)
                                            {
                                              Navigator.pushReplacementNamed(
                                                  context, '/'),
                                              DatabaseService(uid: value.uid)
                                                  .updateUserData('-', '-', '-',
                                                      '-', '-', '-', '-')
                                            }
                                          else
                                            setState(() {
                                              print(value);
                                              error = value.toString();
                                            })
                                        });
                              },
                              child: Text('Register'),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'login/');
                            },
                            child: togolText(
                                'Already have an account? Please login')),
                        if (isloding == true) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(color: Colors.white)
                            ],
                          ),
                        ],
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
