import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String dp;

  const ChatScreen({this.name, this.dp});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backgroundImage: NetworkImage(widget.dp),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.favorite_border_rounded,
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
          child: ListView.builder(
              reverse: true,
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(top: 15, right: 12, left: 12),
                    child: Align(
                      alignment: index % 2 == 0
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: index % 2 == 0
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: index % 2 == 0
                                      ? [
                                          Color.fromRGBO(106, 181, 249, 1),
                                          Color.fromRGBO(159, 140, 251, 1)
                                        ]
                                      : [
                                          Color.fromRGBO(244, 157, 159, 1),
                                          Color.fromRGBO(252, 188, 210, 1)
                                        ],
                                ),
                                borderRadius: index % 2 == 0
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(5),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(5),
                                        topRight: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Helloooooooooooo! ",
                                    style: TextStyle(fontSize: 15.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin:
                                  EdgeInsets.only(top: 5, right: 7, left: 7),
                              alignment: index % 2 == 0
                                  ? Alignment.bottomLeft
                                  : Alignment.bottomRight,
                              child: Text(
                                "15:04",
                                style: TextStyle(
                                    fontSize: 12.5,
                                    color: Colors.blueGrey[700]),
                              )),
                          index == 0
                              ? SizedBox(
                                  height: 90,
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  )),
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
                      maxLines: null,
                      scrollPadding: EdgeInsets.all(5),
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.grey[800], fontSize: 19),
                      decoration: InputDecoration(
                        hintText: 'Type message...',
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
                        onPressed: () {},
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
    );
  }
}
