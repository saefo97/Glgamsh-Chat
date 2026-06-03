import 'package:flutter/material.dart';

Color kMainColor = Colors.yellow;

Color kLightColor1 = Colors.yellow.shade300;
Color kLightColor2 = Colors.yellow.shade500;

Color kDarkColor1 = Colors.yellow.shade700;
Color kDarkColor2 = Colors.yellow.shade900;

LinearGradient kLightGradient = LinearGradient(
  colors: [kLightColor2, kLightColor1],
  begin: AlignmentGeometry.topCenter,
  end: AlignmentGeometry.bottomCenter,
);

LinearGradient kDarkGradient = LinearGradient(
  colors: [kDarkColor2,kDarkColor1],
  begin: AlignmentGeometry.topCenter,
  end: AlignmentGeometry.bottomCenter,
);

LinearGradient kDarkGreen = LinearGradient(
  colors: [Colors.green.shade500, Colors.green.shade900],
  begin: AlignmentGeometry.topCenter,
  end: AlignmentGeometry.bottomCenter,
);
