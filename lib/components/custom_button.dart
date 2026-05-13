import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
 final String title;
 final void Function()? onPressed;
  const CustomButton({
    super.key, required this.title, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          gradient:title == "Sign Up" ? kLightGradient : kDarkGradient),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        height: 60,
        onPressed: onPressed,
        child:
        Text(
          title,
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      ),
    );
  }
}
