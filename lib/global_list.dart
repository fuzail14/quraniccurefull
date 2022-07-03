import 'package:flutter/foundation.dart';

class GlobalList {
  int? fksurahid;
  String? ayatnum;
  String? description;
  String? ayatcount;

  String? ayaturdu;

  String? ayatarabic;
  String? ayatenglish;
  String? ayataudio;

  GlobalList(
      {required this.fksurahid,
      required this.ayatnum,
      required this.description,
      required this.ayatcount,
      required this.ayaturdu,
      required this.ayatarabic,
      required this.ayatenglish,
      required this.ayataudio});
}
