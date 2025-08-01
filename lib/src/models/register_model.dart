class RegisterModel {
  final String fullName;
  final String cpf;
  final DateTime birthDate;
  final String email;
  final String password;

  const RegisterModel({
    required this.fullName,
    required this.cpf,
    required this.birthDate,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "cpf": cpf,
    "birthDate": birthDate.toIso8601String(),
    "email": email,
    "password": password,
  };
}
