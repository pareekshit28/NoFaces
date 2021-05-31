import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/Services.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';

class ProfileCardStack extends StatefulWidget {
  final List<Map<String, dynamic>> list;

  ProfileCardStack({this.list});

  @override
  _ProfileCardStackState createState() => _ProfileCardStackState();
}

class _ProfileCardStackState extends State<ProfileCardStack> {
  List<SwipeItem> _swipeItems = [];
  MatchEngine _matchEngine;

  @override
  Widget build(BuildContext context) {
    widget.list.asMap().forEach((key, value) {
      _swipeItems.add(SwipeItem(likeAction: () {
        print("Like!");
      }, nopeAction: () {
        print("Nope!");
      }, superlikeAction: () {
        print("Nope!");
      }));
    });

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    return SwipeCards(
      matchEngine: _matchEngine,
      itemBuilder: (BuildContext context, int index) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: (widget.list.length - index).toDouble() * 5 >= 20
            ? 20
            : (widget.list.length - index).toDouble() * 5,
        shadowColor: Color.fromRGBO(117, 121, 255, 1),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(117, 121, 255, 0.7),
                backgroundImage:
                    NetworkImage(widget.list.elementAt(index)["dp"]),
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.list.elementAt(index)["name"],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                  "${widget.list.elementAt(index)["age"]}, ${widget.list.elementAt(index)["city"]}"),
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
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Text(
                      widget.list.elementAt(index)["bio"],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _matchEngine.currentItem.nope();
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("✖"),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _matchEngine.currentItem.like();
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("❤"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onStackFinished: () {
        Provider.of<Services>(context, listen: false).setEmpty(true);
      },
    );
  }
}
