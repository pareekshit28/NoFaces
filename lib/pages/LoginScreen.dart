import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_faces/pages/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-1, 1),
              end: Alignment(1, 1),
              colors: <Color>[
                Color.fromRGBO(178, 36, 239, 1),
                Color.fromRGBO(117, 121, 255, 1)
              ],
              tileMode: TileMode.clamp),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.3),
              child: Text(
                "No Faces",
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                    wordSpacing: -5,
                    fontSize: 35,
                    color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.43),
              child: MaterialButton(
                color: Colors.transparent,
                minWidth: 240,
                height: 50,
                textColor: Colors.white,
                elevation: 0.1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                    side: BorderSide(color: Colors.redAccent)),
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
              alignment: Alignment(0, 0.6),
              child: MaterialButton(
                color: Colors.transparent,
                minWidth: 240,
                height: 50,
                textColor: Colors.white,
                elevation: 0.1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                    side: BorderSide(color: Colors.lightBlueAccent)),
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
                alignment: Alignment(0.2, 0.99),
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
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });
  }
}
