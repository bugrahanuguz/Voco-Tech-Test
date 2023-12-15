import 'package:flutter/material.dart';
import 'package:voco_tech_test/widgets/constants/extension.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/email_text_field.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/login_button.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/password_text_field.dart';
import 'package:voco_tech_test/widgets/login_page_widgets/register_button.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginPageAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    EmailTextField(emailController: _emailController),
                    SizedBox(height: context.height * 0.015),
                    PasswordTextFieldWidget(
                        passwordController: _passwordController),
                    SizedBox(height: context.height * 0.02),
                    LoginButton(formKey: _formKey),
                    const SizedBox(height: 8),
                    const RegisterButton(),
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
