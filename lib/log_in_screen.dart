import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Log In",
          style: TextStyle(color: kMainColor, fontSize: 40),
        ),
        SizedBox(height: 16),
        CustomTextFormField(title: "Email"),
        SizedBox(height: 8),
        CustomTextFormField(title: "Password"),
        SizedBox(height: 8),
        CustomButton(title: "Log In",),

      ],
    );
  }
}

