class FromToResultModel {
  int? fksurahid;
  String? ayatnum;
  String? description;
  String? ayatcount;

  String? ayaturdu;

  String? ayatarabic;
  String? ayatenglish;
  String? ayataudio;

  FromToResultModel(
      this.fksurahid,
      this.ayatnum,
      this.description,
      this.ayatcount,
      this.ayaturdu,
      this.ayatarabic,
      this.ayatenglish,
      this.ayataudio);
  FromToResultModel.fromMap(Map map) {
    fksurahid = map[fksurahid];
    ayatnum = map[ayatnum];

    description = map[description];
    ayatcount = map[ayatcount];
    ayaturdu = map[ayaturdu];
    ayatarabic = map[ayatarabic];
    ayatenglish = map[ayatenglish];
    ayataudio = map[ayataudio];
  }
}
