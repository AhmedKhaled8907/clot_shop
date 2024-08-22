// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserCreationReq {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final int? gender;
  final String? age;

  UserCreationReq({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.gender,
    required this.age,
  });
}
