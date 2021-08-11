import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/models/ChatsModel.dart';
import 'package:no_faces/viewmodels/ChatsViewModel.dart';

typedef BoolValue = Function();

class ChatScreen extends StatefulWidget {
  final int id;
  final String name;
  final String toUid;
  final BoolValue callback;

  const ChatScreen({this.id, this.name, this.toUid, this.callback});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final db = FirebaseFirestore.instance.collection("data").doc("chats");
  final uid = SharedResources.getCurrentUser().uid;
  final _viewModel = ChatsViewModel();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      widget.callback();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
          ),
          // toolbarHeight: 70,
          // titleSpacing: 0,
          // title: ListTile(
          //   leading: InkWell(
          //     onTap: () => Navigator.pop(context),
          // child: CircleAvatar(
          //   backgroundColor: Colors.transparent,
          //   backgroundImage: NetworkImage(widget.dp),
          // ),
          //   ),
          //   title: Text(widget.name),
          //   subtitle: Text(
          //     "Online",
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //     child: IconButton(
          //         icon: Icon(
          //           Icons.favorite_border_outlined,
          //         ),
          //         onPressed: () {}),
          //   )
          // ],
          // leadingWidth: 50,
        ),
        body: Stack(children: [
          Scrollbar(
            child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection(widget.id.toString())
                    .orderBy("senttime", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  snapshot.hasData ? print(snapshot.data.docs) : print("error");
                  return snapshot.hasData
                      ? snapshot.data.docs.length > 0
                          ? Column(
                              children: [
                                Spacer(),
                                ListView.builder(
                                    reverse: true,
                                    itemCount: snapshot.data.size,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var chat = ChatsModel.fromSnapshot(
                                          snapshot.data.docs.elementAt(index));
                                      return Container(
                                        margin: EdgeInsets.only(
                                            top: 15, right: 12, left: 12),
                                        child: Align(
                                          alignment: chat.fromUid == uid
                                              ? Alignment.topRight
                                              : Alignment.topLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                chat.fromUid == uid
                                                    ? CrossAxisAlignment.end
                                                    : CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.8,
                                                ),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: chat.fromUid ==
                                                              uid
                                                          ? [
                                                              Color.fromRGBO(
                                                                  244,
                                                                  157,
                                                                  159,
                                                                  1),
                                                              Color.fromRGBO(
                                                                  252,
                                                                  188,
                                                                  210,
                                                                  1)
                                                            ]
                                                          : [
                                                              Color.fromRGBO(
                                                                  106,
                                                                  181,
                                                                  249,
                                                                  1),
                                                              Color.fromRGBO(
                                                                  159,
                                                                  140,
                                                                  251,
                                                                  1)
                                                            ],
                                                    ),
                                                    borderRadius: chat
                                                                .fromUid ==
                                                            uid
                                                        ? BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5),
                                                            topRight:
                                                                Radius.circular(
                                                                    20))
                                                        : BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            bottomLeft:
                                                                Radius.circular(5),
                                                            topRight: Radius.circular(20),
                                                            bottomRight: Radius.circular(20))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        chat.content,
                                                        style: TextStyle(
                                                            fontSize: 15.5),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      right: 7,
                                                      left: 7),
                                                  alignment: chat.fromUid == uid
                                                      ? Alignment.bottomRight
                                                      : Alignment.bottomLeft,
                                                  child: Text(
                                                    chat.sentTime.hour
                                                            .toString() +
                                                        ":" +
                                                        chat.sentTime.minute
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 12.5,
                                                        color: Colors
                                                            .blueGrey[700]),
                                                  )),
                                              index == 0
                                                  ? SizedBox(
                                                      height: 90,
                                                    )
                                                  : SizedBox()
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            )
                          : Center(
                              child: Text("Start a Conversation"),
                            )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: BoxConstraints(maxHeight: 150, minHeight: 50),
              margin: EdgeInsets.only(top: 8),
              color: Colors.white,
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15, 5, 15),
                      child: TextField(
                        controller: _controller,
                        maxLines: null,
                        scrollPadding: EdgeInsets.all(5),
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(color: Colors.grey[800], fontSize: 19),
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 12, 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(252, 188, 210, 1),
                                width: 1.25),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(244, 157, 159, 1),
                              ),
                              borderRadius: BorderRadius.circular(32)),
                        ),
                      ),
                    ),
                    flex: 11,
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                        child: MaterialButton(
                          onPressed: () {
                            _viewModel.sendChat(
                                widget.id, uid, widget.toUid, _controller.text);
                            _controller.clear();
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                            child: Icon(
                              Icons.send_rounded,
                              color: Color.fromRGBO(244, 157, 159, 1),
                              size: 30,
                            ),
                          ),
                          height: 45,
                          shape: CircleBorder(),
                          color: Colors.white,
                          elevation: 0,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ]),
        backgroundColor: Colors.white,
      ),
    );
  }

  Future<bool> _willPopCallback() async {
    widget.callback();
    return true;
  }
}
