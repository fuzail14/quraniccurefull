import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViewDuaDetails extends StatefulWidget {
  const ViewDuaDetails({Key? key}) : super(key: key);

  @override
  _ViewDuaDetailsState createState() => _ViewDuaDetailsState();
}

class _ViewDuaDetailsState extends State<ViewDuaDetails> {
  var arguments = Get.arguments;
  String? recieveurdu;
  String? recievearabic;
  String? recieveenglish;
  String dropdownValue = 'urdu';
  List <Map<String,dynamic>> dua_details=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    recieveurdu = arguments[1];
    recievearabic = arguments[0];
    recieveenglish = arguments[2];
    dua_details= [
      {"urdu":recieveurdu,
        "arabic": recievearabic,
        "eng": recieveenglish,
      }
    ];
  }
  @override
  Widget build(BuildContext context) {


    // String? selected_dua="urdu";



    List <String> translation_list=["urdu","arabic","eng"];
 String? ress;


    // print("urdu $recieveurdu");
    // print("arabic $recievearabic");
    // print("english $recieveenglish");
    print(arguments);
// print(dua_details);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          backgroundColor: Color.fromARGB(255, 163, 193, 207),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
            DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(
                color: Colors.deepPurple
            ),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {


setState(() {

  dropdownValue = newValue!;
  print(dropdownValue);

  // ress=;

  print("---------------------------------------");
  print(ress);
  print("---------------------------------------");



});

            },
            items: translation_list
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            })
                .toList()),

              Container(
                height: 240,
                width: 400,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 280),
                      child: Text(
                        'Translation:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(

                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.only(right: 5, left: 20),
                        child: Text(
                          dua_details[0][dropdownValue],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   height: 320,
              //   width: 400,
              //   color: Colors.blueGrey,
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.only(right: 280),
              //         child: Text(
              //           'English Translation:',
              //           style: TextStyle(
              //               fontSize: 16, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(right: 5, left: 20),
              //         child: Text(
              //           '$recieveenglish',
              //           style: TextStyle(
              //               fontSize: 18, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   height: 240,
              //   width: 400,
              //   color: Colors.blueGrey,
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: EdgeInsets.only(right: 280),
              //         child: Text(
              //           'Dua In Arabic:',
              //           style: TextStyle(
              //               fontSize: 16, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(right: 5, left: 20),
              //         child: Text(
              //           '$recieveurdu',
              //           style: TextStyle(
              //               fontSize: 18, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );

  }

}
