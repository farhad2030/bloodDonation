import 'package:blood_donation/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  final String? searchText;
  DatabaseService({this.searchText, this.uid});

//collection reference
  final CollectionReference donorDataCollection =
      FirebaseFirestore.instance.collection('donorData');

//update donor data
  Future<void> updateUserData(
    String name,
    String phone,
    String age,
    String? bloodGroup,
    String? gender,
    String? lastDonateDate,
    String? address,
  ) async {
    return await donorDataCollection.doc(uid).set({
      'name': name,
      'phone': phone,
      'age': age,
      'bloodGroup': bloodGroup,
      'gender': gender,
      'lastDonateDate': lastDonateDate,
      'address': address,
    });
  }

//delete field
  Future deleteField(uid) async {
    donorDataCollection.doc(uid).delete();
  }

//user list

//data structuring
  List<DonorModel> _userDatalist(QuerySnapshot snapshot) {
    List<DonorModel> a = [];
    for (var doc in snapshot.docs.toList()) {
      print('data model test ');
      a.add(
        DonorModel(
          name: doc['name'],
          phone: doc['phone'],
          age: doc['age'],
          bloodGroup: doc['bloodGroup'],
          gender: doc['gender'],
          lastDonateDate: doc['lastDonateDate'],
          address: doc['address'],
        ),
      );
      print(a);
    }

    return a;
  }

  //get userData stream

  Stream<List<DonorModel>> get donorData {
    print('stream ');
    print('stream test');
    print(donorDataCollection.snapshots());
    return donorDataCollection
        // .orderBy('bloodGroup', descending: true)
        .where('bloodGroup', whereIn: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'])
        // .where('bloodGroup', isEqualTo: searchText)
        // .where('name', isEqualTo: "Farhad")
        .snapshots()
        .map(_userDatalist);
  }

  Future<List<DonorModel>> donorList() {
    print('future donor list  test');
    print(donorDataCollection.snapshots());
    return donorDataCollection
        // .orderBy('bloodGroup', descending: true)
        .where('bloodGroup', whereIn: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'])
        // .where('bloodGroup', isEqualTo: searchText)
        // .where('name', isEqualTo: "Farhad")
        .get()
        .then((value) => _userDatalist(value));

    // .map(_userDatalist);
  }

// get stream single donor for profile
  Stream<DonorModel> get singleDonor {
    return donorDataCollection.doc(uid).snapshots().map((event) => DonorModel(
          name: event['name'],
          phone: event['phone'],
          age: event['age'],
          bloodGroup: event['bloodGroup'],
          gender: event['gender'],
          lastDonateDate: event['lastDonateDate'],
          address: event['address'],
        ));
  }

//get single donor for entry form
  Future<DonorModel> sDonor() {
    return donorDataCollection.doc(uid).get().then((event) => DonorModel(
          name: event['name'],
          phone: event['phone'],
          age: event['age'],
          bloodGroup: event['bloodGroup'],
          gender: event['gender'],
          lastDonateDate: event['lastDonateDate'],
          address: event['address'],
        ));
  }
}
