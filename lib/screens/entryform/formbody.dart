import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBody extends StatefulWidget {
  final String? uid;
  FormBody({required this.uid});
  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formkey = GlobalKey<FormState>();

  late DatabaseService _db = DatabaseService(uid: widget.uid);

  late Future<DonorModel> ddata = _db.sDonor().then((value) => a = value);

  // ddata.then((value) => a = value);

  static DonorModel a = DonorModel(
      name: '-',
      phone: '-',
      age: '-',
      gender: '-',
      bloodGroup: '-',
      address: '-',
      lastDonateDate: '-');

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

  _loadSingleData() {
    return _db.sDonor().then((value) {
      a = value;
    });
  }

  @override
  void initState() {
    super.initState();

    // Create anonymous function:
    () async {
      await _loadSingleData();
      if (this.mounted) {
        setState(() {
          // Your state change code goes here
        });
      }
    }();
  }

  String _lastDonateDate =
      a.lastDonateDate == '-' ? DateTime.now().toString() : a.lastDonateDate;

  TextEditingController _nameController =
      TextEditingController(text: a.name == '-' ? null : a.name);
  TextEditingController _phoneController =
      TextEditingController(text: a.phone == '-' ? null : a.phone);
  TextEditingController _ageController =
      TextEditingController(text: a.age == '-' ? null : a.age);

  String? _gender = a.gender == '-' ? null : a.gender;
  String? _bloodGroup = a.bloodGroup == '-' ? null : a.bloodGroup;
  String? _address = a.address == '-' ? null : a.address;

  bool? isDonate = a.lastDonateDate == '-' ? false : true; //for date checkbox

  var dateFormater = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name :',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
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
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: continputDecoration('Enter your phome number'),
                validator: (val) {
                  if (val != null) {
                    if (val.isEmpty) return 'Phone  is empty';
                    if (val.length > 11) return 'Phone Number must 11 digite';
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
              child: TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: continputDecoration('Enter your phome number'),
                validator: (val) {
                  if (val != null) {
                    if (val.isEmpty) return 'Phone  is empty';
                    if (val.length > 11) return 'Phone Number must 11 digite';
                  } else
                    return 'Null value not allowed';
                },
              ),
            ),
            Text(
              'Gender : ',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration: continputDecoration('Select your Gender'),
                  validator: (val) {
                    if (val == null) return 'Select an item';
                  },
                  value: _gender,
                  items: genderOptions.map(
                    (option) {
                      return DropdownMenuItem<String>(
                        child: Text(option),
                        value: option,
                      );
                    },
                  ).toList(),
                  onChanged: (val) => {
                        (setState(() => _gender = val.toString())),
                      }),
            ),
            Text(
              'Blood group : ',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration: continputDecoration('Select your blood group'),
                  validator: (val) {
                    if (val == null) return 'Select an item';
                  },
                  value: _bloodGroup,
                  items: bloodGroupOptions.map(
                    (option) {
                      return DropdownMenuItem<String>(
                        child: Text(option),
                        value: option,
                      );
                    },
                  ).toList(),
                  onChanged: (val) => {
                        (setState(() => _bloodGroup = val.toString())),
                      }),
            ),
            Text(
              'Address : ',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration: continputDecoration('Select your address'),
                  validator: (val) {
                    if (val == null) return 'Select an item';
                  },
                  value: _address,
                  items: addressOptions.map(
                    (option) {
                      return DropdownMenuItem<String>(
                        child: Text(option),
                        value: option,
                      );
                    },
                  ).toList(),
                  onChanged: (val) => {
                        (setState(() => _address = val.toString())),
                      }),
            ),
            Row(
              children: [
                Text(
                  'Last Donate Date : ',
                  style: TextStyle(color: Colors.white),
                ),
                Checkbox(
                  value: isDonate,
                  onChanged: (value) {
                    setState(() {
                      this.isDonate = value;
                    });
                  },
                ),
              ],
            ),
            if (isDonate == true)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 0),
                color: Colors.white,
                child: ListTile(
                  // selected: false,
                  tileColor: Colors.white,
                  title: Text(

                      //
                      a.lastDonateDate == "-"
                          ? 'Select Date'
                          : DateFormat('dd MMMM yyyy') //hh:mm a//
                              .format(DateTime.parse(_lastDonateDate))),

                  trailing: Icon(Icons.calendar_today),
                  //
                  onTap: () => _pickTime(_lastDonateDate == '-'
                      ? DateTime.now()
                      : DateTime.parse(_lastDonateDate)),
                  //
                ),
              ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    print(_nameController.text);
                    print(_phoneController.text);
                    print(_ageController.text);
                    print(_lastDonateDate.toString());
                    print(_gender);
                    print(_bloodGroup);

                    _db.updateUserData(
                        _nameController.text,
                        _phoneController.text,
                        _ageController.text,
                        _bloodGroup,
                        _gender,
                        isDonate == true && _lastDonateDate != '-'
                            ? _lastDonateDate.toString()
                            : '-',
                        _address);
                  }
                },
                child: Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _pickTime(DateTime initDate) async {
    DateTime? d = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: DateTime(DateTime.now().year - 95),
      lastDate: DateTime.now(),
    );
    if (d != null) {
      setState(() {
        _lastDonateDate = d.toString();
        print('date d: $d');

        print('date last : $_lastDonateDate');
      });
    }
  }
}
