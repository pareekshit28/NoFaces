import 'package:flutter/cupertino.dart';
import 'package:postgres/postgres.dart';

class Services with ChangeNotifier {
  bool empty = true;

  void setEmpty(bool value) {
    empty = value;
    notifyListeners();
  }

  static final connection = PostgreSQLConnection(
      "ec2-54-72-155-238.eu-west-1.compute.amazonaws.com",
      5432,
      "dc3q3pm0ldnl6b",
      username: "aplhckbqzvoqup",
      password:
          "2078ab958c6867f60c185e6626b919035dfae9a62020ecc7136a8d91a5219a33",
      useSSL: true);

  static Future initConnection() async {
    try {
      await connection.open();
    } catch (e) {
      print(e);
    }
  }

  void submitOnBoarding(
      String uid, String displayName, int age, String city, String bio) async {
    connection.isClosed
        ? print("Connection is not open!")
        : await connection
            .query(
                "INSERT INTO users(uid,displayName,age,city,bio) VALUES('2','$displayName',$age,'$city','$bio')")
            .then((value) => print(value))
            .catchError((e) => print(e));
  }
}
