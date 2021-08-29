import 'package:blood_donation/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

//collection reference
  final CollectionReference donorDataCollection =
      FirebaseFirestore.instance.collection('donorData');

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

//user list
//data structuring
  List<DonorModel> _userDatalist(QuerySnapshot snapshot) {
    List<DonorModel> a = [];
    for (var doc in snapshot.docs.toList()) {
      print('data model test ');
      a.add(DonorModel(
          name: doc['name'],
          phone: doc['phone'],
          age: doc['age'],
          bloodGroup: doc['bloodGroup'],
          gender: doc['gender'],
          lastDonateDate: doc['lastDonateDate'],
          address: doc['address']));
      print(a);
    }

    return a;
  }

  //get userData stream

  Stream<List<DonorModel>> get donorData {
    print('stream ');
    print('stream test');
    print(donorDataCollection.snapshots());
    return donorDataCollection.snapshots().map(_userDatalist);
  }

  Stream<DonorModel> get singleDonor {
    return donorDataCollection.doc(uid).snapshots().map((event) => DonorModel(
        name: event['name'],
        phone: event['phone'],
        age: event['age'],
        bloodGroup: event['bloodGroup'],
        gender: event['gender'],
        lastDonateDate: event['lastDonateDate'],
        address: event['address']));
  }

  Future<DonorModel> sDonor() {
    return donorDataCollection.doc(uid).get().then((event) => DonorModel(
        name: event['name'],
        phone: event['phone'],
        age: event['age'],
        bloodGroup: event['bloodGroup'],
        gender: event['gender'],
        lastDonateDate: event['lastDonateDate'],
        address: event['address']));

    // then((event) => DonorModel(
    //     name: event['name'],
    //     phone: event['phone'],
    //     age: event['age'],
    //     bloodGroup: event['bloodGroup'],
    //     gender: event['gender'],
    //     lastDonateDate: event['lastDonateDate'],
    //     address: event['address']));
  }
}
