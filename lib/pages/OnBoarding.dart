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
        toolbarHeight: 50,
        flexibleSpace: Container(
          child: Align(
            alignment: Alignment(0, 1.5),
            child: Text(
              'Lets Get on Board',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.3,
                  wordSpacing: -2,
                  fontWeight: FontWeight.w500,
                  fontSize: 28.0),
            ),
          ),
          decoration: new ShapeDecoration(
            shape: const MyShapeBorder(curveHeight),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromRGBO(178, 36, 239, 1),
                Color.fromRGBO(117, 121, 255, 1)
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Color.fromRGBO(117, 121, 255, 1)),
              ),
              SizedBox(
                height: 70,
              ),
              TextField(
                cursorColor: Colors.purple,
                style: TextStyle(
                    color: Color.fromRGBO(42, 42, 42, 1), fontSize: 22),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromRGBO(157, 171, 255, 1),
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(157, 171, 255, 1),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(178, 36, 239, 1), width: 1.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(157, 171, 255, 1)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                cursorColor: Colors.purple,
                style: TextStyle(
                    color: Color.fromRGBO(42, 42, 42, 1), fontSize: 22),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.face,
                    color: Color.fromRGBO(157, 171, 255, 1),
                  ),
                  labelText: 'Gender',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(157, 171, 255, 1),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(178, 36, 239, 1), width: 1.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(157, 171, 255, 1)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                cursorColor: Colors.purple,
                style: TextStyle(
                    color: Color.fromRGBO(42, 42, 42, 1), fontSize: 22),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.place,
                    color: Color.fromRGBO(157, 171, 255, 1),
                  ),
                  labelText: 'Place',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(157, 171, 255, 1),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(178, 36, 239, 1), width: 1.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(157, 171, 255, 1)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
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
//                               Color.fromRGBO(178, 36, 239, 1),
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
