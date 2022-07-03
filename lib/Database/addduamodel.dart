class AddDuaModel {
  int? id;

  String? surahname;

  // String? des;

  // String? count;

  // String? surah;
  // int? sfkid;

  AddDuaModel(this.id, this.surahname);

  //this.des, this.count, this.surah);

  AddDuaModel.fromMap(Map map) {
    id = map[id];
    surahname = map[surahname];

    // des = map[des];

    // count = map[count];

    // surah = map[surah];
    // sfkid = map[sfkid];
  }
}
