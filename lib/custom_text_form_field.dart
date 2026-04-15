
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextFormField extends StatelessWidget {
final  String title;
  const CustomTextFormField({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          label: Text(title, style: TextStyle(color:kDarkColor1),),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: kDarkColor1,
                  width: 2
              )
          ),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kDarkColor1,
                  width: 3
              )
          )
      ),
    );
  }
}
