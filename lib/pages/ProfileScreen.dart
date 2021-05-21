import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/pages/InterestsScreen.dart';
import 'package:no_faces/pages/OnBoarding.dart';

class ProfileScreen extends StatefulWidget {
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
                    backgroundImage: NetworkImage(
                        "https://img.buzzfeed.com/buzzfeed-static/static/2021-02/5/20/asset/cb4b9aaeff63/sub-buzz-1897-1612557676-39.png?crop=933%3A793%3B142%2C0&resize=475%3A%2A"),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rachel Green",
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
              trailing: Icon(CupertinoIcons.arrow_right),
              onTap: () => Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => InterestsScreen())),
            )
          ],
        ),
      ),
    );
  }
}
