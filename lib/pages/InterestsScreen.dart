import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  int _num = 1;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          elevation: 10,
          title: Text("Question $_num of 10"),
        ),
        bottomNavigationBar: Row(
          children: [
            MaterialButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width * 0.5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                children: [
                  Icon(CupertinoIcons.arrow_left),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Previous"),
                ],
              ),
              onPressed: () {},
            ),
            MaterialButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width * 0.5,
              color: _selected == true ? Colors.lightBlueAccent : Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                children: [
                  Text("Next"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(CupertinoIcons.arrow_right),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Question",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Pick 5 of your most relevent Interests."),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Answer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (context, index) => CheckboxListTile(
                          title: Text((index + 1).toString()),
                          value: _selected,
                          onChanged: (value) {
                            setState(() {
                              _selected = value;
                            });
                          })),
                ),
              ],
            ),
          ),
        ));
  }
}
