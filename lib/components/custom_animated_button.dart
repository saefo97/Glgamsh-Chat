


import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration: Duration(
          milliseconds: 350
      ),
      width: isClicked ? 225 : 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        gradient: isClicked ? kDarkGreen  : kLightGradient,
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        height: 60,
        onPressed: isClicked ? null    : () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Row(
          mainAxisAlignment:   isClicked ?  MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
          children: [
            Text(
              isClicked ?  "Sent!"   :  "Send",
              style: TextStyle(fontSize: 28.0, color: Colors.white),
            ),
            isClicked ?          Icon(Icons.check,size: 30, color: Colors.white,)
                :Container()
          ],
        ),
      ),
    );
  }
}
