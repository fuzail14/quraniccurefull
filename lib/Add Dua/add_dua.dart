import 'dart:convert';

import 'dart:io';
import 'dart:math';
import 'package:audioquranic/Database/addduamodel.dart';
import 'package:audioquranic/Database/ayatmodel.dart';
import 'package:audioquranic/View%20Dua/view_dua.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';

import '../Database/Database_Helper.dart';
import 'package:sqflite/sqflite.dart';

class AddDua extends StatefulWidget {
  final AddDuaModel addDuaModel;
  AddDua(this.addDuaModel);

  @override
  State<StatefulWidget> createState() {
    return AddDuaState(this.addDuaModel);
  }
}

class AddDuaState extends State<AddDua> {
  AddDuaState(this.addDuaModel);

  AddDuaModel addDuaModel;

  String? surahVal = "Surah Noor";
  List<String> surah = ['Surah Noor', 'surah2'];

  int toVal = 1;
  int fromVal = 1;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController descriptionController = TextEditingController();
  var arguments = Get.arguments;
  var diseaseName;
  var subDiseaseName;
  var subDId;
  var cid;

  TextEditingController countController = TextEditingController();
  String dropdownValue = 'Head';

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List>? surahnames;
  List surahnamesinlist = [];

  List from = ['1', '2', '3'];
  List to = ['1', '2', '3'];

  Future<List>? _futureOfList;
  List? list;
  //List lii = [];
  List<Map<String, dynamic>> lii = [];

  List<Map<String, dynamic>> ayatlist = [];

  dynamic surahname;
  dynamic ayatnumfrom;
  dynamic ayatnumto;
  var ayatnum;
  var ayatnuminto;
  int? ayatNumIntTo;
  int? ayatNumIntFrom;

  List<Map<String, dynamic>> ayatnumfromto = [];

  Future<List>? data;
  Future<List>? ayatnumget;
  List AyatNumGetinList = [];

  dynamic numlistassign;
  dynamic numlistfksurahid;
  String? des;
  String? countupdate;
  Future<dynamic>? result;
  var ayatnumfromrecieve;
  var ayatnumtorecieve;

