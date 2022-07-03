import 'package:audioquranic/Database/adddisease.dart';
import 'package:audioquranic/Database/joinModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:sqflite/sqflite.dart';

import '../Add Disease/add_disease.dart';
import '../Database/Database_Helper.dart';
import '../View Dua/view_dua.dart';

class ViewDisease extends StatefulWidget {
  @override
  _ViewDiseaseState createState() => _ViewDiseaseState();
}

class _ViewDiseaseState extends State<ViewDisease> {
  var data = Get.arguments;

  int count = 0;
  List<AddDiseaseModel>? diseaseModelList;

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Map>? listofmanagmentdatainviewdisease;
  var cid;
  var image;

  @override
  Widget build(BuildContext context) {
    cid = data[2];

    databaseHelper.getDiseaseList();

    databaseHelper.join(cid);

    if (diseaseModelList == null) {
      diseaseModelList = <AddDiseaseModel>[];
      updateListView();
    }

    image = data[0];
    var nameofdisease = data[1];

    print('image $image');
    print('name $nameofdisease');
    print('id $cid');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blue,
          title: Text("Diseases"),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(AddDisease(AddDiseaseModel('', 0)), arguments: data);
                },
                child: Row(
                  children: [
                    Text("Add Disease"),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.add),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  width: 400,
                  height: 200,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 238, 20, 122)),
                  child: Image.file(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder<List<JoinModel>>(
                  future: fetchJoinDataFromDatabase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Container(
                          height: 500,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: ((context, int position) {
                                print('come');
                                return GestureDetector(
                                  onTap: () {
                                    // databaseHelper.AddDuaRawInsertion(
                                    //     snapshot.data![position].did!);
                                    Get.to(ViewDua(), arguments: [
                                      nameofdisease,
                                      snapshot.data![position].dname!,
                                      snapshot.data![position].did!,
                                      cid
                                    ]);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    child: Container(
                                      width: 400,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                          child: Text(
                                        snapshot.data![position].dname!,
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                );
                              })),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return new Text("${snapshot.error}");
                    }
                    return new Container(
                      alignment: AlignmentDirectional.center,
                      child: new CircularProgressIndicator(),
                    );
                  }),
            ]),
          ),
        ),
      ),
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();

    dbFuture.then((database) {
      Future<List<AddDiseaseModel>> diseaseListFuture =
          databaseHelper.getDiseaseList();
      diseaseListFuture.then((diseaseList) {
        setState(() {
          this.diseaseModelList = diseaseList;
          this.count = diseaseList.length;
        });
      });
    });
  }

  Future<List<JoinModel>> fetchJoinDataFromDatabase() async {
    Future<List<JoinModel>> GettingJoinData = databaseHelper.join(cid);

    return GettingJoinData;
  }
}
