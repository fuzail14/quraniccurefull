import 'package:audioquranic/Disease/DiseaseList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Database/Database_Helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DatabaseHelper d = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // d.deleteDatabase();

    return GetMaterialApp(debugShowCheckedModeBanner: false, home: NoteList());
  }
}
