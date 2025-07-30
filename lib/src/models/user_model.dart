class UserModel {
  final String username;
  final String password;

  UserModel({
    required this.username,
    required this.password
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password
  };
}