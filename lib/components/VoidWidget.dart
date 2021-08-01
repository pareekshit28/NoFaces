import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VoidWidget extends StatelessWidget {
  const VoidWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/void.svg',
          height: 150,
          width: 150,
        ),
        SizedBox(
          height: 10,
        ),
        Text("Empty like a Void",
            style: TextStyle(fontStyle: FontStyle.italic)),
      ],
    );
  }
}
