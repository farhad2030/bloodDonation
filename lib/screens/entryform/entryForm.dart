import 'package:blood_donation/screens/entryform/formbody.dart';
import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryForm extends StatefulWidget {
  final String title;

  const EntryForm({Key? key, required this.title}) : super(key: key);

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  // String _gender = a.gender == '-' ? 'Male' : a.gender;

// DateTime (String date){
//  var formatter = new DateFormat('dd-MM-yyyy');
//  return

// }
  var dateFormat = new DateFormat('dd-MM-yyyy ');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      drawer: DrawerWidget(),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FormBody()),
    );
  }
}
