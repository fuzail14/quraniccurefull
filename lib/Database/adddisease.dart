class AddDiseaseModel {
  int? did;
  String? _dname;
  int? _FkId;

  AddDiseaseModel(this._dname, this._FkId);
  AddDiseaseModel.withId(this.did, this._dname, this._FkId);

  int? get id => did;

  String? get dname => _dname;
  int? get FkId => _FkId;

  set name(String? newname) {
    if (newname!.length <= 255) {
      this._dname = newname;
    }
  }

  set FkId(int? newFkId) {
    if (newFkId! <= 255) {
      this._FkId = newFkId;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = did;
    }
    map['dname'] = _dname;
    map['fkid'] = _FkId;

    return map;
  }

  // Extract a Note object from a Map object
  AddDiseaseModel.fromMapObject(Map<String, dynamic> map) {
    this.did = map['id'];
    this._dname = map['dname'];
    this._FkId = map['fkid'];
  }
}
