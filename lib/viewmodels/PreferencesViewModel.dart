import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

class PreferencesViewModel extends ChangeNotifier {
  final _usersTableRepo = UsersTableRepo();
  final _helper = QueryBaseHelper();
  var uid = SharedResources.getCurrentUser().uid;
  Map<String, bool> showMe = SharedResources.genderMap;
  int startAge;
  int endAge;

  void fetchShowMe(String uid) async {
    var response = await _usersTableRepo.fetchShowMe(uid);
    if (response != null && response.first[0] != null) {
      var temp = SharedResources.genderMap;
      for (var item in response.first[0]) {
        temp[item.toString()] = true;
      }
      showMe = temp;
      notifyListeners();
    }
  }

  Future<bool> updateShowMe(String uid, Map<String, bool> showMe) async {
    var result = false;
    List<String> temp = [];

    showMe.forEach((key, value) {
      if (value == true) {
        temp.add(key);
      }
    });

    if (temp.length != 0) {
      var response = await _usersTableRepo.updateShowMe(uid, temp);
      if (response != null) {
        result = true;
      }
    }
    return result;
  }

  void setNull() {
    startAge = null;
    endAge = null;
    notifyListeners();
  }

  void fetchStartAge(String uid) async {
    startAge = null;
    notifyListeners();
    var response = await _usersTableRepo.fetchStartAge(uid);
    if (response != null && response.first[0] != null) {
      startAge = response.first[0];
    } else {
      var response =
          await _helper.rawQuery("select age from users where uid='$uid'");
      startAge = response.first[0] - 2;
    }
    notifyListeners();
  }

  Future<bool> updateStartAge(String uid, int startAge) async {
    var result = false;
    var response = await _usersTableRepo.updateStartAge(uid, startAge);
    if (response != null) {
      result = true;
    }
    return result;
  }

  void fetchEndAge(String uid) async {
    endAge = null;
    notifyListeners();
    var response = await _usersTableRepo.fetchEndAge(uid);
    if (response != null && response.first[0] != null) {
      endAge = response.first[0];
    } else {
      var response =
          await _helper.rawQuery("select age from users where uid='$uid'");
      endAge = response.first[0] + 2;
    }
    notifyListeners();
  }

  Future<bool> updateEndAge(String uid, int endAge) async {
    var result = false;
    var response = await _usersTableRepo.updateEndAge(uid, endAge);
    if (response != null) {
      result = true;
    }
    return result;
  }
}
