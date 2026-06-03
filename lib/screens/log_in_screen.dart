import 'package:chat_app/components/background_decoration.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/forget_password_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

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
                  "Log In",
                  style: TextStyle(color: kMainColor, fontSize: 40),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextFormField(title: "Email"),
            SizedBox(height: 8),
            CustomTextFormField(title: "Password", isPassword: true),
            Align(
              alignment: Alignment.centerRight,

              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: kDarkColor2),
                ),
              ),
            ),
            Hero(
              tag: 'logIn',
              child: CustomButton(title: "Log In",
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ),
                );
              },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
