import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/models/UserProfileModel.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';

class OnBoardingViewModel extends ChangeNotifier {
  UsersTableRepo _usersTableRepo = UsersTableRepo();
  UserProfileModel profile;
  List<DropdownMenuItem<String>> genders = [];

  void getGenderDropdownItems() {
    List<DropdownMenuItem<String>> list = [];
    SharedResources.genderMap.keys.forEach((element) {
      list.add(DropdownMenuItem<String>(
        child: Text(element),
        value: element,
      ));
    });
    genders = list;
    notifyListeners();
  }

  void fetchUserProfile(String uid) async {
    profile = null;
    notifyListeners();
    var response = await _usersTableRepo.fetchProfile(uid);
    if (response != null && response.length > 0) {
      profile = UserProfileModel.fromRow(response.first);
    } else {
      profile = UserProfileModel.fromNull();
    }
    notifyListeners();
  }

  Future<bool> submitOnBoarding(String uid, String displayName, int age,
      String city, String gender, String email) async {
    var result = false;
    var response = await _usersTableRepo.submitOnBoarding(
        uid, displayName, age, city, gender, email);
    if (response != null) {
      result = true;
    }
    return result;
  }

  Future<bool> updateOnBoarding(String uid, String displayName, int age,
      String city, String gender) async {
    var result = false;
    var response = await _usersTableRepo.updateOnBoarding(
        uid, displayName, age, city, gender);
    if (response != null) {
      result = true;
    }
    return result;
  }

  void setNull() {
    profile = null;
    notifyListeners();
  }
}
