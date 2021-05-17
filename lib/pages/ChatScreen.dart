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
        elevation: 10,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(widget.dp),
          ),
          title: Text(widget.name),
          subtitle: Text("Online"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                onPressed: () {}),
          )
        ],
        leadingWidth: 10,
      ),
      body: Stack(children: [
        ListView.builder(
            reverse: true,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(top: 12, right: 12, left: 12),
                  child: Align(
                    alignment:
                        index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
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
                              color: index % 2 == 0 ? Colors.grey : Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                                "Hellooooooooooooooooooooooooooooooooooooooooooooooooo"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("15:04"),
                        ),
                        index == 0
                            ? SizedBox(
                                height: 90,
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                )),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 80,
            margin: EdgeInsets.only(top: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(),
                )),
                MaterialButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.send_rounded),
                  ),
                  shape: CircleBorder(),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}