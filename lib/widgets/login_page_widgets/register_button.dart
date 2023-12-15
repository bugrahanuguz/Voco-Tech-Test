import 'package:flutter/material.dart';
import 'package:voco_tech_test/widgets/constants/colors.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const RegisterPage()));
          },
          child: Text(
            "Hesabın yok mu? Kayıt ol",
            style: TextStyle(color: ProjectColors.primaryColor.withOpacity(0.4)),
          ),
        );
  }
}