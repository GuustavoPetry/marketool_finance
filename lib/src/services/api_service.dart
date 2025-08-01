import "dart:convert";
import "package:http/http.dart" as http;

class ApiService {
  final _baseUrl = "http://10.0.2.2:3000";

  // LOGIN:
  Future<Map<String, dynamic>?> login(Map<String, dynamic> data) async {
    // Quando implementar Token JWT essa função irá retornar o Token
    final url = Uri.parse("$_baseUrl/auth");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData["user"];
    }
    return null;
  }

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
