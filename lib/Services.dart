import 'package:postgres/postgres.dart';

class Services {
  PostgreSQLConnection _connection;

  void initConnection() async {
    _connection = PostgreSQLConnection(
        "ec2-54-72-155-238.eu-west-1.compute.amazonaws.com",
        5432,
        "dc3q3pm0ldnl6b",
        username: "aplhckbqzvoqup",
        password:
            "2078ab958c6867f60c185e6626b919035dfae9a62020ecc7136a8d91a5219a33");

    try {
      await _connection.open();
      print("DB connected!");
    } catch (e) {
      print(e);
    }
  }

  void submitOnBoarding() async {
    await _connection.query("");
  }
}
