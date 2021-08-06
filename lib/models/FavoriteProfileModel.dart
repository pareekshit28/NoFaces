import 'package:postgresql2/postgresql.dart';

class FavoriteProfileModel {
  int lid;
  String uid;
  String displayName;
  DateTime acceptTime;
  String subTitle;

  FavoriteProfileModel(
      this.lid, this.uid, this.displayName, this.acceptTime, this.subTitle);

  FavoriteProfileModel.fromRow(Row row, String subTitle) {
    this.lid = row[0];
    this.uid = row[1];
    this.displayName = row[2];
    this.acceptTime = row[3];
    this.subTitle = subTitle;
  }
}
