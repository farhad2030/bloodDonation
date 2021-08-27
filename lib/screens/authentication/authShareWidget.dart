import 'package:flutter/material.dart';

var circleLogin = Container(
  height: 70,
  width: 70,
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.red[500],
    shape: BoxShape.circle,
  ),
  child: Center(
    child: Text('A+'),
    // child: Image.asset('assets/images/login_register.png'),
  ),
);

InputDecoration continputDecoration(String hintText) {
  return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold),
      errorStyle: TextStyle(color: Colors.amber[600]));
}

Text togolText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.amber,
        decoration: TextDecoration.underline,
        decorationColor: Colors.amber),
  );
}
