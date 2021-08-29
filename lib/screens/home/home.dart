import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/home/homeTile.dart';
import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:blood_donation/services/authServices.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AuthServices _auth = AuthServices();
    DatabaseService _db = DatabaseService();

    return StreamProvider<List<DonorModel>>(
      create: (_) => _db.donorData,
      initialData: [
        DonorModel(
            name: 'name',
            phone: 'phone',
            age: 'age',
            bloodGroup: '-',
            gender: 'gender',
            lastDonateDate: 'lastDonateDate',
            address: 'address')
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
          actions: [
            IconButton(
              onPressed: () {
                print('click');
                _auth.signOut().then((value) =>
                    Navigator.pushReplacementNamed(context, 'authCheck/'));
              },
              icon: Icon(Icons.logout_outlined),
            )
          ],
        ),
        drawer: DrawerWidget(),
        // drawerScrimColor: Colors.green,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Consumer<List<DonorModel>>(
              builder: (context, a, index) {
                return ListView.builder(
                    itemCount: a.length,
                    itemBuilder: (BuildContext context, index) {
                      return HomeTile(singleDonor: a[index]);
                    });
              },
            )),
      ),
    );
  }
}
