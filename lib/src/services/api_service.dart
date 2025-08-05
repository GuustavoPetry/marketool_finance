import "dart:convert";
import "package:http/http.dart" as http;
import "package:marketool_financer/src/models/asset_model.dart";

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

  // BUSCAR ATIVOS API BRAPPI:
  Future<List<AssetModel>> searchAssets(String search) async {
    if (search.length <= 2) return [];

    final url = Uri.parse(
      "$_baseUrl/brappi/assets",
    ).replace(queryParameters: {"search": search, "page": "1", "limit": "10"});

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => AssetModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
