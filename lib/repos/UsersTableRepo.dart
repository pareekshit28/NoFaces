import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:postgresql2/postgresql.dart';

class UsersTableRepo {
  QueryBaseHelper _helper = QueryBaseHelper();

  Future<List<Row>> fetchProfile(String uid) async {
    var response =
        await _helper.rawQuery("Select * from users where uid='$uid'");
    return response;
  }

  Future<List<Row>> fetchRecommendations(String uid) async {
    var response = await _helper.rawQuery(
        "select * from users where uid != '$uid' and gender in (select unnest(showme) from users where uid = '$uid') and (age between (select startage from users where uid = '$uid') and (select endage from users where uid = '$uid')) and uid not in (select touid from likes where fromuid = '$uid') and uid not in (select fromuid from likes where touid = '$uid') and uid not in (select touid from dislikes where fromuid = '$uid')");
    return response;
  }

  Future<List<Row>> deleteProfile(String uid) async {
    var response =
        await _helper.rawQuery("delete from users where uid = '$uid'");
    return response;
  }

  Future<List<Row>> submitOnBoarding(String uid, String displayName, int age,
      String city, String gender, String email) async {
    DateTime dateTime = DateTime.now();
    var response = await _helper.rawQuery(
        "Insert into users(uid,displayName,age,city,gender,email,regTime) values('$uid', '$displayName', $age, '$city','$gender','$email','$dateTime')");
    return response;
  }

  Future<List<Row>> updateOnBoarding(String uid, String displayName, int age,
      String city, String gender) async {
    var response = await _helper.rawQuery(
        "Update users set displayname='$displayName',age=$age,city='$city',gender='$gender' where uid = '$uid'");
    return response;
  }

  Future<List<Row>> fetchBio(String uid) async {
    var response =
        await _helper.rawQuery("Select bio from users where uid='$uid'");
    return response;
  }

  Future<List<Row>> updateBio(String uid, String bio) async {
    var response = await _helper
        .rawQuery("Update users set bio='$bio' where uid = '$uid'");
    return response;
  }

  Future<List<Row>> fetchInterests(String uid) async {
    var response =
        await _helper.rawQuery("Select interests from users where uid='$uid'");
    return response;
  }

  Future<List<Row>> updateInterests(String uid, List<String> interests) async {
    if (interests == null) {
      var response = await _helper
          .rawQuery("Update users set interests=null where uid='$uid'");
      return response;
    } else {
      String temp = "[";
      for (int i = 0; i < interests.length; i++) {
        temp = temp + "'" + interests.elementAt(i) + "'";
        if (i != interests.length - 1) {
          temp = temp + ",";
        }
      }
      temp = temp + "]";
      var response = await _helper
          .rawQuery("Update users set interests=array$temp where uid='$uid'");
      return response;
    }
  }

  Future<List<Row>> fetchShowMe(String uid) async {
    var response =
        await _helper.rawQuery("Select showme from users where uid='$uid'");
    return response;
  }

  Future<List<Row>> updateShowMe(String uid, List<String> showMe) async {
    String temp = "[";
    for (int i = 0; i < showMe.length; i++) {
      temp = temp + "'" + showMe.elementAt(i) + "'";
      if (i != showMe.length - 1) {
        temp = temp + ",";
      }
    }
    temp = temp + "]";
    var response = await _helper
        .rawQuery("Update users set showme=array$temp where uid = '$uid'");
    return response;
  }

  Future<List<Row>> fetchStartAge(String uid) async {
    var response =
        await _helper.rawQuery("Select startage from users where uid='$uid'");
    return response;
  }

  Future<List<Row>> updateStartAge(String uid, int startAge) async {
    var response = await _helper
        .rawQuery("Update users set startage='$startAge' where uid = '$uid'");
    return response;
  }

  Future<List<Row>> fetchEndAge(String uid) async {
    var response =
        await _helper.rawQuery("Select endage from users where uid='$uid'");
    return response;
  }

  Future<List<Row>> updateEndAge(String uid, int endAge) async {
    var response = await _helper
        .rawQuery("Update users set endage='$endAge' where uid = '$uid'");
    return response;
  }
}
