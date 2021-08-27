import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/screens/shared/drawer/drawerWidget.dart';
import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget {
  final String title;
  const EntryForm({Key? key, required this.title}) : super(key: key);

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  //  TextEditingController _nameController =
  //     new TextEditingController(text: a.name == '-' ? null : a.name);
  // TextEditingController _phoneController =
  //     TextEditingController(text: a.phone == '-' ? null : a.phone);
  // TextEditingController _ageController =
  //     TextEditingController(text: a.age == '-' ? null : a.age);

  final _formkey = GlobalKey<FormState>();

  // String _gender = a.gender == '-' ? 'Male' : a.gender;
  // String? _gender = a.gender == '-' ? null : a.gender;
  // String? _bloodGroup = a.bloodGroup == '-' ? null : a.bloodGroup;
  // String? _address = a.address == '-' ? null : a.address;

  // DateTime _lastDonateDate = DateTime.parse(
  //     a.lastDonateDate == '-' ? DateTime.now().toString() : a.lastDonateDate);

  List<String> genderOptions = ['Male', 'Female', 'Other', '-'];
  List<String> bloodGroupOptions = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', '-'];
  List<String> addressOptions = [
    'Dhaka',
    'Sylhet',
    'Chattagram',
    'Barisal',
    'Khulna',
    'Rangpur',
    'Rajshahi',
    'Mymensingh',
    '-'
  ];

  //  static DonorModel a = DonorModel(
  //     name: 'name',
  //     phone: 'phone',
  //     age: 'age',
  //     gender: 'gender',
  //     bloodGroup: 'bloodGroup',
  //     address: 'address',
  //     lastDonateDate: 'lastDonateDate');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : ',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: continputDecoration('Enter your name'),
                  ),
                ),
                Text(
                  'Phone : ',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: continputDecoration('Enter your phome number'),
                    validator: (val) {
                      if (val != null) {
                        if (val.isEmpty) return 'Phone  is empty';
                        if (val.length > 11)
                          return 'Phone Number must 11 digite';
                      } else
                        return 'Null value not allowed';
                    },
                  ),
                ),
                Text(
                  'Age : ',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      decoration: continputDecoration('Select your Gender'),
                      // value: _gender,
                      items: genderOptions.map(
                        (option) {
                          return DropdownMenuItem<String>(
                            child: Text(option),
                            value: option,
                          );
                        },
                      ).toList(),
                      onChanged: (val) => {}
                      // (setState(() => _gender = val.toString())),
                      ),
                ),
                Text(
                  'Blood group : ',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      decoration:
                          continputDecoration('Select your blood group'),
                      // value: _gender,
                      items: genderOptions.map(
                        (option) {
                          return DropdownMenuItem<String>(
                            child: Text(option),
                            value: option,
                          );
                        },
                      ).toList(),
                      onChanged: (val) => {}
                      // (setState(() => _gender = val.toString())),
                      ),
                ),
                Text(
                  'Address : ',
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      decoration: continputDecoration('Select your address'),
                      // value: _gender,
                      items: genderOptions.map(
                        (option) {
                          return DropdownMenuItem<String>(
                            child: Text(option),
                            value: option,
                          );
                        },
                      ).toList(),
                      onChanged: (val) => {}
                      // (setState(() => _gender = val.toString())),
                      ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 0),
                  color: Colors.white,
                  child: ListTile(
                    // selected: false,
                    tileColor: Colors.white,
                    title: Text('Data: '),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () => _pickTime(),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pickTime() async {
    DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().day - 1),
      firstDate: DateTime.now(),

      lastDate: DateTime.now(),

      // selectableDayPredicate: (DateTime q){
      //   return q.weekday==6
      // }

      // builder: (context, child) {
      //   return Theme(
      //     data: ThemeData(
      //       primaryColor: Colors.red,
      //     ),
      //     child: ,
      //   );
      // },
    );
    if (d != null) {
      setState(() {
        // _lastDonateDate = d;
      });
    }
  }
}
