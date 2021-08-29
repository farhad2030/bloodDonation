import 'package:blood_donation/model/user.dart';
import 'package:blood_donation/screens/authentication/authShareWidget.dart';
import 'package:blood_donation/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormBody extends StatefulWidget {
  const FormBody({Key? key}) : super(key: key);

  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formkey = GlobalKey<FormState>();

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

  DateTime _lastDonateDate = DateTime.parse('0000-00-00 00:00:00.000');

  @override
  void initState() {
    super.initState();
    _lastDonateDate = DateTime.parse('0000-00-00 00:00:00.000');
  }

  TextEditingController _nameController =
      TextEditingController(text: a.name == '-' ? null : a.name);
  TextEditingController _phoneController =
      TextEditingController(text: a.phone == '-' ? null : a.phone);
  TextEditingController _ageController =
      TextEditingController(text: a.age == '-' ? null : a.age);

  String? _gender = a.gender == '-' ? null : a.gender;
  String? _bloodGroup = a.bloodGroup == '-' ? null : a.bloodGroup;
  String? _address = a.address == '-' ? null : a.address;

  static DonorModel a = DonorModel(
      name: '-',
      phone: '-',
      age: '-',
      gender: '-',
      bloodGroup: '-',
      address: '-',
      lastDonateDate: '0000-00-00 00:00:00.000');

  @override
  Widget build(BuildContext context) {
//
    UserModel? _user = Provider.of<UserModel?>(context);
    DatabaseService _db = DatabaseService(uid: _user!.uid);

    Future<DonorModel> ddata = _db.sDonor();

    ddata.then((value) => a = value);

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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 0),
              color: Colors.white,
              child: ListTile(
                // selected: false,
                tileColor: Colors.white,
                title: Text(

                    //
                    'Date : ${
                    //
                    (_lastDonateDate == DateTime.parse('0000-00-00 00:00:00.000') && (a.lastDonateDate == '-')
                        //
                        ? 'Select Date'
                        //
                        : (_lastDonateDate == DateTime.parse('0000-00-00 00:00:00.000') && a.lastDonateDate != '-'
                            //
                            ? a.lastDonateDate : //
                            _lastDonateDate
                        //
                        ))}'),

                trailing: Icon(Icons.calendar_today),
                onTap: () => _pickTime(a.lastDonateDate == '-'
                    ? DateTime.now()
                    : DateTime.parse(a.lastDonateDate)),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                onPressed: () {
                  if (_formkey.currentState!.validate() &&
                      _lastDonateDate !=
                          DateTime.parse('0000-00-00 00:00:00.000')) {
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
                        _lastDonateDate.toString(),
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

  _pickTime(intDate) async {
    DateTime? d = await showDatePicker(
      context: context,
      initialDate: intDate,
      firstDate: DateTime(DateTime.now().year - 95),
      lastDate: DateTime.now(),
    );
    if (d != null) {
      setState(() {
        _lastDonateDate = d;
        print('date d: $d');

        print('date last : $_lastDonateDate');
      });
    }
  }
}
