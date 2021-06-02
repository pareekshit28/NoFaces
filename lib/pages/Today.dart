import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/Services.dart';
import 'package:no_faces/components/ProfileCardStack.dart';
import 'package:no_faces/pages/SearchPage.dart';
import 'package:provider/provider.dart';

class Today extends StatefulWidget {
  final _list = [
    {
      "name": "David Schwimmer",
      "bio":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "age": 54,
      "city": "New York",
      "dp":
          "https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/p-friends-david-schwimmer.jpg",
    },
    {
      "name": "Brad Pitt",
      "bio":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904",
      "age": 54,
      "city": "New York",
    },
    {
      "name": "David Schwimmer",
      "bio":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "age": 54,
      "city": "New York",
      "dp":
          "https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/p-friends-david-schwimmer.jpg",
    },
    {
      "name": "Brad Pitt",
      "bio":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904",
      "age": 54,
      "city": "New York",
    },
    {
      "name": "David Schwimmer",
      "bio":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "age": 54,
      "city": "New York",
      "dp":
          "https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/p-friends-david-schwimmer.jpg",
    },
    {
      "name": "Brad Pitt",
      "bio":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904",
      "age": 54,
      "city": "New York",
    },
  ];

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    widget._list.length != 0
        ? Provider.of<Services>(context, listen: false).setEmpty(false)
        : Provider.of<Services>(context, listen: false).setEmpty(true);
    return Consumer<Services>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: Column(
            children: [
              value.empty == false
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        ProfileCardStack(
                          list: widget._list,
                        ),
                      ],
                    )
                  : Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Text(
                        '"No requests yet"',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ]),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 50,
                minWidth: 150,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Text("🔎  Find People"),
                color: Color.fromRGBO(159, 140, 251, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
