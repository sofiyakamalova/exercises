class UserModel {
  final String name;
  final String surname;

  UserModel({required this.name, required this.surname});

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      surname: json['surname'],
    );
  }
}
