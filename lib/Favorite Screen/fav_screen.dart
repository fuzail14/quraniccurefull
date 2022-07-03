import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioquranic/Database/Database_Helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../View Dua/view_dua_all_details.dart';
class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
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


  String val = 'play';
  bool allow = true;
  dynamic counterval = 0;
  String? urdutranslation;
  String? arabictranslation;
  String? englishtranslation;
  var ayatnumfrom;
  var ayatnumto;

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
  //AudioPlayer audioPlayer = AudioPlayer();

  //AudioCache? audioCache;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.blue,
    title: Text('Favourite Dua Screen'),
    ),
    body: FutureBuilder<List<Map>>(
    future: databaseHelper.FavData(),
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
          return GestureDetector(
            onTap: (){

              // Get.to(ViewDuaAllDetails(),
              //     arguments: [
              //
              //       snapshot.data![position]["ucount"],
              //       snapshot
              //           .data![position]["bayaturdu"],
              //       snapshot.data![position]["des"],
              //       snapshot.data![position]["bayataudio"]
              //         ,
              //       snapshot
              //           .data![position]["betweenid"],
              //       snapshot.data![position]
              //           ["bayatarabic"],
              //       snapshot
              //           .data![position]["bayateng"],
              //       snapshot
              //           .data![position]["duacount"],
              //       snapshot.data![position]["count"]
              //     ]);



            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                width: 400,
                child: Column(children: [

                  Padding(
                    padding:
                    EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      "Counter Val: ${snapshot.data![position]['bayatcount']} ",
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
                      snapshot.data![position]["bayatarabic"],
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
                      "Description: ${snapshot.data![position]["bdescription"]}",

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
                              .data![position]["bayataudio"]);

                          int audiocount = 0;
                          var regExp = RegExp("mp3");

                          regExp
                              .allMatches(snapshot
                              .data![position]["bayataudio"])
                              .length;

                          print(
                              "hdhd ${regExp.allMatches(snapshot.data![position]["bayataudio"]).length}");

                          List<Audio> audioss = [];
                          List<Audio> audios = [];
                          List<Audio> a = [];

                          if (!isPlaying) {
                            val = "play";

                            for (int i = 0;
                            i <
                                regExp
                                    .allMatches(snapshot
                                    .data![position]["bayataudio"])
                                    .length;
                            i++) {
                              audioss = [
                                Audio(snapshot
                                    .data![position]["bayataudio"]
                                    .replaceAll("[", "")
                                    .toString()
                                    .replaceAll("]", "")
                                    .split(",")[i]
                                    .trim()),
                              ];
                              print("audioss loop: $audioss");
                              a.add(Audio(snapshot
                                  .data![position]["bayataudio"]
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

                              isPlaying = true;
                            });

                            print("audiosss $audioss");
                          } else {
                            val = "play";

                            for (int i = 0;
                            i <
                                regExp
                                    .allMatches(snapshot
                                    .data![position]['bayataudio']
                                    )
                                    .length;
                            i++) {
                              audioss = [
                                Audio(snapshot
                                    .data![position]["bayataudio"]
                                    .replaceAll("[", "")
                                    .toString()
                                    .replaceAll("]", "")
                                    .split(",")[i]
                                    .trim()),
                              ];
                              print("audioss loop: $audioss");
                              a.add(Audio(snapshot
                                  .data![position]["bayataudio"]
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


                              isPlaying = false;
                            });

                            print("audiosss $audioss");
                          }
                        },
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     // background color
                      //
                      //     primary: Colors.black,
                      //
                      //     textStyle: const TextStyle(
                      //       fontSize: 17,
                      //     ),
                      //   ),
                      //   child: Text('Duainc'),
                        // onPressed: () {
                        //   var idofbet = snapshot
                        //       .data![position].betweenid;
                        //
                        //   print("bet id $idofbet");
                        //
                        //   print(
                        //       "snapshot.data![position].duacount ${snapshot.data![position].duacount}");
                        //
                        //   snapshot.data![position].duacount =
                        //       countt;
                        //   countt++;
                        //
                        //   databaseHelper.updatecounter(
                        //       countt, idofbet);
                        //
                        //   if (snapshot.data![position]["ucount"] ==
                        //       snapshot.data![position].count) {
                        //     showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return AlertDialog(
                        //           title:
                        //           Text("Alert Dialog Box"),
                        //           content:
                        //           Text("Reset Counter"),
                        //           actions: <Widget>[
                        //             FlatButton(
                        //               onPressed: () {
                        //                 countt = 0;
                        //                 databaseHelper
                        //                     .updatecounter(
                        //                     countt,
                        //                     idofbet);
                        //
                        //                 // Get.back();
                        //                 setState(() {});
                        //               },
                        //               child: Text("okay"),
                        //             ),
                        //           ],
                        //         );
                        //       },
                        //     );
                        //   }
                        //   setState(() {});
                        // },
                      // ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     // background color
                      //     primary: Colors.black,
                      //
                      //     textStyle:
                      //     const TextStyle(fontSize: 16),
                      //   ),
                      //   child: Text('DuaDec'),
                      //   onPressed: () {
                      //     // var idofbet = snapshot
                          //     .data![position].betweenid;
                          //
                          // print("bet id $idofbet");
                          //
                          // print(
                          //     "snapshot.data![position].duacount ${snapshot.data![position].duacount}");
                          //
                          // snapshot.data![position].duacount =
                          //     countt;
                          //
                          // countt--;
                          //
                          // databaseHelper.updatecounter(
                          //     countt, idofbet);
                          //
                          // if (snapshot.data![position].ucount ==
                          //     snapshot.data![position].count) {
                          //   showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title:
                          //         Text("Alert Dialog Box"),
                          //         content:
                          //         Text("Reset Counter"),
                          //         actions: <Widget>[
                          //           FlatButton(
                          //             onPressed: () {
                          //               countt = 0;
                          //               databaseHelper
                          //                   .updatecounter(
                          //                   countt,
                          //                   idofbet);
                          //
                          //               Get.back();
                          //               setState(() {});
                          //             },
                          //             child: Text("okay"),
                          //           ),
                          //         ],
                          //       );
                          //     },
                          //   );
                          // }
                          // setState(() {});
                        //},
                      //),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     // background color
                      //     primary: Colors.black,
                      //
                      //     textStyle:
                      //     const TextStyle(fontSize: 16),
                      //   ),
                      //   child: Text('Details'),
                      //   onPressed: () {
                          // print(
                          //     "urdu ${snapshot.data![position].bayaturdu}");
                          //
                          // print(
                          //     "arabic ${snapshot.data![position].bayatarabic}");
                          // print(
                          //     "english ${snapshot.data![position].bayateng}");
                          //
                          // urdutranslation = snapshot
                          //     .data![position].bayaturdu;
                          //
                          // arabictranslation = snapshot
                          //     .data![position].bayatarabic;
                          //
                          // englishtranslation =
                          //     snapshot.data![position].bayateng;
                          //
                          // Get.to(ViewDuaDetails(), arguments: [
                          //   urdutranslation,
                          //   arabictranslation,
                          //   englishtranslation
                          // ]);
                        // },
                      // ),
                    ],
                  ),
                ]),
              ),
            ),
          );
        }))
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
    );
  }
}
