import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_tech_test/controllers/login_controllers.dart';
import 'package:voco_tech_test/widgets/constants/colors.dart';
import 'package:voco_tech_test/widgets/constants/extension.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/email_text_field.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/password_text_field.dart';
import 'package:voco_tech_test/views/home_page.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isVisibility = false;
    final loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      appBar: loginPageAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    EmailTextField(emailController: emailController),
                    SizedBox(height: context.height * 0.015),
                    PasswordTextFieldWidget(
                        passwordController: passwordController),
                    SizedBox(height: context.height * 0.02),
                    SizedBox(
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
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar loginPageAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: const Text(
        "Giriş Yap",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
