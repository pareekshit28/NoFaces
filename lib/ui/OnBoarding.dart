import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: SizedBox.fromSize(
          size: preferredSize,
          child: new LayoutBuilder(builder: (context, constraint) {
            final width = constraint.maxWidth * 8;
            return new ClipRect(
              child: new OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: new SizedBox(
                  width: width,
                  height: width - 750,
                  child: new Padding(
                    padding: new EdgeInsets.only(
                        bottom: width / 2 - preferredSize.height / 2),
                    child: new DecoratedBox(
                      child: Align(
                        alignment: Alignment(0, 0.9),
                        child: Text(
                          'About You',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(-1, 1),
                            end: Alignment(1, 1),
                            colors: <Color>[
                              Color.fromRGBO(228, 36, 239, 1),
                              Colors.blue[600]
                            ],
                            tileMode: TileMode.clamp),
                        shape: BoxShape.circle,
                        boxShadow: [
                          new BoxShadow(color: Colors.black54, blurRadius: 10.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(200);
}
