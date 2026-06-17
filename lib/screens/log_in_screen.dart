import 'package:chat_app/components/background_decoration.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/forget_password_screen.dart';
import 'package:flutter/material.dart';
import '../auth_services.dart';
import '../constants.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  AuthService _authService = AuthService();
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  signIn() async {
    if(key.currentState!.validate()){
      setState(() {
        isLoading = true;
      });
      String? error = await _authService.signIn(
        email.text.trim(),
        password.text.trim(),
      );
      setState(() {
        isLoading = false;
      });
      if (error == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
              (route) => false,
        );
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LogInScreen() : Scaffold(
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
            CustomTextFormField(title: "Email", controller: email),
            SizedBox(height: 8),
            CustomTextFormField(
              title: "Password",
              isPassword: true,
              controller: password,
            ),
            SizedBox(height: 8),
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
              child: CustomButton(
                title: "Log In",
                onPressed: () {
                 signIn();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
