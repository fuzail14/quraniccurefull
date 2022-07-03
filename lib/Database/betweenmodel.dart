class Between {
  int? bfksurahid;
  int? bayatnum;

  String? bdescription;

  int? bayatcount;

  String? bayaturdu;
  String? bayatarabic;
  String? bayateng;
  String? bayataudio;
  int? bfkdiseaseidinayat;

  Between(
      this.bfksurahid,
      this.bayatnum,
      this.bdescription,
      this.bayatcount,
      this.bayaturdu,
      this.bayatarabic,
      this.bayateng,
      this.bayataudio,
      this.bfkdiseaseidinayat);
  Between.withId(
      this.bfksurahid,
      this.bayatnum,
      this.bdescription,
      this.bayatcount,
      this.bayaturdu,
      this.bayatarabic,
      this.bayateng,
      this.bayataudio,
      this.bfkdiseaseidinayat);

  int? get fkid => bfksurahid;

  int? get ayatnum => bayatnum;

  String? get des => bdescription;
  int? get count => bayatcount;
  String? get urdu => bayaturdu;
  String? get arabic => bayatarabic;
  String? get eng => bayateng;
  String? get audio => bayataudio;
  int? get fkdid => bfkdiseaseidinayat;

  set fksurahid(int? newbfksurahid) {
    if (newbfksurahid! <= 255) {
      this.bfksurahid = newbfksurahid;
    }
  }

  set ayatnum(int? newayatnum) {
    this.bayatnum = newayatnum;
  }

  set des(String? newdes) {
    this.bdescription = newdes;
  }

  set count(int? newcount) {
    this.bayatcount = newcount;
  }

  set urdu(String? newurdu) {
    this.bayaturdu = newurdu;
  }

  set arabic(String? newarabic) {
    this.bayatarabic = newarabic;
  }

  set eng(String? neweng) {
    this.bayateng = neweng;
  }

  set audio(String? newaudio) {
    this.bayataudio = newaudio;
  }

  set fkdid(int? newbfkid) {
    this.bfkdiseaseidinayat = newbfkid;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (fkid != null) {
      map['fksurahid'] = bfksurahid;
    }
    map['bayatnum'] = bayatnum;

    map['bdescription'] = bdescription;
    map['bayatcount'] = bayatcount;
    map['bayaturdu'] = bayaturdu;
    map['bayatarabic'] = bayatarabic;
    map['bayateng'] = bayateng;
    map['bayataudio'] = bayataudio;
    map['bfkdiseaseidinayat'] = bfkdiseaseidinayat;

    return map;
  }

  // Extract a Note object from a Map object
  Between.fromMapObject(Map<String, dynamic> map) {
    this.bfksurahid = map['bfksurahid'];
    this.bayatnum = map['bayatnum'];

    this.bdescription = map["bdescription"];
    this.bayatcount = map["bayatcount"];
    this.bayaturdu = map["bayaturdu"];
    this.bayatarabic = map["bayatarabic"];
    this.bayateng = map["bayateng"];
    this.bayataudio = map["bayataudio"];
    this.bfkdiseaseidinayat = map["bfkdiseaseidinayat"];
  }
}
