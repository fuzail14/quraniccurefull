class favjoinDuaModel {
  int? betweenid;
  int? bfkdiseaseidinbetween;
  int? bsurahid;
  String? bayaturdu;
  String? bayatarabic;
  String? bayateng;
  String? bayataudio;

  int? did;
  String? dname;
  int? fkid;
  String? des;
  String? count;
  String? ucount;
  int? duacount;
  int? cid;

  favjoinDuaModel(
      this.betweenid,
      this.bfkdiseaseidinbetween,
      this.bsurahid,
      this.bayatarabic,
      this.bayaturdu,
      this.bayateng,
      this.bayataudio,
      this.did,
      this.dname,
      this.fkid,
      this.des,
      this.count,
      this.ucount,
      this.cid
      );
  favjoinDuaModel.fromMap(Map map) {
    betweenid = map[betweenid];
    bfkdiseaseidinbetween = map[bfkdiseaseidinbetween];

    bsurahid = map[bsurahid];
    bayaturdu = map[bayaturdu];
    bayatarabic = map[bayatarabic];
    bayateng = map[bayateng];
    bayataudio = map[bayataudio];
    did = map[did];
    dname = map[dname];
    fkid = map[fkid];
    des = map[des];
    count = map[count];
    ucount = map[ucount];
    duacount = duacount;
    cid = map[cid];
  }
}
