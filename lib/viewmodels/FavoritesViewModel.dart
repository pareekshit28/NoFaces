import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:no_faces/models/FavoriteProfileModel.dart';
import 'package:no_faces/repos/LikesTableRepo.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<FavoriteProfileModel> profiles = [];
  final _likesTableRepo = LikesTableRepo();
  final db = FirebaseFirestore.instance.collection("data").doc("chats");

  void fetchChats(String uid) async {
    var response = await _likesTableRepo.fetchChats(uid);
    if (response != null) {
      List<FavoriteProfileModel> temp = [];
      for (var item in response) {
        String subTitle = "Say Hi";
        var ref = await db
            .collection(item[0].toString())
            .orderBy("senttime", descending: true)
            .limit(1)
            .get();
        if (ref != null && ref.size > 0) {
          subTitle = ref.docs.elementAt(0)["content"];
        }
        temp.add(FavoriteProfileModel.fromRow(response.first, subTitle));
      }
      profiles = temp;
      notifyListeners();
    }
  }
}
