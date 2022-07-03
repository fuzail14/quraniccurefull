import 'package:audioquranic/Disease/DiseaseList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../Database/Database_Helper.dart';
import '../Database/note.dart';
import 'dart:io';
import 'package:path/path.dart';

class AddCategory extends StatefulWidget {
  final Note note;

  AddCategory(this.note);

  @override
  State<StatefulWidget> createState() {
    return AddCategoryState(this.note);
  }
}

class AddCategoryState extends State<AddCategory> {
  AddCategoryState(this.note);
  final ImagePicker _picker = ImagePicker();
  Note note;
  DatabaseHelper helper = DatabaseHelper();

  File? imageFile;
  static File? localFile;
  var cimage;

  String? ctitle;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cname = TextEditingController();

  String? path;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headline6;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, right: 15, left: 15),
                  child: TextFormField(
                    controller: cname,
                    style: textStyle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ENTER  NAME';
                      }
                    },
                    onChanged: (value) {
                      debugPrint('Something changed in Name Text Field');
                      print('value of name $value');
                      ctitle = value;
                      updatname();
                    },
                    decoration: InputDecoration(
                        labelText: 'Category Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    width: 400,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        onPressed: () async {
                          await _getFromGallery(ImageSource.gallery);

                          print("---");
                          print(imageFile!.path);
                        },
                        icon: Icon(Icons.photo),
                        label: Text("Pick Image")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                      width: 400,
                      height: 200,
                      child: imageFile == null
                          ? Icon(Icons.photo)
                          : Image.file(imageFile!),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    width: 400,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        onPressed: () {
                          _save();
                        },
                        child: Text("Submit")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFromGallery(ImageSource source) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    final appDir = await getExternalStorageDirectory();
    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      setState(() {
        print('Assigning Image file');
        imageFile = File(pickedFile.path);
      });
      cimage = imageFile!.path;
      note.image = cimage;
      //employee.iimage = DateTime.now().toString() + "/" + imageFile.toString();

      print('cimage $cimage');
      File tmpfile = File('${imageFile!.path}');

      final fname = basename(imageFile!.path);
      localFile = await tmpfile.copy('${appDir!.path}/$fname');
      print('local file $localFile');
    }
  }

  void updatname() {
    note.name = cname.text;
  }

  void _save() async {
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      return null;
    }

    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }
    helper.getNoteList();
    Get.to(() => NoteList());
  }
}
