import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(),
      child: Form(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search blood group",
          ),
        ),
      ),
    );
  }
}
