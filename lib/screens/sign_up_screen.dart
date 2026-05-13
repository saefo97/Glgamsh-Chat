import 'package:chat_app/components/background_decoration.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset("assets/images/logo.png", height: 75),
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(color: kMainColor, fontSize: 40),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextFormField(title: "Email"),
            SizedBox(height: 8),
            CustomTextFormField(title: "Password", isPassword: true),
            SizedBox(height: 8),
            CustomTextFormField(title: "Confirm Password", isPassword: true),
            SizedBox(height: 8),
            Hero(
              tag: 'signUp',
              child: CustomButton(title: "Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
