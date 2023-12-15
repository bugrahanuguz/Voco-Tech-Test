import 'package:flutter/material.dart';
import 'package:voco_tech_test/widgets/constants/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

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
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
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
