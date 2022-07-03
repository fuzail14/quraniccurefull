import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioquranic/Static%20%20Data/static_view_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StaticViewDua extends StatefulWidget {
  const StaticViewDua({Key? key}) : super(key: key);

  @override
  State<StaticViewDua> createState() => _StaticViewDuaState();
}

class _StaticViewDuaState extends State<StaticViewDua> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  var data = Get.arguments;
  int count = 0;

  @override
  void initState() {
    super.initState();
    //setupPlaylist();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Dua'),
        ),
        body: Column(children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              width: 400,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "Counter Val: ${count} ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    data[4],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2, right: 200),
                  child: Text(
                    "Description: ${data[7]}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // background color
                        primary: Colors.black,

                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text("play"),
                      onPressed: () async {
                        print("audio in static.. ${data[8]}");
                        var path = data[8];
                        audioPlayer.open(Playlist(audios: [Audio(path)]),
                            autoStart: true);
                        await audioPlayer.play();
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // background color
                        primary: Colors.black,

                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text('Counter'),
                      onPressed: () {
                        count++;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // background color
                        primary: Colors.black,

                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text('Details'),
                      onPressed: () {
                        Get.to(StaticViewDuaDetails(),
                            arguments: [data[6], data[5], data[7]]);
                      },
                    ),
                  ],
                )
              ]))
        ]));
  }
}
