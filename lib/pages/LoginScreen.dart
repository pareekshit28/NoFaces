import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-1, 1),
              end: Alignment(1, 1),
              colors: <Color>[
                Color.fromRGBO(228, 36, 239, 1),
                Colors.blue[600]
              ],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Text(
              "No Faces",
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  wordSpacing: -5,
                  fontSize: 35,
                  color: Colors.white),
            ),
            Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(child: SizedBox()),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/google_logo.png",
                          scale: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Sign in With Google",
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
