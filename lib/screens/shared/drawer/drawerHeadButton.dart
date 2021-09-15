import 'package:flutter/material.dart';

class DrawerHeadButton extends StatefulWidget {
  const DrawerHeadButton({Key? key}) : super(key: key);

  @override
  _DrawerHeadButtonState createState() => _DrawerHeadButtonState();
}

class _DrawerHeadButtonState extends State<DrawerHeadButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'To show your data in the donor list Please give your information in below form',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Infornation Form"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'entryForm/');
                },
              ),
            ],
          ),
        ),
        const Divider(
          height: 20,
          thickness: 5,
          color: Colors.white24,
        ),
      ],
    );
  }
}
