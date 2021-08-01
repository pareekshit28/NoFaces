import 'package:no_faces/repos/UsersTableRepo.dart';
import 'package:postgresql2/postgresql.dart';

class InterestsViewModel {
  final UsersTableRepo _usersTableRepo = UsersTableRepo();

  Future<List<Row>> fetchInterests(String uid) async {
    var response = await _usersTableRepo.fetchInterests(uid);
    print(response);
    return response;
  }

  Future<bool> updateInterests(String uid, List<String> interests) async {
    var result = false;
    var response = await _usersTableRepo.updateInterests(uid, interests);
    if (response != null) {
      result = true;
    }
    return result;
  }
}
