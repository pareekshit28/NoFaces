import 'package:flutter/cupertino.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';

class ProfileViewModel extends ChangeNotifier {
  String name = "loading..";
  String city = "loading..";
  final QueryBaseHelper _helper = QueryBaseHelper();

  ProfileViewModel() {
    var uid = SharedResources.getCurrentUser().uid;
    fetchProfile(uid);
  }

  void fetchProfile(String uid) async {
    var response = await _helper
        .rawQuery("select displayName,city from users where uid='$uid'");
    name = response.first[0];
    city = response.first[1];
    notifyListeners();
  }
}
