import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/home/homeTile.dart';
import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:blood_donation/services/authServices.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({Key? key, required this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

bool isLoading = true;

class _HomeState extends State<Home> {
  static String searchText = "";
  static DatabaseService _db = DatabaseService(searchText: searchText);
  static List<DonorModel> _listOfDonor = [];

//fatch data
  static List<DonorModel> _foundDonorList = [];

  Future<List<DonorModel>> a = _db.donorList().then((value) {
    isLoading = false;
    return _listOfDonor = value;
  });

  // @override
  // initState() {
  //   // at the beginning, all donor are shown
  //   // _foundDonorList = _listOfDonor;
  //   setState(() {
  //     a.then((value) => _foundDonorList = value);
  //   });
  //   print("intiState $_foundDonorList");
  //   super.initState();
  // }

  void _findDonor(String searchText) {
    List<DonorModel> bgresults = [];
    List<DonorModel> results = [];

    if (searchText.isEmpty) {
      print('enpty test $_listOfDonor');
      results = _listOfDonor;
    } else {
      results = _listOfDonor
          .where((element) =>
              element.bloodGroup
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) ||
              element.address.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    //Refresh the UI
    setState(() {
      _foundDonorList = results;
    });
  }

  // @override
  //
  _performYourTask() {
    return _db.donorList().then((value) {
      _foundDonorList = value;
    });
  }

  @override
  void initState() {
    super.initState();

    // Create anonymous function:
    () async {
      await _performYourTask();
      if (this.mounted) {
        setState(() {
          // Your state change code goes here
        });
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    AuthServices _auth = AuthServices();

    return Scaffold(
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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Form(
                    child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 290,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Center(
                          child: TextFormField(
                            onChanged: (val) {
                              _findDonor(val);
                              print('search Text :$searchText');
                            },
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 17),
                              hintText: 'Bloodgroup or division',
                              suffixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              Expanded(
                  child: (isLoading == false)
                      ? ListView.builder(
                          // shrinkWrap: true,

                          itemCount: _foundDonorList.length,
                          // search.length == 0 ? a.length : search.length,
                          itemBuilder: (BuildContext context, index) {
                            return HomeTile(
                                singleDonor: _foundDonorList[index]);
                          },
                        )
                      : CircularProgressIndicator()),
            ],
          ),
        ));
  }
}
