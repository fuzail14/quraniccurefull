import 'dart:convert';
import 'dart:typed_data';
import 'package:favorite_button/favorite_button.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioquranic/Add%20Dua/add_dua.dart';
import 'package:audioquranic/Database/addduamodel.dart';
import 'package:audioquranic/Database/joinduamodel.dart';
import 'package:audioquranic/Database/newjoin.dart';
import 'package:audioquranic/Disease/DiseaseList.dart';
import 'package:audioquranic/View%20Disease/view_disease.dart';
import 'package:audioquranic/View%20Dua%20Details/view_dua_details.dart';
import 'package:audioquranic/View%20Dua/view_dua.dart';
import 'package:audioquranic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../Database/Database_Helper.dart';

class DuaHistory extends StatefulWidget {
  @override
  _DuaHistoryState createState() => _DuaHistoryState();
}

class _DuaHistoryState extends State<DuaHistory> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  var diseaseName;
  var subDiseaseName;
  var did;

  bool isPlaying = false;
  List<String> arabicString = [];
  List<String> audios = [];
  int countt = 0;
  int counttd = 0;
  var idofbet;

  //AudioPlayer audioPlayer = AudioPlayer();

  //AudioCache? audioCache;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();


    fetchJoinDataFromDatabase();

    //setupPlaylist();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  String val = 'play';
  bool allow = true;
  dynamic counterval = 0;
  String? urdutranslation;
  String? arabictranslation;
  String? englishtranslation;
  var ayatnumfrom;
  var ayatnumto;
  int? bayatcounter;

  List joindataaddinlist = [];
  List<Map<String, dynamic>> lii = [];
  List<String> dua = [];
  var ucount;
  var bayaturdu;
  var des;
  var bayataudio;
  var betweenid;
  var bayatarabic;
  var bayateng;
  var duacount;
  var count;
  int? favduaid;




  @override
  Widget build(BuildContext context) {




    initState() async {
      super.initState();
    }

    dispose() {
      audioPlayer.dispose();
    }

    return WillPopScope(
      onWillPop: () {
        Get.back();
        dispose();
        return Future.value(allow);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Dua All Detail'),
          ),
          body: FutureBuilder<List<NewJoinDuaModel>>(
              future: fetchJoinDataFromDatabase(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return SingleChildScrollView(
                    child: Container(
                      height: 720,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, int position) {

                            // arabicString
                            //     .add(snapshot.data![position].bayatarabic!);

                            // print("dua data $dua");
                            // var text = dua.last;

                            // audios.add(snapshot.data![position].bayataudio!);

                            //print(arabicString);

                            print('come');
                            return Padding(
                              padding: EdgeInsets.all(12),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 400,
                                child: Column(children: [
                                  FavoriteButton(
                                    valueChanged: (_) {

                                      favduaid=  snapshot.data![position].betweenid!;
                                      print(favduaid);
                                      databaseHelper. updateFavForeignId(favduaid);
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(right: 10, left: 10),
                                    child: Text(
                                      "Counter Val: ${snapshot.data![position].ucount} ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      snapshot.data![position].bayaturdu!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 2, right: 200),
                                    child: Text(
                                      "Description: ${snapshot.data![position].des!}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          // background color
                                          primary: Colors.black,
                                          fixedSize: Size(15.0, 15.0),

                                          textStyle:
                                          const TextStyle(fontSize: 17),
                                        ),
                                        child: Text(val),
                                        onPressed: () async {
                                          print(snapshot
                                              .data![position].bayataudio!);

                                          int audiocount = 0;
                                          var regExp = RegExp("mp3");

                                          regExp
                                              .allMatches(snapshot
                                              .data![position].bayataudio!)
                                              .length;

                                          print(
                                              "hdhd ${regExp.allMatches(snapshot.data![position].bayataudio!).length}");

                                          List<Audio> audioss = [];
                                          List<Audio> audios = [];
                                          List<Audio> a = [];

                                          if (!isPlaying) {
                                            for (int i = 0;
                                            i <
                                                regExp
                                                    .allMatches(snapshot
                                                    .data![position]
                                                    .bayataudio!)
                                                    .length;
                                            i++) {
                                              audioss = [
                                                Audio(snapshot
                                                    .data![position].bayataudio!
                                                    .replaceAll("[", "")
                                                    .toString()
                                                    .replaceAll("]", "")
                                                    .split(",")[i]
                                                    .trim()),
                                              ];
                                              print("audioss loop: $audioss");
                                              a.add(Audio(snapshot
                                                  .data![position].bayataudio!
                                                  .replaceAll("[", "")
                                                  .toString()
                                                  .replaceAll("]", "")
                                                  .split(",")[i]
                                                  .trim()));
                                            }

                                            print("aaaa $a");

                                            audioPlayer.open(
                                                Playlist(audios: a),
                                                autoStart: true);
                                            await audioPlayer.play();
                                            setState(() {
                                              val = "play";
                                              isPlaying = true;
                                            });

                                            print("audiosss $audioss");
                                          } else {
                                            for (int i = 0;
                                            i <
                                                regExp
                                                    .allMatches(snapshot
                                                    .data![position]
                                                    .bayataudio!)
                                                    .length;
                                            i++) {
                                              audioss = [
                                                Audio(snapshot
                                                    .data![position].bayataudio!
                                                    .replaceAll("[", "")
                                                    .toString()
                                                    .replaceAll("]", "")
                                                    .split(",")[i]
                                                    .trim()),
                                              ];
                                              print("audioss loop: $audioss");
                                              a.add(Audio(snapshot
                                                  .data![position].bayataudio!
                                                  .replaceAll("[", "")
                                                  .toString()
                                                  .replaceAll("]", "")
                                                  .split(",")[i]
                                                  .trim()));
                                            }
                                            print("aaaa $a");

                                            audioPlayer.open(
                                                Playlist(audios: a),
                                                autoStart: false);
                                            await audioPlayer.pause();
                                            setState(() {
                                              val = "pause";

                                              isPlaying = false;
                                            });

                                            print("audiosss $audioss");
                                          }
                                        },
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          // background color

                                          primary: Colors.black,

                                          textStyle: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        child: Text('Counter'),
                                        onPressed: () {
                                          var idofbet = snapshot
                                              .data![position].betweenid;

                                          print("bet id $idofbet");

                                          print(
                                              "snapshot.data![position].duacount ${snapshot.data![position].duacount}");

                                          snapshot.data![position].duacount = countt;



                                          bayatcounter = int.parse(snapshot.data![position].bayatcount!);
                                          int ucounter = int.parse(snapshot.data![position].ucount!);



                                          ucounter=(ucounter-1);


                                          print("ucounter--  $ucounter");

                                          int sts = 0;



                                          databaseHelper.updatecounter(
                                              ucounter  , idofbet,sts);


                                          if (ucounter==
                                              0) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                  Text("Alert Dialog Box"),
                                                  content:
                                                  Text("Reset Counter"),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      onPressed: () {
                                                        var countdec=   snapshot.data![position].bayatcount;
                                                        int status = 1;
                                                        databaseHelper
                                                            .updatecounter(
                                                            countdec,  idofbet,status);

                                                        Get.back();
                                                        setState(() {});

                                                      },

                                                      child: Text("okay"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          else if (ucounter<0)
                                          {
                                            ucounter=0;

                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                  Text("Alert Dialog Box"),
                                                  content:
                                                  Text("Reset Counter"),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      onPressed: () {
                                                        var countdec=   snapshot.data![position].bayatcount;
                                                        int status = 1;
                                                        databaseHelper
                                                            .updatecounter(
                                                            countdec,  idofbet,status);

                                                        Get.back();
                                                        setState(() {});

                                                      },

                                                      child: Text("okay"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );


                                          }

                                          setState(() {});
                                        },
                                      ),

                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          // background color
                                          primary: Colors.black,

                                          textStyle:
                                          const TextStyle(fontSize: 16),
                                        ),
                                        child: Text('Details'),
                                        onPressed: () {
                                          print(
                                              "urdu ${snapshot.data![position].bayaturdu}");

                                          print(
                                              "arabic ${snapshot.data![position].bayatarabic}");
                                          print(
                                              "english ${snapshot.data![position].bayateng}");

                                          urdutranslation = snapshot
                                              .data![position].bayaturdu;

                                          arabictranslation = snapshot
                                              .data![position].bayatarabic;

                                          englishtranslation =
                                              snapshot.data![position].bayateng;

                                          Get.to(ViewDuaDetails(), arguments: [
                                            urdutranslation,
                                            arabictranslation,
                                            englishtranslation
                                          ]);
                                        },
                                      ),
                                    ],
                                  ),
                                ]),
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
        ),
      ),
    );
  }

  Future<List<NewJoinDuaModel>> fetchJoinDataFromDatabase() async {
    List<NewJoinDuaModel> GettingJoinData = await databaseHelper.DuaHistory(

    );

    print("new screen data $GettingJoinData");

    return GettingJoinData;
  }
}
