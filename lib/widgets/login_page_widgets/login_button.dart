
import 'package:flutter/material.dart';
import 'package:voco_tech_test/controllers/login_controllers.dart';
import 'package:voco_tech_test/views/home_page.dart';
import 'package:voco_tech_test/widgets/constants/colors.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.loginController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final LoginController loginController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: ProjectColors.primaryColor,
          shape: const StadiumBorder(),
        ),
        onPressed: () async {
          if (!formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Lütfen alanlarınızı kontrol edin!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            return;
          }
          bool isSuccess = await loginController.loginUser(
              emailController.text, passwordController.text);
          isSuccess
              // ignore: use_build_context_synchronously
              ? Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const HomePage()))
              // ignore: use_build_context_synchronously
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      "Giriş başarısız oldu",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
        },
        child: const Text(
          "Giriş yap",
          style: TextStyle(
              color: ProjectColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}