import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_faces/GateKeeper.dart';

class LoginScreen extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(244, 157, 159, 1),
      Color.fromRGBO(252, 188, 210, 1)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 70.0));

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    const curveHeight = 60.0;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 270,
        flexibleSpace: Container(
          child: Align(
            alignment: Alignment(0, 0.8),
            // child: Text(
            //   "Let's Get on Board!",
            //   style: TextStyle(
            //       color: Colors.white,
            //       letterSpacing: 1.3,
            //       wordSpacing: -2,
            //       fontWeight: FontWeight.w500,
            //       fontSize: 28.0),
            // ),
            child: Text(
              "No Faces",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                letterSpacing: 2.3,
                wordSpacing: -5,
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // foreground: Paint()..shader = widget.linearGradient
              ),
            ),
          ),
          decoration: new ShapeDecoration(
            shape: const MyShapeBorder(curveHeight),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromRGBO(157, 171, 255, 1),
                Color.fromRGBO(159, 140, 251, 1)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       begin: Alignment(-1, 1),
        //       end: Alignment(1, 1),
        //       colors: <Color>[
        //         Color.fromRGBO(178, 36, 239, 1),
        //         Color.fromRGBO(117, 121, 255, 1)
        //       ],
        //       tileMode: TileMode.clamp),
        // ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.6),
            ),
            Align(
              alignment: Alignment(0, 0.23),
              child: MaterialButton(
                color: Colors.white,
                minWidth: 240,
                height: 50,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person_outline),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Sign in With Username",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.62),
              child: MaterialButton(
                color: Colors.white,
                minWidth: 240,
                height: 50,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                onPressed: () {
                  onGoogleSignIn(context);
                },
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
            ),
            Align(
                alignment: Alignment(0.09, 0.99),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.circle,
                        size: 5,
                        color: Colors.black45,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Terms of Service",
                        style: TextStyle(fontSize: 13),
                      ),
                    )
                  ],
                )),
            Align(
              alignment: Alignment.center,
              child: _loading == true
                  ? CircularProgressIndicator.adaptive()
                  : SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await widget._googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    User user = (await widget._auth.signInWithCredential(credential)).user;

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    setState(() {
      _loading = true;
    });
    await signInWithGoogle().then((value) {
      _loading = false;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => GateKeeper()),
          (route) => false);
    });
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
