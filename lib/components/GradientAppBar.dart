import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Color.fromRGBO(228, 36, 239, 1),
            Color.fromRGBO(117, 121, 255, 1)
          ],
        ),
      ),
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              wordSpacing: -4,
              fontWeight: FontWeight.w400,
              fontSize: 26.0),
        ),
      ),
    );
  }
}
