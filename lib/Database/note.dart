class Note {
  int? cid;
  String? _name;

  dynamic _image;
  Note(this._name, this._image);
  Note.withId(this.cid, this._name, this._image);

  int? get id => cid;

  String? get name => _name;

  dynamic get image => _image;

  set name(String? newname) {
    if (newname!.length <= 255) {
      this._name = newname;
    }
  }

  set image(dynamic newimage) {
    this._image = newimage;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = cid;
    }
    map['name'] = _name;

    map['image'] = _image;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this.cid = map['id'];
    this._name = map['name'];

    this._image = map["image"];
  }
}
