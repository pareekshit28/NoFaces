import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsViewModel {
  final db = FirebaseFirestore.instance.collection("data").doc("chats");

  void sendChat(int groupId, String fromUid, String toUid, String content) {
    var sentTime = DateTime.now();
    db.collection(groupId.toString()).add({
      "fromuid": fromUid,
      "touid": toUid,
      "content": content,
      "senttime": sentTime,
      "read": false
    });
  }

  void unSendChat(int groupId, String id) {
    db.collection(groupId.toString()).doc(id).delete();
  }
}
