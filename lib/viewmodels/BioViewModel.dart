import 'package:no_faces/repos/UsersTableRepo.dart';
import 'package:postgresql2/postgresql.dart';

class BioViewModel {
  final UsersTableRepo _usersTableRepo = UsersTableRepo();

  Future<List<Row>> fetchBio(String uid) async {
    var response = await _usersTableRepo.fetchBio(uid);
    print(response);
    return response;
  }

  Future<List<Row>> updateBio(String uid, String bio) async {
    var response = await _usersTableRepo.updateBio(uid, bio);
    print(response);
    return response;
  }
}
