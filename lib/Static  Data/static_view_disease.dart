import 'package:audioquranic/Static%20%20Data/static_view_dua.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StaticViewDisease extends StatefulWidget {
  const StaticViewDisease({Key? key}) : super(key: key);

  @override
  State<StaticViewDisease> createState() => _StaticViewDiseaseState();
}

class _StaticViewDiseaseState extends State<StaticViewDisease> {
  var data = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(data);

    print(data[0]);
    print(data[1]);
    print(data[2]);
    print(data[3]);
    print(data[4]);
    print(data[5]);
    print(data[6]);
    print(data[7]);
    print(data[8]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.blue,
              title: Text("Diseases"),
              actions: [],
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
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 20, 122)),
                        child: Image.asset(
                          data[2],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                        child: Container(
                            height: 100,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(StaticViewDua(), arguments: [
                                  data[0],
                                  data[1],
                                  data[2],
                                  data[3],
                                  data[4],
                                  data[5],
                                  data[6],
                                  data[7],
                                  data[8],
                                ]);
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Container(
                                  width: 400,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Text(
                                    data[3],
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ))),
                  ])),
            )));
  }
}
