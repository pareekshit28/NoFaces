import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:no_faces/models/UserProfileModel.dart';

enum Swipe { right, left }

typedef SwipeCallBack = Function(Swipe, String);
typedef Empty = Function(bool);

class ProfileCardStack extends StatefulWidget {
  final UserProfileModel profile;
  final SwipeCallBack callBack;

  final int index;
  const ProfileCardStack({this.profile, this.index, this.callBack});

  @override
  _ProfileCardStackState createState() => _ProfileCardStackState();
}

class _ProfileCardStackState extends State<ProfileCardStack> {
  StreamController<double> _controller = StreamController<double>();

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tags = List.generate(widget.profile.interests.length,
        (index) => Chip(label: Text(widget.profile.interests[index])));
    return Swipable(
      swipe: _controller.stream,
      child: Center(
        child: Card(
          elevation: widget.index.toDouble() + 5 >= 10
              ? 10
              : widget.index.toDouble() + 5,
          shadowColor: Color.fromRGBO(157, 171, 255, 0.3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(117, 121, 255, 0.7),
                    child: Icon(Icons.person_outline),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.profile.displayName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("${widget.profile.age}, ${widget.profile.city}"),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 8,
                    children: tags,
                  ),
                  SizedBox(
                    height: 10,
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
                          widget.profile.bio,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _controller.add(math.pi);
                        },
                        child: Container(
                          // padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Icon(
                            Icons.clear_rounded,
                            color: Colors.red[400],
                            size: 36,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.blueGrey,
                            size: 35,
                          ),
                          Text(
                            "Swipe",
                            style: TextStyle(fontSize: 22, letterSpacing: 1),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.blueGrey,
                            size: 35,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          _controller.add(math.pi / 4);
                        },
                        child: Container(
                          // padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Icon(
                            Icons.favorite,
                            size: 36,
                            color: Color.fromRGBO(157, 171, 255, 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onSwipeRight: (value) {
        widget.callBack(Swipe.right, widget.profile.uid);
      },
      onSwipeLeft: (value) {
        widget.callBack(Swipe.left, widget.profile.uid);
      },
    );
  }
}
