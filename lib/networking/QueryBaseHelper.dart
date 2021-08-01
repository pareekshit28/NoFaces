import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:postgresql2/postgresql.dart';

class QueryBaseHelper {
  factory QueryBaseHelper() {
    if (_this == null) {
      _this = QueryBaseHelper._getInstance();
    }
    return _this;
  }

  static QueryBaseHelper _this;

  QueryBaseHelper._getInstance() : super();

  Connection connection;

  Future<List<Row>> rawQuery(String fmtString) async {
    List<Row> result;
    if (connection == null || connection.state == ConnectionState.closed) {
      print("connecting");
      connection = await connect(dotenv.env['URI']);
    }
    try {
      result = await connection.query(fmtString).toList();
    } catch (e) {
      print(e);
    }
    return result;
  }

  void dispose() {
    connection.close();
  }
}
