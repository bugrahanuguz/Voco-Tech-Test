import 'package:flutter/material.dart';
import 'package:voco_tech_test/widgets/constants/colors.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isVisibility,
      obscuringCharacter: "*",
      validator: (value) {
        if (value!.length < 6) {
          return 'Şifreniz en az 6 karakter olmalıdır';
        }
        return null;
      },
      controller: widget._passwordController,
      style: TextStyle(color: ProjectColors.primaryColor),
      decoration: InputDecoration(
        hintText: "Şifrenizi giriniz",
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.4), fontWeight: FontWeight.w400),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: ProjectColors.primaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ProjectColors.primaryColor,
            width: 2,
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isVisibility = !isVisibility;
            });
          },
          child: Icon(
            isVisibility == true ? Icons.visibility : Icons.visibility_off,
            color: ProjectColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
