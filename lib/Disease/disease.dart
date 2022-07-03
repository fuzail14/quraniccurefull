import 'package:flutter/material.dart';

import '../Disease.dart';
import 'package:get/get.dart';

class Disease extends StatefulWidget {
  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  List<Diseases> diseases = [
    Diseases(id: 1, name: "Heart", img: "images/heart.jpg"),
    Diseases(id: 2, name: "Eyes", img: "images/eye.jpg"),
    Diseases(id: 3, name: "Kidney", img: "images/kidney.jpg"),
    Diseases(id: 4, name: "Lungs", img: "images/lungs.jpg"),
    Diseases(id: 5, name: "Head", img: "images/head.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Diseases"),
          actions: [
            GestureDetector(
                onTap: () {
                  // Get.to(AddCategory(
                  //   Note(
                  //     '',
                  //     '',
                  //   ),
                  // ));
                },
                child: Row(
                  children: [
                    Text("Add Category"),
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
        body: Padding(
          padding: EdgeInsets.all(14),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 10.0,
              children: List.generate(diseases.length, (index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 100,
                        height: 200,
                        color: Colors.blueGrey,
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "${diseases[index].img}"))),
                                ),
                              ),
                            ),
                            Text(
                              "${diseases[index].name}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                );
              })),
        ));
  }
}
