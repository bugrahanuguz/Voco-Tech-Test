import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_tech_test/models/users_model.dart';
import 'package:voco_tech_test/services/users_list_service.dart';

final userListServiceProvider =
    Provider((ref) => UserListService(baseUrl: 'https://reqres.in/api'));

final userListControllerProvider = ChangeNotifierProvider((ref) => UserListController());

class UserListController extends ChangeNotifier {
  final List<Users> userList = [];

  Future<void> getUserList(String page) async {
    final userListService = UserListService(baseUrl: 'https://reqres.in/api');

    try {
      final response = await userListService.getUserList(page);
      final userListPage = response as List<Users>;
      userList.addAll(userListPage);
      notifyListeners();
    } catch (error) {
      print('Hata oluştu: $error');
    }
  }
}