  var idofdua;
  @override
  void initState() {
    databaseHelper.getadddua();
    fetchEmployeesFromDatabase();
    databaseHelper.getayatdata();
    FetchAyatData();

    print("this is init state ${lii}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("check.... $AyatNumGetinList");
    Future<List> li = databaseHelper.getadddua();
    Future<List> ayatlists = databaseHelper.getayatdata();

    print("li $li");
    print("list of ayats: $ayatlists");

    diseaseName = arguments[0];
    subDiseaseName = arguments[1];
    subDId = arguments[2];
    cid = arguments[3];


    print(" Add dua diseaseName $diseaseName");
    print("Add dua subdiseaseName  $subDiseaseName");
    print("Add dua subdid  $subDId");
    print("Add dua cid  $cid");

    print(lii);
    TextStyle? textStyle = Theme.of(context).textTheme.headline6;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Dua'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border.all(color: Colors.white30, width: 4.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            diseaseName!.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border.all(color: Colors.white30, width: 4.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          ' Sub Category',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            subDiseaseName!.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),

              lii.isEmpty
                  ? Container()
                  : Column(
                      children: [
                        Text(
                          "Select Surah",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: DropdownButton<dynamic>(
                            onTap: () {
                              ayatnumto = null;
                              ayatnumfrom = null;
                            },
                            value: surahname,
                            onChanged: ((value) async {
                              setState(() {
                                surahname = value;
                                print("selected surah....$surahname");
                                idofdua = surahname["surahid"];
                                print("surahname..... $surahname");
                                print("idofdua $idofdua");

                                ayatnumget =
                                    databaseHelper.getonchangedata(idofdua);
                              });

                              AyatNumGetinList = await ayatnumget!;

                              setState(() {});

                              print("ayat num in list $AyatNumGetinList");
                            }),
                            items: lii.map((dynamic val) {
                              return DropdownMenuItem(
                                  child: Text(val["surahname"]), value: val);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
              // for (int i = 0; i < lii.length; i++)
              //   if (surahname == lii[i]["surahname"]) ...[

              // ],

              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "From ayat:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<dynamic>(
                      value: ayatnumfrom,
                      items: AyatNumGetinList.map((dynamic val) {
                        return DropdownMenuItem<dynamic>(
                            child: Text(val["ayatnum"].toString()),
                            value: val.toString());
                      }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          ayatnumfrom = value;
                          ayatnum = value.split(',')[1].split(":")[1];
                          ayatNumIntFrom = int.parse(
                              ayatnum = value.split(',')[1].split(":")[1]);
                          // if (ayatNumIntFrom! < ayatNumIntTo!) {
                          //   Fluttertoast.showToast(
                          //       msg:
                          //           "You selected $ayatNumIntFrom to  $ayatNumIntTo ",
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.CENTER,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Colors.green,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0);
                          // } else {
                          //   Fluttertoast.showToast(
                          //       msg: "from val must be less than to",
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.CENTER,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Colors.red,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0);
                          //   ayatnumto = null;
                          // }
                        });
                      }),
                  Text(
                    "To:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<dynamic>(
                      value: ayatnumto,
                      items: AyatNumGetinList.map((dynamic val) {
                        return DropdownMenuItem<dynamic>(
                            child: Text(val['ayatnum'].toString()),
                            value: val.toString());
                      }).toList(),
                      onChanged: (dynamic value) {
                        setState(() {
                          ayatnumto = value;

                          ayatnuminto = ayatnumto[24];
                          ayatnuminto = value.split(',')[1].split(":")[1];
                          ayatNumIntTo = int.parse(
                              ayatnuminto = value.split(',')[1].split(":")[1]);

                          if (ayatNumIntFrom! < ayatNumIntTo!) {
                            Fluttertoast.showToast(
                                msg:
                                    "You selected $ayatNumIntFrom to  $ayatNumIntTo ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Fluttertoast.showToast(
                                msg: "from val must be less than to",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            ayatnumto = null;
                          }
                        });
                      }),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, right: 15, left: 15),
                child: TextFormField(
                  controller: descriptionController,
                  style: textStyle,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ENTER  Description';
                    }
                  },
                  onChanged: (value) {
                    debugPrint('Something changed in des Text Field');
                    print('value of des $value');
                    des = value;
                    print(" desdss $des");
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, right: 15, left: 15),
                child: TextFormField(
                  controller: countController,
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'ENTER  Count';
                    }
                  },
                  onChanged: (value) {
                    debugPrint('Something changed in des Text Field');

                    countupdate = value;
                    print('value of count $countupdate');
                  },
                  decoration: InputDecoration(
                      labelText: 'Count',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 150,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () async {
                            if (this._formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            } else {
                              return null;
                            }
                            print(
                                "update add dua table fk disease id...${subDId},${idofdua}");

                            // databaseHelper.updateAddDuaForeginkey(
                            //     subDId, idofdua);
                            //databaseHelper.addduadidinsert(subDId);

                            print(
                                "ayat num in from and to ${ayatnum},${ayatnuminto}");

                            int count = int.parse(countupdate!);
                            int statuscode = 0;



                            Future<dynamic> res =
                                databaseHelper.GetAyatBetweenData(
                                    ayatnum,
                                    ayatnuminto,
                                    subDId,
                                    idofdua,
                                    des,
                                    countupdate,
                                    count,
                                cid,
                                statuscode
                                );

                            // databaseHelper.updatedescription(
                            //     des, ayatnum, ayatnuminto);
                            // databaseHelper.updatecount(
                            //     countupdate, ayatnum, ayatnuminto);

                            // databaseHelper.updateAyatForeginkey(
                            //     subDId, ayatnum, ayatnuminto);

                            List ress = await res;
                            print("ressssss $ress");

                            // for (int i = 0; i < ress.length; i++) {
                            //   print("ress loop: ${ress[i]["ayatnum"]}");
                            //   print("rssss...$subDId");
                            //   print("surahid....$idofdua");
                            //   databaseHelper.BetweenTableRawInsertrion(
                            //       subDId, idofdua, ress[i]["ayatnum"]);
                            // }

                            //databaseHelper.joinDua(subDId);

                            // databaseHelper.insertbetweendata(
                            //     Between(0, 0, "", 0, "", "", "", "", 0));

                            //dynamic id = res["fksurahid"];

                            //print("id..............$id");

                            print("add dua result  $result");

                            databaseHelper.addDiseaseForeginKey(
                                subDId, idofdua);

                            print("idss sending$idofdua");
                            print("idss sending$subDId");

                            // final firstRange = AyatNumGetinList.getRange(
                            //     int.parse(ayatnumfrom['fksurahid']),
                            //     int.parse(ayatnumto['fksurahid']));
                            // print("range ${firstRange.join(', ')}");

                            //databaseHelper.updateForeginkey(subDId, idofdua);

                            //updatFk();

                            Get.to(() => ViewDua(), arguments: [
                              diseaseName,
                              subDiseaseName,
                              subDId,
                              cid
                            ]);
                          },
                          child: Text("Save"))),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel")),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  fetchEmployeesFromDatabase() async {
    var dbHelper = DatabaseHelper.instance;
    List<AddDuaModel> list = await dbHelper.getadddua();

    print('list data:$list');
    print("list of duaa...${list.length}");
    list.forEach((element) {
      //lii.add(element.surahname);

      lii.add({
        "surahid": element.id,
        "surahname": element.surahname,
      });

      setState(() {});

      print("this is function");
      print(lii);
    });
  }

  FetchAyatData() async {
    var dbHelper = DatabaseHelper.instance;
    List<AyatModel> list = await dbHelper.getayatdata();

    print('list of ayat data:$list');
    print("list of ayat...${list.length}");
    list.forEach((element) {
      //lii.add(element.surahname);

      ayatlist.add({
        "fksurahid": element.fksurahid,
        "ayatnum": element.ayatnum,
        "ayaturdu": element.ayaturdu,
        "ayatarabic": element.ayatarabic,
        "ayateng": element.ayateng,
        "ayataudio": element.ayataudio
      });

      setState(() {});
      print("this is function");
      print("ayaat list : $ayatlist");
    });
  }

// void updatFk() {
//   print(subDId);
//   addDuaModel.sfkid = subDId;
//   print(addDuaModel.sfkid);
// }
}
