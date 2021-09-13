import 'package:flutter/material.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

class InterestsViewModel extends ChangeNotifier {
  final _usersTableRepo = UsersTableRepo();
  List<String> tags;

  void fetchInterests(String uid) async {
    tags = null;
    notifyListeners();
    var response = await _usersTableRepo.fetchInterests(uid);
    var temp = <String>[];
    if (response != null && response.first[0] != null) {
      for (var item in response.first[0]) {
        temp.add(item);
      }
    }

    tags = temp;
    notifyListeners();
  }

  void setNull() {
    tags = null;
    notifyListeners();
  }

  void add(String value) {
    tags.add(value);
    notifyListeners();
  }

  void remove(String value) {
    tags.remove(value);
    notifyListeners();
  }

  Future<bool> updateInterests(String uid, List<String> interests) async {
    var result = false;
    var response = await _usersTableRepo.updateInterests(uid, interests);
    if (response != null) {
      result = true;
    }
    return result;
  }
}
