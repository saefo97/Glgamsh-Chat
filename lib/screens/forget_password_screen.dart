import 'package:chat_app/components/background_decoration.dart';
import 'package:flutter/material.dart';
import '../components/custom_animated_button.dart';
import '../components/custom_text_form_field.dart';
import '../constants.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                  "Forget Password",
                  style: TextStyle(color: kMainColor, fontSize: 28),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextFormField(title: "Email"),
            SizedBox(height: 8),
            CustomAnimatedButton(
            ),
          ],
        ),
      ),
    );
  }
}
