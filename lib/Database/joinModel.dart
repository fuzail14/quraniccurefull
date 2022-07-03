class JoinModel {
  int? did;

  String? dname;

  int? fkid;

  JoinModel(this.did, this.dname, this.fkid);
  JoinModel.fromMap(Map map) {
    did = map[did];
    dname = map[dname];

    fkid = map[fkid];
  }
}
