import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/pages/LoginScreen.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

class ProfileViewModel extends ChangeNotifier {
  String name = "loading..";
  String city = "loading..";
  final _helper = QueryBaseHelper();
  final _userTableRepo = UsersTableRepo();
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final uid = SharedResources.getCurrentUser().uid;

  void fetchProfile(String uid) async {
    var response = await _helper
        .rawQuery("select displayName,city from users where uid='$uid'");
    name = response.first[0];
    city = response.first[1];
    notifyListeners();
  }

  void signOut(BuildContext context) async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        ((Route route) => false));
  }

  void deleteProfile(BuildContext context) async {
    var response = await _userTableRepo.deleteProfile(uid);
    if (response != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          ((Route route) => false));
    }
  }
}
