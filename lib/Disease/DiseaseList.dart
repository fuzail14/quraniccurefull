import 'dart:io';

import 'package:audioquranic/Add%20Category/add_category.dart';
import 'package:audioquranic/Database/note.dart';
import 'package:audioquranic/Favorite%20Screen/fav_screen.dart';
import 'package:audioquranic/View%20Disease/view_disease.dart';
import 'package:audioquranic/dua_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../Database/Database_Helper.dart';
import '../Static  Data/static_view_disease.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<Note>? noteList;

  int count = 0;
  int selectedIndex = 0;
  String? title = 'Home';

  static const List<Color> colors = [Colors.blue, Colors.red, Colors.green];

  List<Map<String, dynamic>> data = [
    {
      "id": 1,
      "name": "Heart",
      "image": "images/heart.jpg",
      "disease": "heart attack",
      "arabic":
          ":قُلْ هُوَ اللّٰهُ اَحَدٌۚ  اَللّٰهُ الصَّمَدُۚ  لَمْ یَلِدْ  وَ لَمْ یُوْلَدْۙ  وَ لَمْ یَكُنْ لَّهٗ كُفُوًا اَحَدٌ۠",
      "english":
          " Say: He is Allah the One Allah the eternally Besought of all He begetteth not nor was begotten.And there is none comparable unto Him.",
      "urdu":
          "     کہو کہ وہ ذات پاک جس کا نام الله ہے ایک ہےمعبود برحق جو بےنیاز ہےنہ کسی کا باپ ہے اور نہ کسی کا بیٹااور کوئی اس کا ہمسر نہیں",
      "description": "Tilawat of Surah Al-Ikhlas",
      "audio": "assets/SurahAlIkhlas.mp3"
    },
    {
      "id": 2,
      "name": "Head",
      "image": "images/head.jpg",
      "disease": "sar dard",
      "arabic":
          "   تَبَّتْ يَدَآ أَبِى لَهَبٍۢ وَتَبَّ مَآ أَغْنَىٰ عَنْهُ مَالُهُۥ وَمَا كَسَبَ سَيَصْلَىٰ نَارًۭا ذَاتَ لَهَبٍۢ وَٱمْرَأَتُهُۥ حَمَّالَةَ ٱلْحَطَبِ فِى جِيدِهَا حَبْلٌۭ مِّن مَّسَدٍۭ",
      "english":
          "May the hands of Abu Lahab be ruined and ruined is he His wealth will not avail him or that which he gained He will enter to burn in a Fire of blazing flame And his wife as well the carrier of firewood Around her neck is a rope of twisted fiber",
      "urdu":
          "بولہب کے ہاتھ ٹوٹیں اور وہ ہلاک ہو نہ تو اس کا مال ہی اس کے کچھ کام آیا اور نہ وہ جو اس نے کمایا وہ جلد بھڑکتی ہوئی آگ میں داخل ہو گا اور اس کی جورو بھی جو ایندھن سر پر اٹھائے پھرتی ہے اس کے گلے میں مونج کی رسّی ہو گی",
      "description":
          "Recite this 11 time and  blown on ypur body Inshallah pain will go away",
      "audio": "assets/surahnasr.mp3"
    },
    {
      "id": 3,
      "name": "Lungs",
      "image": "images/lungs.jpg",
      "disease": "lungs cancer",
      "arabic":
          "إِذَا جَآءَ نَصْرُ ٱللَّهِ وَٱلْفَتْحُ  وَرَأَيْتَ ٱلنَّاسَ يَدْخُلُونَ فِى دِينِ ٱللَّهِ أَفْوَاجًۭا فَسَبِّحْ بِحَمْدِ رَبِّكَ وَٱسْتَغْفِرْهُ ۚ إِنَّهُۥ كَانَ تَوَّابًۢا",
      "english":
          "In the name of Allah, most gracious, most merciful.Verily, we have blessed You with Al Kauthar (a river in Paradise). So,offer prayer and sacrifice to your Lord. Indeed, your enemy is the one cut off.",
      "urdu":
          "جب اللہ کی مدد اور فتح آپہنچے اور آپ لوگوں کو دیکھ لیں (کہ) وہ اللہ کے دین میں جوق دَر جوق داخل ہو رہے ہیں تو آپ (تشکراً) اپنے رب کی حمد کے ساتھ تسبیح فرمائیں اور (تواضعاً) اس سے استغفار کریں، بیشک وہ بڑا ہی توبہ قبول فرمانے والا (اور مزید رحمت کے ساتھ رجوع فرمانے والا) ہے",
      "description": "Recite This 13 Times inshallah your work will done ",
      "audio": "assets/SurahLahab.mp3"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = <Note>[];
      updateListView();
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: Drawer(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text('Favorite'),
                      onTap: (){


                var data=  databaseHelper.FavData();
                print("data $data");
                Get.to(FavScreen());
                      },
                    ),
                    ListTile(
                      onTap: (){Get.to(DuaHistory());},
                      leading: Icon(Icons.history),
                      title: Text('History'),
                    ),
                  ],
                )),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              // showSelectedLabels: false,
              // showUnselectedLabels: false,
              selectedItemColor: Colors.blue,

              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                print(index);
                this.onTapHandler(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Add Category',
                ),
              ],
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(title!),
            ),
            body: getBody()));
  }

  Widget getNoteListView() {
    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       GridView.builder(
    //           physics: ScrollPhysics(),
    //           shrinkWrap: true,
    //           gridDelegate:
    //               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //           itemCount: data.length,
    //           itemBuilder: (BuildContext context, int position) {
    //             return Container(
    //               height: 350,
    //               child: new Card(
    //                 child: new Column(
    //                   children: [
    //                     Expanded(
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: GridTile(
    //                           child: GestureDetector(
    //                             onTap: () {
    //                               Get.to(StaticViewDisease(), arguments: [
    //                                 data[position]["id"], //0
    //                                 data[position]['name'], //1
    //                                 data[position]['image'], //2
    //                                 data[position]['disease'], //3
    //                                 data[position]['arabic'], //4
    //                                 data[position]['english'], //5
    //                                 data[position]['urdu'], //6
    //                                 data[position]['description'], //7
    //                                 data[position]['audio'], //8
    //                               ]);
    //                             },
    //                             child: Image(
    //                                 image:
    //                                     AssetImage((data[position]['image'])),
    //                                 fit: BoxFit.fill),
    //                           ),
    //                           footer: GridTileBar(
    //                             title: Row(
    //                               children: [
    //                                 Expanded(
    //                                   child: Text(
    //                                     data[position]['name'],
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 20,
    //                                       fontWeight: FontWeight.bold,
    //                                       backgroundColor: Colors.black87,
    //                                       //height: 20
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                             trailing: null,
    //                             backgroundColor: Colors.black,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           }),

    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return new Card(
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GridTile(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ViewDisease(), arguments: [
                            File(noteList![position].image!),
                            noteList![position].name!,
                            noteList![position].cid!
                          ]);
                        },
                        child: Image(
                            image: FileImage(File(noteList![position].image!)),
                            fit: BoxFit.fill),
                      ),
                      footer: GridTileBar(
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                noteList![position].name!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.black87,
                                  //height: 20
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          children: [
                            new GestureDetector(
                              child: Icon(
                                Icons.delete,
                                color: Colors.blue,
                                size: 20,
                              ),
                              onTap: () {
                                _delete(context, noteList![position]);
                              },
                            ),
                          ],
                        ),
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id!);
    if (result != 0) {
      _showSnackBar(context, 'Disease Info Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    Future? result = Get.to(() => AddCategory(Note('', '')));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();

    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      setState(() {
        title = 'Home';
      });
      return getNoteListView();
    } else if (this.selectedIndex == 1) {
      setState(() {
        title = 'Add Category';
      });

      return AddCategory(Note('', ''));
    }

    return this.getNoteListView();
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
