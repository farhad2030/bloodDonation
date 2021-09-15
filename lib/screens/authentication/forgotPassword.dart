import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/services/authServices.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  final String title;
  const ForgotPassword({Key? key, required this.title}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();

  final _auth = AuthServices();
  final _emailController = TextEditingController();
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
                              if (val.isEmpty) return 'Enter valid email';
                              if (!val.contains('@gmail.com'))
                                return '@gmail.com must contains';
                            } else
                              return 'Enter your email';
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
                                setState(() {
                                  isloding = true;
                                });
                                _auth
                                    .forgotPass(
                                      email: _emailController.text,
                                    )
                                    .then((value) => {
                                          setState(() {
                                            isloding = false;
                                          }),
                                          if (value == null)
                                            {
                                              Navigator.pushReplacementNamed(
                                                  context, 'login/'),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.green[200],
                                                      content: Text(
                                                        'Recovary password link is send to your email',
                                                      )))
                                            }
                                          else
                                            {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red[800],
                                                      content: Text(value)))
                                            }
                                        });
                              }
                            },
                            child: Text('Reset password ! '),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'register/');
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
