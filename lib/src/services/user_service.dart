import "dart:convert";
import "package:http/http.dart" as http;

class UserService {
  final _baseUrl = "http://10.0.2.2:3000";

  // REGISTER:
  Future<bool> register(Map<String, dynamic> data) async {
    final url = Uri.parse("$_baseUrl/users");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

}
