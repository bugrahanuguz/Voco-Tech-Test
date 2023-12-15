import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl;

  LoginService({
    required this.baseUrl,
  });

  Future<String> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final responseMessage = jsonResponse['token'] as String;
        return responseMessage;
      } else {
        throw Exception('HTTP isteği başarısız oldu: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('İstek sırasında bir hata oluştu: $error');
    }
  }
}
