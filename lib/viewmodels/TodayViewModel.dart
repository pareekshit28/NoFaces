import 'package:flutter/cupertino.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/components/ProfileCardStack.dart';
import 'package:no_faces/components/VoidWidget.dart';
import 'package:no_faces/models/UserProfileModel.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

class TodayViewModel extends ChangeNotifier {
  List<Widget> cards = [Center(child: VoidWidget())];
  final UsersTableRepo _usersTableRepo = UsersTableRepo();

  TodayViewModel() {
    var uid = SharedResources.getCurrentUser().uid;
    fetchRecommendations(uid);
  }

  void fetchRecommendations(String uid) async {
    var response = await _usersTableRepo.fetchAllProfiles(uid);
    cards = List<Widget>.generate(response.length + 1, (index) {
      if (index == 0) {
        return Center(child: VoidWidget());
      }
      return ProfileCardStack(
        profile: UserProfileModel.fromRow(response.elementAt(index - 1)),
        index: index - 1,
        callBack: (value) {
          if (value == Swipe.right) {
            print("Right!");
          } else {
            print("Left!");
          }
        },
      );
    });
    notifyListeners();
  }
}
