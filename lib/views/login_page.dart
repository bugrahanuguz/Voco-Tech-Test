import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_tech_test/controllers/login_controllers.dart';
import 'package:voco_tech_test/widgets/constants/extension.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/email_text_field.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/login_button.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/password_text_field.dart';

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
                    LoginButtonWidget(
                        formKey: formKey,
                        loginController: loginController,
                        emailController: emailController,
                        passwordController: passwordController),
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
