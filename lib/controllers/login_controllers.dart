
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voco_tech_test/services/login_service.dart';


final loginServiceProvider =
    Provider((ref) => LoginService(baseUrl: 'https://reqres.in/api'));

final loginControllerProvider = Provider((ref) => LoginController(ref));

final tokenProvider = Provider<String?>((ref) {
  return ref.watch(tokenSharedPreferencesProvider).value;
});

final tokenSharedPreferencesProvider = FutureProvider<String?>((ref) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_token');
});

final isVisibilityProvider = Provider<bool>((ref) {
  return false;
});

class LoginController {
  final ProviderRef<Object?> ref;

  LoginController(this.ref);

  Future<bool> loginUser(String email, String password) async {
    final loginService = ref.read(loginServiceProvider);

    try {
      final response = await loginService.login(email, password);
      await saveTokenToSharedPreferences(response);
      return response.isNotEmpty;
    } catch (error) {
      // Hata durumunda false döndür
      return false;
    }
  }

  Future<void> saveTokenToSharedPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
  }
}
