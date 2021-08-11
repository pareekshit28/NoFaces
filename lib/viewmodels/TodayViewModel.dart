import 'package:flutter/cupertino.dart';
import 'package:no_faces/components/ProfileCardStack.dart';
import 'package:no_faces/components/VoidWidget.dart';
import 'package:no_faces/models/UserProfileModel.dart';
import 'package:no_faces/repos/DislikesTableRepo.dart';
import 'package:no_faces/repos/LikesTableRepo.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

class TodayViewModel extends ChangeNotifier {
  List<Widget> cards;
  final UsersTableRepo _usersTableRepo = UsersTableRepo();
  final _likesTableRepo = LikesTableRepo();
  final _dislikeTableRepo = DislikeTableRepo();

  void fetchRecommendations(String uid) async {
    cards = null;
    notifyListeners();
    var response = await _usersTableRepo.fetchRecommendations(uid);
    if (response != null) {
      cards = List<Widget>.generate(response.length + 1, (index) {
        if (index == 0) {
          return Center(child: VoidWidget());
        }
        return ProfileCardStack(
          profile: UserProfileModel.fromRow(response.elementAt(index - 1)),
          index: index - 1,
          callBack: (value, toUid) async {
            if (value == Swipe.right) {
              await _likesTableRepo.like(uid, toUid);
            } else {
              await _dislikeTableRepo.disLike(uid, toUid);
            }
          },
        );
      });
    } else {
      cards = [Center(child: VoidWidget())];
    }
    notifyListeners();
  }

  void setNull() {
    cards = null;
    notifyListeners();
  }
}
