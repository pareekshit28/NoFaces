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
    {
      "name": "Matt Leblanc",
      "st": "How you doin?",
      "dp": "https://1tb.favim.com/preview/7/770/7706/77063/7706317.jpg"
    },
    {
      "name": "Brad Pitt",
      "st": "Hey Aniston 👋",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904"
    },
    {
      "name": "Matt Leblanc",
      "st": "How you doin?",
      "dp": "https://1tb.favim.com/preview/7/770/7706/77063/7706317.jpg"
    },
    {
      "name": "Brad Pitt",
      "st": "Hey Aniston 👋",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904"
    },
    {
      "name": "Matt Leblanc",
      "st": "How you doin?",
      "dp": "https://1tb.favim.com/preview/7/770/7706/77063/7706317.jpg"
    },
    {
      "name": "Brad Pitt",
      "st": "Hey Aniston 👋",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904"
    },
    {
      "name": "Matt Leblanc",
      "st": "How you doin?",
      "dp": "https://1tb.favim.com/preview/7/770/7706/77063/7706317.jpg"
    },
    {
      "name": "Brad Pitt",
      "st": "Hey Aniston 👋",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904"
    },
    {
      "name": "Matt Leblanc",
      "st": "How you doin?",
      "dp": "https://1tb.favim.com/preview/7/770/7706/77063/7706317.jpg"
    },
    {
      "name": "Brad Pitt",
      "st": "Hey Aniston 👋",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904"
    },
    {
      "name": "Matt Leblanc",
      "st": "How you doin?",
      "dp": "https://1tb.favim.com/preview/7/770/7706/77063/7706317.jpg"
    },
    {
      "name": "Brad Pitt",
      "st": "Hey Aniston 👋",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904"
    },
    {
      "name": "Matt Leblanc",
      "st": "How you doin?",
      "dp": "https://1tb.favim.com/preview/7/770/7706/77063/7706317.jpg"
    },
    {
      "name": "Brad Pitt",
      "st": "Hey Aniston 👋",
      "dp":
          "https://static.wikia.nocookie.net/friends/images/b/b4/Will_Colbert.png/revision/latest?cb=20180427204904"
    },
  ];

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.list.length,
      itemBuilder: (context, index) => InkWell(
        child: Container(
          padding: index == 0
              ? EdgeInsets.only(left: 14.0, top: 60, bottom: 7)
              : EdgeInsets.only(left: 14.0, top: 7, bottom: 7),
          child: Row(children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                widget.list[index]["dp"],
              ),
            ),
            SizedBox(width: 14),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.list[index]["name"],
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    widget.list[index]["st"],
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ]),
        ),
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => ChatScreen(
                    name: widget.list[index]["name"],
                    dp: widget.list[index]["dp"],
                  )));
        },
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey,
        indent: 88,
        endIndent: 10,
        height: 0,
      ),
    );
  }
}
