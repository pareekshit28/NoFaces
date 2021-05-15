import 'package:flutter/material.dart';
import '../components/GradientAppBar.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    const curveHeight = 60.0;
    return Scaffold(
        appBar: AppBar(
      flexibleSpace: Container(
        decoration: new ShapeDecoration(
          shape: const MyShapeBorder(curveHeight),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromRGBO(228, 36, 239, 1),
              Color.fromRGBO(117, 121, 255, 1)
            ],
          ),
        ),
      ),
    )
        // body: new Column(
        //   children: <Widget>[
        //     new GradientAppBar("Let's Get on  Board !"),
        //   ],
        // ),
        );
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
// Size get preferredSize => const Size.fromHeight(200);
// Container(
//         child: SizedBox.fromSize(
//           size: preferredSize,
//           child: new LayoutBuilder(builder: (context, constraint) {
//             final width = constraint.maxWidth * 8;
//             return new ClipRect(
//               child: new OverflowBox(
//                 maxHeight: double.infinity,
//                 maxWidth: double.infinity,
//                 child: new SizedBox(
//                   width: width,
//                   height: width - 750,
//                   child: new Padding(
//                     padding: new EdgeInsets.only(
//                         bottom: width / 2 - preferredSize.height / 2),
//                     child: new DecoratedBox(
//                       child: Align(
//                         alignment: Alignment(0, 0.9),
//                         child: Text(
//                           'About You',
//                           style: TextStyle(
//                             fontSize: 35,
//                             color: Colors.white,
//                             decoration: TextDecoration.none,
//                           ),
//                         ),
//                       ),
//                       decoration: new BoxDecoration(
//                         gradient: LinearGradient(
//                             begin: Alignment(-1, 1),
//                             end: Alignment(1, 1),
//                             colors: <Color>[
//                               Color.fromRGBO(228, 36, 239, 1),
//                               Colors.blue[600]
//                             ],
//                             tileMode: TileMode.clamp),
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           new BoxShadow(color: Colors.black54, blurRadius: 10.0)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
