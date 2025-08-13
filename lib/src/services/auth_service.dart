import "dart:convert";
import "package:http/http.dart" as http;

class AuthService {
  static bool isLoggedIn = false;
  static String username = "";
  static int? userId;

  final _baseUrl = "http://10.0.2.2:3000";

  static void login(String user, int id) {
    userId = id;
    username = user;
    isLoggedIn = true;
  }

  static void logout() {
    isLoggedIn = false;
  }

  // LOGIN:
  Future<Map<String, dynamic>?> auth(Map<String, dynamic> data) async {
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
}
