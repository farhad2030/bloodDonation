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
    var donorData = widget.singleDonor;
    final tileLeading = Container(
      height: 70,
      width: 70,
      padding: EdgeInsets.all(10),
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
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: tileLeading,
          title: Center(child: Text(donorData.name)),
          subtitle: Column(
            children: [
              Text(donorData.address),
              Text(donorData.phone),
            ],
          ),
        ),
      ),
    );
  }
}
