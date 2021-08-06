import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:postgresql2/postgresql.dart';

class DislikeTableRepo {
  var _helper = QueryBaseHelper();
  Future<List<Row>> disLike(String fromUid, String toUid) async {
    var dateTime = DateTime.now();
    var response = await _helper.rawQuery(
        "Insert into dislikes(fromuid,touid,distime) values('$fromUid', '$toUid', '$dateTime')");
    return response;
  }
}
