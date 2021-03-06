import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DrawerHead extends StatefulWidget {
  const DrawerHead({Key? key}) : super(key: key);

  @override
  _DrawerHeadState createState() => _DrawerHeadState();
}

class _DrawerHeadState extends State<DrawerHead> {
  @override
  Widget build(BuildContext context) {
    UserModel? _user = Provider.of<UserModel?>(context);
    DatabaseService _db = DatabaseService(uid: _user!.uid);

    return StreamProvider<DonorModel>(
      create: (_) => _db.singleDonor,
      initialData: DonorModel(
        name: '-',
        phone: '-',
        age: '-',
        bloodGroup: '-',
        gender: '-',
        lastDonateDate: '-',
        address: '-',
      ),
      child: Container(
        child: Consumer<DonorModel>(builder: (context, a, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 80,
                width: 80,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            a.bloodGroup,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'entryForm/');
                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.edit,
                            color: Colors.amber,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // _db.singleDonor.forEach((element) {

              // }),
              SizedBox(height: 10),
              Text(a.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(a.address,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text(a.phone,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    // border: Border.fromBorderSide(BorderSide()),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Text('Last Donation Date :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                        a.lastDonateDate == "-"
                            ? 'Select Date'
                            : DateFormat('dd MMMM yyyy') //hh:mm a//
                                .format(DateTime.parse(a.lastDonateDate)),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 5,
                color: Colors.white24,
              ),
            ],
          );
        }),
      ),
    );
  }
}
