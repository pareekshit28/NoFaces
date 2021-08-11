import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:no_faces/models/FavoriteProfileModel.dart';
import 'package:no_faces/repos/LikesTableRepo.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<FavoriteProfileModel> profiles;
  final _likesTableRepo = LikesTableRepo();
  final db = FirebaseFirestore.instance.collection("data").doc("chats");

  void fetchChats(String uid) async {
    profiles = null;
    notifyListeners();
    var response = await _likesTableRepo.fetchChats(uid);
    if (response != null && response.length > 0) {
      List<FavoriteProfileModel> temp = [];
      for (int i = 0; i < response.length; i++) {
        String subTitle = "Say Hi";
        var ref = await db
            .collection(response.elementAt(i)[0].toString())
            .orderBy("senttime", descending: true)
            .limit(1)
            .get();
        if (ref != null && ref.size > 0) {
          subTitle = ref.docs.elementAt(0)["content"];
        }
        temp.add(FavoriteProfileModel.fromRow(response.elementAt(i), subTitle));
      }
      profiles = temp;
    } else {
      profiles = [];
    }
    notifyListeners();
  }

  void setNull() {
    profiles = null;
    notifyListeners();
  }
}
