import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class StaticViewDuaDetails extends StatefulWidget {
  const StaticViewDuaDetails({Key? key}) : super(key: key);

  @override
  State<StaticViewDuaDetails> createState() => _StaticViewDuaDetailsState();
}

class _StaticViewDuaDetailsState extends State<StaticViewDuaDetails> {
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: [
            Container(
              height: 150,
              width: 400,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 280),
                    child: Text(
                      'Urdu Translation:',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 20),
                    child: Text(
                      data[2],
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: 400,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 280),
                    child: Text(
                      'English Translation:',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 20),
                    child: Text(
                      data[1],
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 400,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 280),
                    child: Text(
                      'Dua In Arabic:',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 20),
                    child: Text(
                      data[0],
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
