class UserModel {
  final String uid;
  UserModel({required this.uid});
}

class DonorModel {
  final String name;
  final String phone;
  final String age;
  final String bloodGroup;
  final String gender;
  final String lastDonateDate;
  final String address;
  final bool wantDonate;

  DonorModel({
    required this.name,
    required this.phone,
    required this.age,
    required this.bloodGroup,
    required this.gender,
    required this.lastDonateDate,
    required this.address,
    required this.wantDonate,
  });
}
