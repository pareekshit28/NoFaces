import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<Map<String, dynamic>> list = [
    {"label": Text("👋 Hi"), "selected": false},
    {"label": Text("✨ Sparkle"), "selected": false},
    {"label": Text("❤ Love"), "selected": false},
    {"label": Text("💩 Poop"), "selected": false},
    {"label": Text("😂 Laughing"), "selected": false},
    {"label": Text("🍺 Beer"), "selected": false},
    {"label": Text("😭 Crying"), "selected": false},
    {"label": Text("🎥 Film"), "selected": false},
    {"label": Text("🎶 Music"), "selected": false},
    {"label": Text("🤳 Selfie"), "selected": false}
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    list.asMap().forEach((key, value) {
      widgetList.add(ChoiceChip(
        onSelected: (value) {
          setState(() {
            list.elementAt(key)["selected"] = value;
          });
        },
        disabledColor: Colors.purple[50],
        selectedColor: Colors.purple[400],
        label: value["label"],
        selected: value["selected"],
        labelStyle: TextStyle(
            color: value["selected"] ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1),
      ));
    });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          title: Text("Interests"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, right: 7, left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Basic Interests",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          spacing: 10,
                          direction: Axis.horizontal,
                          children: widgetList,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 150,
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                  ),
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                ),
              ],
            ),
          ),
        ));
  }
}
