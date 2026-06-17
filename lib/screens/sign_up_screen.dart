import 'package:chat_app/auth_services.dart';
import 'package:chat_app/components/background_decoration.dart';
import 'package:chat_app/components/loading_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthService _authService = AuthService();
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;
  signUp() async {
    if(key.currentState!.validate()){
      setState(() {
        isLoading = true;
      });
      String? error = await _authService.signUp(
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
    return isLoading
        ? LoadingScreen()
        : Scaffold(
            body: Form(
              key: key,
              child: BackgroundDecoration(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 75,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(color: kMainColor, fontSize: 40),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      validator: (val) {
                        if(val!.isEmpty || val == null){
                          return "Please enter an email";
                        }
                        return null;
                      },

                      title: "Email", controller: email,),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      validator: (val) {
                        if(val!.isEmpty || val == null){
                          return "Please enter a password";
                        }else if(val . length <6){
                          return "weak password";

                        }
                        return null;
                      },

                      title: "Password", isPassword: true, controller: password,),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      validator: (val) {
                        if(val!.isEmpty || val == null){
                          return "Please enter a confirm password";
                        }else if(password.text.trim() != confirmPassword .text.trim()){
                          return "Not match the password";

                        }
                        return null;
                      },
                      title: "Confirm Password",
                      isPassword: true, controller: confirmPassword,
                    ),
                    SizedBox(height: 8),
                    Hero(
                      tag: 'signUp',
                      child: CustomButton(title: "Sign Up",
                      onPressed: (){
                        signUp();
                      },

                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
