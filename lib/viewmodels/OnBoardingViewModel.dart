import 'package:flutter/material.dart';
import 'package:no_faces/SharedResources.dart';
import 'package:no_faces/models/UserProfileModel.dart';
import 'package:no_faces/repos/UsersTableRepo.dart';
import 'package:postgresql2/postgresql.dart' as pg;

class OnBoardingViewModel {
  UsersTableRepo _usersTableRepo = UsersTableRepo();

  List<DropdownMenuItem<String>> getGenderDropdownItems() {
    List<DropdownMenuItem<String>> list = [];
    SharedResources.genderMap.keys.forEach((element) {
      list.add(DropdownMenuItem<String>(
        child: Text(element),
        value: element,
      ));
    });

    return list;
  }

  Future<UserProfileModel> fetchUserProfile(String uid) async {
    var response = await _usersTableRepo.fetchProfile(uid);
    return UserProfileModel.fromRow(response.elementAt(0));
  }

  Future<List<pg.Row>> submitOnBoarding(String uid, String displayName, int age,
      String city, String gender, String email) async {
    var response = await _usersTableRepo.submitOnBoarding(
        uid, displayName, age, city, gender, email);
    print(response);
    return response;
  }

  Future<List<pg.Row>> updateOnBoarding(String uid, String displayName, int age,
      String city, String gender) async {
    var response = await _usersTableRepo.updateOnBoarding(
        uid, displayName, age, city, gender);
    print(response);
    return response;
  }
}
