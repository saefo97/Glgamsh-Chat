import 'package:chat_app/screens/log_in_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../components/background_decoration.dart';
import '../constants.dart';
import '../components/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
                tag: 'logo',

                child: Image.asset("assets/images/logo.png", height: 150)),
            Text(
              "Welcome to Our Chat App!",
              style: TextStyle(fontSize: 30, color: kMainColor),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: 'logIn',
                  child: CustomButton(
                    title: "Log In",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInScreen()),
                      );
                    },
                  ),
                ),
                Hero(
                  tag: 'signUp',
                  child: CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
