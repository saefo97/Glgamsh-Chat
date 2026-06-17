
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              kLightColor1,
              kDarkColor2
            ],
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter

            )
        ),

        child: SpinKitSpinningLines(color: Colors.white,
          size: 120,
          lineWidth: 4,

        ));
  }
}
