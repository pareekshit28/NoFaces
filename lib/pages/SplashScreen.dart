import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(157, 171, 255, 1),
      Color.fromRGBO(159, 140, 251, 1)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "No Faces",
        style: new TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = linearGradient),
      ),
    ));
  }
}
