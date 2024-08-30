class UserEntity {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? image;
  int? gender;
  String? age;

  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    this.gender,
    this.age,
  });
}
