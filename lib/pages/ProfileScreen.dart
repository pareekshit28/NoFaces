import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_faces/pages/InterestsScreen.dart';
import 'package:no_faces/pages/LoginScreen.dart';
import 'package:no_faces/pages/OnBoarding.dart';

class ProfileScreen extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 22.0, top: 20, right: 10, bottom: 20),
                child: Row(children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        NetworkImage(widget._auth.currentUser.photoURL),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget._auth.currentUser.displayName,
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.location_on_outlined),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              "New York",
                            ),
                          )
                        ])
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.edit_outlined),
                      onPressed: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                              builder: (context) => OnBoarding()))),
                ]),
              ),
            ),
            ListTile(
              title: Text("Interests"),
              leading: Icon(Icons.recommend),
              onTap: () => Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => InterestsScreen())),
            ),
            ListTile(
                title: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.red),
                ),
                leading: Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                onTap: () {
                  widget._auth
                      .signOut()
                      .then((value) => widget._googleSignIn.signOut())
                      .then((value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          ((Route route) => false)));
                })
          ],
        ),
      ),
    );
  }
}
