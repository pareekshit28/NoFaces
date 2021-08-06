import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsModel {
  String fromUid;
  String toUid;
  String content;
  DateTime sentTime;
  bool read;

  ChatsModel(this.fromUid, this.toUid, this.content, this.sentTime, this.read);

  ChatsModel.fromSnapshot(QueryDocumentSnapshot snapshot) {
    this.fromUid = snapshot.get("fromuid");
    this.toUid = snapshot.get("touid");
    this.content = snapshot.get("content");
    this.sentTime = DateTime.fromMillisecondsSinceEpoch(
        snapshot.get("senttime").millisecondsSinceEpoch);
    this.read = snapshot.get("read");
  }
}
