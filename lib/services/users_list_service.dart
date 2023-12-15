import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voco_tech_test/models/users_model.dart';

class UserListService {
  final String baseUrl;

  UserListService({
    required this.baseUrl,
  });

  Future<List<Users>> getUserList(String page) async {
    final url = Uri.parse('$baseUrl/users?page=$page');

    try {
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> dataList = jsonResponse['data'];
        final userList = dataList.map((userData) => Users.fromJson(userData)).toList();
        return userList;
      } else {
        throw Exception('HTTP isteği başarısız oldu: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('İstek sırasında bir hata oluştu: $error');
    }
  }
}

