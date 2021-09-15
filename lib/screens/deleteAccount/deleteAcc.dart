import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:blood_donation/services/authServices.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteAccount extends StatefulWidget {
  final String title;
  const DeleteAccount({Key? key, required this.title}) : super(key: key);

  @override
  DeleteAccountState createState() => DeleteAccountState();
}

class DeleteAccountState extends State<DeleteAccount> {
  final _formkey = GlobalKey<FormState>();

  final _auth = AuthServices();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String error = '';
  bool isloding = false;

  @override
  Widget build(BuildContext context) {
    UserModel? _user = Provider.of<UserModel?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      // drawerScrimColor: Colors.green,
      drawer: DrawerWidget(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Are you want to leave this grate work !",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                    ),
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
                                    .reauthUser(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then((value) => {
                                          setState(() {
                                            isloding = false;
                                          }),
                                          if (value == null)
                                            // Navigator.pushReplacementNamed(
                                            //     context, '/')
                                            {
                                              print('authenticate'),
                                              showAlertDialog(
                                                  context, _user!.uid)
                                            }
                                          else
                                            setState(() {
                                              print(value);
                                              error = value.toString();
                                            })
                                        });
                              }
                            },
                            child: Text('Delete Account !'),
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

  showAlertDialog(BuildContext context, String uid) {
    DatabaseService _db = DatabaseService(uid: uid);
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete Account"),
      onPressed: () {
        _auth.deleteAccount();
        _db.deleteField(uid);
        Navigator.pushReplacementNamed(context, 'register/');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like to continue leaving this grate work?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
