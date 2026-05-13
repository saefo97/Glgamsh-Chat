import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final bool isPassword;
   CustomTextFormField({
    super.key,
    required this.title,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? isHidden : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                color: kDarkColor2,
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {

                  });
                  print(isHidden);
                },
                icon: isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              )
            : null,
        label: Text(widget.title, style: TextStyle(color: kDarkColor1)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kDarkColor1, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: kDarkColor1, width: 3),
        ),
      ),
    );
  }
}
