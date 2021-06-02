import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_faces/pages/HomeScreen.dart';
import 'package:no_faces/pages/LoginScreen.dart';
import 'package:no_faces/pages/OnBoarding.dart';

enum SignedState { signedIn, notSignedIn }

class GateKeeper extends StatefulWidget {
  @override
  _GateKeeperState createState() => _GateKeeperState();
}

class _GateKeeperState extends State<GateKeeper> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User user;
  SignedState signedState;
  @override
  void initState() {
    super.initState();
    checkIfUserIsSignedIn();
    currentUser();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      signedState =
          userSignedIn ? SignedState.signedIn : SignedState.notSignedIn;
    });
  }

  void currentUser() {
    var currentUser = _auth.currentUser;
    setState(() {
      user = currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signedState == SignedState.signedIn) {
      if (user.uid != null) {
        return HomeScreen();
      } else {
        return Center(child: CircularProgressIndicator());
      }
    } else {
      return LoginScreen();
    }
  }
}
