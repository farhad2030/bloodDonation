import 'package:blood_donation/model/user.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatefulWidget {
  final DonorModel singleDonor;
  HomeTile({required this.singleDonor});

  @override
  _HomeTileState createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  @override
  Widget build(BuildContext context) {
    final donorData = widget.singleDonor;

    int difference = 0;
    DateTime now = DateTime.now();

    if (donorData.lastDonateDate != '-') {
      DateTime _lastDonateDate = DateTime.parse(donorData.lastDonateDate);

      difference = (now.difference(_lastDonateDate).inDays) ~/ 30;
    } else
      difference = 0;

    // var formatter = new DateFormat('dd-MM-yyyy');
    // String formatedDate = formatter.format(_lastDonateDate);

    final tileLeading = Container(
      height: 70,
      width: 70,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.red[500],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          donorData.bloodGroup,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Card(
      color: Colors.red[300],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: tileLeading,
              title: Center(child: Text('Name : ${donorData.name}')),
              subtitle: Column(
                children: [
                  Text('Address : ${donorData.address}'),
                  Text('Phone : ${donorData.phone}'),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text("Donate $difference months ago"),
          )
        ],
      ),
    );
  }
}
