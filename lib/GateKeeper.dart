import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_faces/models/UserProfileModel.dart';
import 'package:no_faces/pages/BioPage.dart';
import 'package:no_faces/pages/HomeScreen.dart';
import 'package:no_faces/pages/InterestsScreen.dart';
import 'package:no_faces/pages/LoginScreen.dart';
import 'package:no_faces/pages/OnBoarding.dart';
import 'package:no_faces/pages/PreferencesScreen.dart';
import 'package:no_faces/pages/SplashScreen.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

enum SignedState { signedIn, notSignedIn }

class GateKeeper extends StatefulWidget {
  @override
  _GateKeeperState createState() => _GateKeeperState();
}

class _GateKeeperState extends State<GateKeeper> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final UsersTableRepo _usersTableRepo = UsersTableRepo();
  User user;
  SignedState signedState;
  Widget _toPage;

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

  void fetchPage() async {
    var response = await _usersTableRepo.fetchProfile(user.uid);
    if (response.isEmpty) {
      setState(() {
        _toPage = OnBoarding(false);
      });
    } else {
      UserProfileModel model = UserProfileModel.fromRow(response.elementAt(0));
      if (model.interests == null) {
        setState(() {
          _toPage = InterestsScreen(false);
        });
      } else if (model.bio == null) {
        setState(() {
          _toPage = BioPage(false);
        });
      } else if (model.showMe == null ||
          model.startAge == null ||
          model.endAge == null) {
        setState(() {
          _toPage = PreferencesScreen(false);
        });
      } else {
        setState(() {
          _toPage = HomeScreen();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (signedState == SignedState.signedIn) {
      if (user.uid != null) {
        if (_toPage != null) {
          return _toPage;
        } else {
          fetchPage();
          return SplashScreen();
        }
      } else {
        return SplashScreen();
      }
    } else {
      return LoginScreen();
    }
  }
}
