import 'package:audioquranic/Database/adddisease.dart';
import 'package:audioquranic/View%20Disease/view_disease.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database/Database_Helper.dart';

class AddDisease extends StatefulWidget {
  final AddDiseaseModel addDiseaseModel;
  AddDisease(this.addDiseaseModel);

  @override
  State<StatefulWidget> createState() {
    return _AddDiseaseState(this.addDiseaseModel);
  }
}

class _AddDiseaseState extends State<AddDisease> {
  _AddDiseaseState(this.addDiseaseModel);

  AddDiseaseModel addDiseaseModel;

  DatabaseHelper helper = DatabaseHelper();
  TextEditingController dname = TextEditingController();
  String? dtitle;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var data = Get.arguments;
  var cid;

  @override
  Widget build(BuildContext context) {
    print(data);
    var nameofdisease = data[1];
    cid = data[2];

    TextStyle? textStyle = Theme.of(context).textTheme.headline6;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Disease'),
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
                    height: 100,
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border.all(color: Colors.white30, width: 4.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Text(
                      'Category: ${nameofdisease!.toString().toUpperCase()}',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 15, right: 15),
                  child: TextFormField(
                    controller: dname,
                    style: textStyle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ENTER Disease Name';
                      }
                    },
                    onChanged: (value) {
                      debugPrint('Something changed in Name Text Field');
                      print('value of name $value');
                      dtitle = value;
                      updatname();
                    },
                    decoration: InputDecoration(
                        labelText: 'Disease Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 150,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              //helper.AddDuaRawInsertion();
                              updatFk();

                              _save();
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
            ),
          ),
        ),
      ),
    );
  }

  void _save() async {
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      return null;
    }

    int result;
    if (addDiseaseModel.id != null) {
      // Case 1: Update operation
      result = await helper.updateDisease(addDiseaseModel);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertDisease(addDiseaseModel);
    }

    helper.getDiseaseList();
    Get.to(() => ViewDisease(), arguments: data);
  }

  void updatname() {
    addDiseaseModel.name = dname.text;
  }

  void updatFk() {
    addDiseaseModel.FkId = cid;
  }
}
