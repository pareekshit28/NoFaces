import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/pages/ChatScreen.dart';

class Today extends StatefulWidget {
  final list = [
    {
      "name": "David Schwimmer",
      "st": "We were on a break!",
      "dp":
          "https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/p-friends-david-schwimmer.jpg"
    },
  ];

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 92.0),
            child: Text("Today's Pick",
                style: TextStyle(
                    color: Colors.blue[700],
                    letterSpacing: 1.3,
                    wordSpacing: -2,
                    fontWeight: FontWeight.w700,
                    fontSize: 28.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 28.0, left: 28, top: 32, bottom: 28),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 7,
              shadowColor: Color.fromRGBO(117, 121, 255, 1),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(117, 121, 255, 0.7),
                      backgroundImage: NetworkImage(widget.list[0]["dp"]),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "David Schwimmer",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("54, New York"),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Summary",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      elevation: 5,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => ChatScreen(
                                  name: widget.list[0]["name"],
                                  dp: widget.list[0]["dp"],
                                )));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                      color: Color.fromRGBO(117, 121, 255, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Chat",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(CupertinoIcons.arrow_right),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
