import 'package:flutter/material.dart';

class DrawerHead extends StatefulWidget {
  const DrawerHead({Key? key}) : super(key: key);

  @override
  _DrawerHeadState createState() => _DrawerHeadState();
}

class _DrawerHeadState extends State<DrawerHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
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
                        'A+',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.edit,
                      color: Colors.amber,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Text('Name of donor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('address',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Text('Number',
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
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Column(
                children: [
                  Text('Last Donation Date :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('2021-08-02',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
