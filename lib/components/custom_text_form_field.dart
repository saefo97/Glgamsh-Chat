import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final bool isPassword;
  final TextEditingController controller;
  String? Function(String?)? validator;
   CustomTextFormField({
    super.key,
    required this.title,
    this.isPassword = false, required this.controller,
     this.validator
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:widget. validator,
      controller: widget . controller,
      obscureText: widget.isPassword ? isHidden : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                color: kDarkColor2,
                onPressed: () {

                  setState(() {
                    isHidden = !isHidden;
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
        ),     errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red.shade900, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade700, width: 3),
        ),
      ),
    );
  }
}
