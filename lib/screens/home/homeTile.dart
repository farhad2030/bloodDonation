import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[300],
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: tileLeading,
          title: Center(child: Text("Name_of_Donor")),
          subtitle: Column(
            children: [
              Text("Address_of_ Donor"),
              Text("Number_of_ Donor"),
            ],
          ),
        ),
      ),
    );
  }

  var tileLeading = Container(
    height: 70,
    width: 70,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.red[500],
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        'A+',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
