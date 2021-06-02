import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:no_faces/Services.dart';
import 'package:no_faces/pages/GendersScreen.dart';
import 'package:no_faces/pages/InterestsScreen.dart';
import 'package:no_faces/pages/LoginScreen.dart';
import 'package:no_faces/pages/OnBoarding.dart';

class ProfileScreen extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Services _services = Services();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RangeValues _currentRangeValues = const RangeValues(18, 24);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              margin: EdgeInsets.all(0),
              child: Container(
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
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Interests",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  CupertinoIcons.right_chevron,
                                  size: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (context) => InterestsScreen()),
                            )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Show Me",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Women"),
                                    Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (context) => GendersScreen()),
                            )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Age Group",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RangeSlider(
                                values: _currentRangeValues,
                                min: 18,
                                max: 100,
                                divisions: 100 - 18,
                                labels: RangeLabels(
                                  _currentRangeValues.start.round().toString(),
                                  _currentRangeValues.end.round().toString(),
                                ),
                                onChanged: (values) {
                                  setState(() {
                                    _currentRangeValues = values;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.black12),
                        minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.9, 50)),
                        elevation: MaterialStateProperty.all(2),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {
                      widget._auth
                          .signOut()
                          .then((value) => widget._googleSignIn.signOut())
                          .then((value) => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              ((Route route) => false)));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.power_settings_new,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign Out",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.black12),
                        minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.9, 50)),
                        elevation: MaterialStateProperty.all(2),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Delete Account",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
