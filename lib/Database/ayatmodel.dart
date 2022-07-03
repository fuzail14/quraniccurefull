class AyatModel {
  int? fksurahid;
  String? ayatnum;
  String? description;
  String? ayatcount;

  String? ayaturdu;
  String? ayatarabic;
  String? ayateng;
  String? ayataudio;

  AyatModel(this.fksurahid, this.ayatnum, this.ayaturdu, this.ayatarabic,
      this.ayateng, this.ayataudio);
  AyatModel.fromMap(Map map) {
    fksurahid = map[fksurahid];
    ayatnum = map[ayatnum];

    ayaturdu = map[ayaturdu];
    ayatarabic = map[ayatarabic];
    ayateng = map[ayateng];
  }
}
