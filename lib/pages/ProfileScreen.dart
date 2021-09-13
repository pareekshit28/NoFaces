import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/pages/BioPage.dart';
import 'package:no_faces/pages/InterestsScreen.dart';
import 'package:no_faces/pages/OnBoarding.dart';
import 'package:no_faces/pages/PreferencesScreen.dart';
import 'package:no_faces/viewmodels/ProfileViewModel.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var uid = SharedResources.getCurrentUser().uid;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10), () => init());
  }

  void init() {
    Provider.of<ProfileViewModel>(context, listen: false).fetchProfile(uid);
  }

  @override
  Widget build(BuildContext context) {
    final _viewModel = ProfileViewModel();
    return Consumer<ProfileViewModel>(builder:
        (BuildContext context, ProfileViewModel viewModel, Widget child) {
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
                        child: Icon(Icons.person),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.name,
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(Icons.location_on_outlined),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(viewModel.city),
                              )
                            ])
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.edit_outlined),
                          onPressed: () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                  builder: (context) => OnBoarding(true)))),
                    ]),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black12),
                            minimumSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width * 0.9, 50)),
                            elevation: MaterialStateProperty.all(2),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => InterestsScreen(true)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Update Tags",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              size: 10,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black12),
                            minimumSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width * 0.9, 50)),
                            elevation: MaterialStateProperty.all(2),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => BioPage(true)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Update Bio",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              size: 10,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black12),
                            minimumSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width * 0.9, 50)),
                            elevation: MaterialStateProperty.all(2),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => PreferencesScreen(true)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Update Preferences",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              size: 10,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(indent: 18, endIndent: 18, height: 40),
                    ElevatedButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.9, 50)),
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                      onPressed: () {
                        _viewModel.signOut(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.power_settings_new,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign Out",
                            style: TextStyle(
                                color: Colors.black,
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
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.9, 50)),
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                      onPressed: () {
                        _viewModel.deleteProfile(context);
                      },
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
    });
  }
}
