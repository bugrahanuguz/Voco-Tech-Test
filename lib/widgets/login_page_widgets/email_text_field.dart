import 'package:flutter/material.dart';
import 'package:voco_tech_test/widgets/constants/colors.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.emailController});
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value) {
        final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(value.toString());
        return !emailValid ? "Geçerli bir email giriniz" : null;
      },
      controller: emailController,
      style: const TextStyle(color: ProjectColors.primaryColor),
      decoration: InputDecoration(
        hintText: "Email giriniz",
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.4), fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: const Icon(Icons.email, color: ProjectColors.primaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ProjectColors.primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}