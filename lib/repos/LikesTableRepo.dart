import 'package:no_faces/networking/QueryBaseHelper.dart';
import 'package:postgresql2/postgresql.dart';

class LikesTableRepo {
  var _helper = QueryBaseHelper();
  Future<List<Row>> like(String fromUid, String toUid) async {
    var dateTime = DateTime.now();
    var response = await _helper.rawQuery(
        "Insert into likes(fromuid,touid,senttime) values('$fromUid', '$toUid', '$dateTime')");
    return response;
  }

  Future<List<Row>> fetchLikes(String uid) async {
    var response = await _helper.rawQuery(
        "select u.* from users u, likes l where u.uid = l.fromuid and l.touid = '$uid' and l.accepted = false and l.fromuid not in (select touid from dislikes where fromuid = '$uid')");
    return response;
  }

  Future<List<Row>> accept(String fromUid, String toUid) async {
    var dateTime = DateTime.now();
    var response = await _helper.rawQuery(
        "update likes set accepted = true, accepttime = '$dateTime' where fromuid = '$fromUid' and touid = '$toUid'");
    return response;
  }

  Future<List<Row>> fetchChats(String uid) async {
    var response = await _helper.rawQuery(
        "select l.lid, u.uid, u.displayname, l.accepttime from users u, likes l where (fromuid = '$uid' and touid = u.uid and accepted = true) or (touid = '$uid' and fromuid = u.uid and accepted = true)");
    return response;
  }
}
