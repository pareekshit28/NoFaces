import 'package:postgresql2/postgresql.dart';

class UserProfileModel {
  String uid;
  String displayName;
  int age;
  String city;
  String gender;
  String bio;
  List interests;
  DateTime regTime;
  String email;
  int startAge;
  int endAge;
  List showMe;

  UserProfileModel(
    this.uid,
    this.displayName,
    this.age,
    this.city,
    this.gender,
    this.bio,
    this.interests,
    this.regTime,
    this.email,
    this.startAge,
    this.endAge,
    this.showMe,
  );

  UserProfileModel.fromRow(Row row) {
    uid = row[0];
    displayName = row[1];
    age = row[2];
    city = row[3];
    gender = row[4];
    bio = row[5];
    interests = row[6];
    regTime = row[7];
    email = row[8];
    startAge = row[9];
    endAge = row[10];
    showMe = row[11];
  }

  UserProfileModel.fromNull() {
    displayName = "";
    age = 0;
    city = "";
    gender = null;
  }

  @override
  String toString() {
    List temp = [
      uid,
      displayName,
      age,
      city,
      gender,
      bio,
      interests,
      regTime,
      email,
      startAge,
      endAge,
      showMe
    ];
    return temp.toString();
  }
}
