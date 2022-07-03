import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddSurah extends StatefulWidget {
  const AddSurah({Key? key}) : super(key: key);

  @override
  _AddSurahState createState() => _AddSurahState();
}

class _AddSurahState extends State<AddSurah> {
  String? surahVal = "Surah Noor";

  List<String> surah = [
    "Surah Noor",
    "Surah Fatiha",
    "Surah ikhlas",
  ];

  List<int> from = [1, 2, 3];
  List<int> to = [1, 2, 3];

  int toVal = 1;
  int fromVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueGrey,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  width: 400,
                  child: DropdownButton<String>(
                    value: surahVal,

                    // icon:  Icon(Icons.person),
                    // iconSize: 24,

                    style: const TextStyle(color: Colors.black),
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        surahVal = newValue!;
                      });
                    },
                    items: surah.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                Text("From"),
                Container(width: 100,
                  child: DropdownButton<int>(
                    value: fromVal,

                    // icon:  Icon(Icons.person),
                    // iconSize: 24,

                    style: const TextStyle(color: Colors.black),

                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (int? newValue) {
                      setState(() {
                        fromVal = newValue!;
                      });
                    },
                    items: from.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
                Text("To"),
                Container(width: 100,
                  child: DropdownButton<int>(
                    value: toVal,

                    // icon:  Icon(Icons.person),
                    // iconSize: 24,

                    style: const TextStyle(color: Colors.black),

                    underline: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    onChanged: (int? newValue) {
                      setState(() {
                        toVal = newValue!;
                      });
                    },
                    items: to.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),





              ],),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: (){}, child: Text("Save"))),
                Container(width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: (){
                    Get.back();


                  }, child: Text("Cancel")),
                ),





              ],)


            ],
          ),
        ));
  }
}
