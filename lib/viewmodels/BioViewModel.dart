import 'package:flutter/cupertino.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

class BioViewModel extends ChangeNotifier {
  final UsersTableRepo _usersTableRepo = UsersTableRepo();
  String bio;

  void fetchBio(String uid) async {
    bio = null;
    notifyListeners();
    var response = await _usersTableRepo.fetchBio(uid);
    if (response != null) {
      bio = response.first[0] == null ? "" : response.first[0];
    }
    notifyListeners();
  }

  void setNull() {
    bio = null;
    notifyListeners();
  }

  Future<bool> updateBio(String uid, String bio) async {
    var result = false;
    var response = await _usersTableRepo.updateBio(uid, bio);
    if (response != null) {
      result = true;
    }
    return result;
  }
}
