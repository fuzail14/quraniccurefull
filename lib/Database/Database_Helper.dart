import 'dart:developer';

import 'package:audioquranic/Database/adddisease.dart';
import 'package:audioquranic/Database/addduamodel.dart';
import 'package:audioquranic/Database/ayatmodel.dart';

import 'package:audioquranic/Database/joinModel.dart';
import 'package:audioquranic/Database/joinduamodel.dart';
import 'package:audioquranic/Database/newjoin.dart';
import 'package:audioquranic/Database/note.dart';
import 'package:flutter/cupertino.dart';

import 'package:sqflite/sqflite.dart';

import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'favJoinDuaModel.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database;

  // Singleton Database

  String childsTable = 'childs_table';

  String colId = 'id';
  String colname = 'name';

  String colImage = 'image';

  String DiseaseTable = 'Disease_Table';

  String dId = 'did';
  String dname = 'dname';

  String ctId = 'fkid';

  final adddua = 'adddua';

  static final surahid = 'surahid';
  final surahname = 'surahname';
  final fkdiseaseid = 'fkdiseaseid';

  static final des = 'des';
  static final count = 'count';
  static final surah = 'surah';
  static final arabic = 'arabic';
  static final urdu = 'urdu';
  static final english = 'english';

  final duafktable = 'duafktable';

  static final subdiseasefkid = 'subdiseasefkid';

  static final duafkid = 'duafkid';

  final countertable = 'countertable';

  static final counterval = 'counterval';
  static final idofbetween = 'idofbetween';

  static final ayattable = 'ayattable';
  static final fksurahid = 'fksurahid';
  static final ayatnum = 'ayatnum';
  static final description = 'description';
  static final ayatcount = 'ayatcount';
  static final ayatcounterval = 'ayatcounterval';

  static final ayaturdu = 'ayaturdu';
  static final ayatarabic = 'ayatarabic';
  static final ayateng = 'ayateng';
  static final ayataudio = 'ayataudio';
  static final fkdiseaseidinayat = 'fkdiseaseidinayat';

  final betweentable = 'newbetween';
  static final betweenid = 'betweenid';

  static final bfkdiseaseidinbetween = 'bfkdiseaseidinbetween';

  static final bsurahid = 'bsurahid';

  static final bayaturdu = 'bayaturdu';
  static final bayatarabic = 'bayatarabic';
  static final bayateng = 'bayateng';
  static final bayataudio = 'bayataudio';
  static final bdescription = 'bdescription';
  static final bayatcount = 'bayatcount';
  static final busercount = 'busercount';
  static final bcid = 'bcid';
  static final statuscode = 'statuscode';


  static final favourite = 'favourite';
  static final favouriteid = 'favouriteid';

  static final favbetweenid = 'favbetweenid';



  // static final bfksurahid = 'bfksurahid';
  // static final bayatnum = 'bayatnum';

  var result;

  List<Map>? listofmanagmentdata;

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper
  static final DatabaseHelper instance = DatabaseHelper._createInstance();

  static DatabaseHelper getInstance() {
    if (_databaseHelper == null) _databaseHelper = new DatabaseHelper();
    return _databaseHelper!;
  }

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'note.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: createDb,
    );
    return notesDatabase;
  }

  void createDb(Database db, int newVersion) async {
    print('Creating note_table... ');

    await db.execute(
        'CREATE TABLE $childsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colname TEXT,$colImage TEXT )');

    await db.execute(
        'CREATE TABLE $DiseaseTable($dId INTEGER PRIMARY KEY AUTOINCREMENT, $dname TEXT, $ctId INTEGER NOT NULL, FOREIGN KEY ($ctId) REFERENCES $childsTable($colId) )');

    await db.execute('''
          CREATE TABLE $adddua (
            $surahid INTEGER PRIMARY KEY NOT NULL,
            $surahname TEXT NOT NULL,
            $fkdiseaseid INTEGER
            
            
            
            

            

          )
          ''');

    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(1,"Surah Ikhlas")');

    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(2,"Surah Al Kausar")');
    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(3,"Surah An-Nasar")');

    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(4,"Surah Lahab")');

    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(5,"Surah Al Falak")');
    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(6,"Surah An-Nas")');
    // await db.rawInsert(
    //     'INSERT INTO $adddua ($surahid,$surahname) VALUES(15,"Surah Alam Nashrah")');

    // await db.rawInsert(
    //     'INSERT INTO $adddua ($surahid,$surahname) VALUES(8,"SURAH AT TIN")');

    // await db.rawInsert(
    //     'INSERT INTO $adddua ($surahid,$surahname) VALUES(9,"Surah Az-Zalzalah")');

    // await db.rawInsert(
    //     'INSERT INTO $adddua ($surahid,$surahname) VALUES(10,"Surah Al-Fil")');

    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(11,"Surah Al-Adiyat")');
    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(12,"Surah Quraish")');
    await db.rawInsert(
        'INSERT INTO $adddua ($surahid,$surahname) VALUES(13,"Surah Al-Ma")');

    // await db.rawInsert(
    //     'INSERT INTO $adddua ($surahid,$surahname) VALUES(14,"SURAH Al Qadar")');

    await db.execute('''
          CREATE TABLE $ayattable (
            $fksurahid INTEGER NOT NULL,
            $ayatnum TEXT NOT NULL,
            $description TEXT,
            $ayatcount TEXT,
            $ayatcounterval TEXT NOT NULL,
            $ayaturdu TEXT NOT NULL,
            $ayatarabic TEXT NOT NULL,
            $ayateng TEXT NOT NULL,
            $ayataudio TEXT NOT NULL
           
            
            
            
            
            
            
            
            

            

          )
          ''');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(1, "112001","0", " کہو کہ وہ ذات پاک جس کا نام الله ہے ایک ہے" , "قُلۡ هُوَ اللّٰهُ اَحَدٌ‌ۚ","Say: He is Allah the One", "assets/112001.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(1, "112002", "0"," معبود برحق جو بےنیاز ہے" , "اللّٰهُ الصَّمَدُ‌ۚ","Allah, the eternally Besought of all!" ,"assets/112002.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(1, "112003", "0","  نہ کسی کا باپ ہے اور نہ کسی کا بیٹا " , "  لَمۡ يَلِدۡ وَلَمۡ يُوۡلَدۡۙ ","He begetteth not nor was begotten.", "assets/112003.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(1, "112004", "0"," اور کوئی اس کا ہمسر نہیں" , "وَلَمۡ يَكُنۡ لَّهٗ كُفُوًا اَحَدٌ","And there is none comparable unto Him." ,"assets/112004.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(2, "108001", "0","  (اے محمدﷺ) ہم نے تم کو کوثر عطا فرمائی ہے " , "  اِنَّاۤ اَعۡطَيۡنٰكَ الۡكَوۡثَرَؕ","Lo! We have given thee Abundance;" ,"assets/108001.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(2, "108002","0","  تو اپنے پروردگار کے لیے نماز پڑھا کرو اور قربانی دیا کرو" , " فَصَلِّ لِرَبِّكَ وَانۡحَرۡؕ","So pray unto thy Lord, and sacrifice." ,"assets/108002.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(2, "108003","0","  کچھ شک نہیں کہ تمہارا دشمن ہی بےاولاد رہے گا" , " اِنَّ شَانِئَكَ هُوَ الۡاَبۡتَرُ ","Lo! it is thy insulter (and not thou) who is without posterity." ,"assets/108003.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(3, "110001","0","  جب اللہ کی مدد اور فتح آپہنچے" , " إِذَا جَآءَ نَصْرُ ٱللَّهِ وَٱلْفَتْحُ ","In the name of Allah, the Entirely Merciful the Especially Merciful" ,"assets/110001.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(3, "110002","0","   اور آپ لوگوں کو دیکھ لیں(کہ وہ اللہ کے دین میں جوق دَر جوق داخل ہو رہے ہیں" , " وَرَأَيْتَ ٱلنَّاسَ يَدْخُلُونَ فِى دِينِ ٱللَّهِ أَفْوَاجًۭا ","When the victory of Allah has come and the conquest," ,"assets/110002.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(3, "110003","0","  تو آپ (تشکراً) اپنے رب کی حمد کے ساتھ تسبیح فرمائیں اور (تواضعاً) اس سے استغفار کریں، بیشک وہ بڑا ہی توبہ قبول فرمانے والا (اور مزید رحمت کے ساتھ رجوع فرمانے والا) ہے " , " فَسَبِّحْ بِحَمْدِ رَبِّكَ وَٱسْتَغْفِرْهُ ۚ إِنَّهُۥ كَانَ تَوَّابًۢا ","And you see the people entering into the religion of Allah in multitudes" ,"assets/110003.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(4, "111001","0","  بولہب کے ہاتھ ٹوٹیں اور وہ ہلاک ہو " , "تَبَّتۡ يَدَاۤ اَبِىۡ لَهَبٍ وَّتَبَّؕ ","May the hands of Abu Lahab be ruined, and ruined is he" ,"assets/111001.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(4, "111002","0","   نہ تو اس کا مال ہی اس کے کچھ کام آیا اور نہ وہ جو اس نے کمایا ","مَاۤ اَغۡنٰى عَنۡهُ مَالُهٗ وَمَا كَسَبَؕ","His wealth will not avail him or that which he gained." ,"assets/111002.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(4, "111003","0","  وہ جلد بھڑکتی ہوئی آگ میں داخل ہو گا " , "سَيَصۡلٰى نَارًا ذَاتَ لَهَبٍۚ", "He will [enter to] burn in a Fire of [blazing] flame" ,"assets/111003.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(4, "111004","0","  اور اس کی جورو بھی جو ایندھن سر پر اٹھائے پھرتی ہے","وَّامۡرَاَتُهٗؕ حَمَّالَةَ الۡحَطَبِ‌ۚ","And his wife as well the carrier of firewood." ,"assets/111004.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(4, "111005","0","  اس کے گلے میں مونج کی رسّی ہو گی " , "فِىۡ جِيۡدِهَا حَبۡلٌ مِّنۡ مَّسَدٍ","Around her neck is a rope of twisted fiber" ,"assets/111005.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(5, "113001","0","  کہو کہ میں صبح کے پروردگار کی پناہ مانگتا ہوں " , "قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ","Say, “I seek refuge in the Lord of daybreak" ,"assets/113001.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(5, "113002","0","  ہر چیز کی بدی سے جو اس نے پیدا کی " , "مِن شَرِّ مَا خَلَقَ","From the evil of that which He created" ,"assets/113002.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(5, "113003","0","  اور شب تاریکی کی برائی سے جب اس کااندھیرا چھا جائے " , "وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ","And from the evil of darkness when it settles" ,"assets/113003.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(5, "113004","0","  اور گنڈوں پر پڑھ پڑھ کر پھونکنے والیوں کی برائی سے " , "وَمِن شَرِّ ٱلنَّفَّـٰثَـٰتِ فِى ٱلْعُقَدِ","And from the evil of the blowers in knots" ,"assets/113004.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(5, "113005","0","  اور حسد کرنے والے کی برائی سے جب حسد کرنے لگے " , "وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ","And from the evil of an envier when he envies" ,"assets/113005.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(6, "114001","0","   کہو کہ میں لوگوں کے پروردگار کی پناہ مانگتا ہوں " , "قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ","Say I seek refuge in the Lord of mankind" ,"assets/114001.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(6, "114002","0","  یعنی لوگوں کے حقیقی بادشاہ کی " , "مَلِكِ ٱلنَّاسِ","The Sovereign of mankind" ,"assets/114002.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(6, "114003","0","   لوگوں کے معبود برحق کی " , "إِلَـٰهِ ٱلنَّاسِ","The God of mankind" ,"assets/114003.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(6, "114004","0","   شیطان وسوسہ انداز کی برائی سے جو خدا کا نام سن کر پیچھے ہٹ جاتا ہے " , "مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ","From the evil of the retreating whisperer" ,"assets/114004.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(6, "114005","0","   جو لوگوں کے دلوں میں وسوسے ڈالتا ہے " , "ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ","Who whispers [evil] into the breasts of mankind" ,"assets/114005.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(6, "114006","0","   وہ جنّات میں سے ہو یا انسانوں میں سے " , "مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ","From among the jinn and mankind" ,"assets/114006.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094001","0","  اے محمدﷺ کیا ہم نے تمہارا سینہ کھول نہیں دیا بےشک کھول دیا " , "أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ","Did We not expand for you O Muhammad your breast" ,"assets/094001.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094002","0","  اور تم پر سے بوجھ بھی اتار دیا " , "وَوَضَعۡنَا عَنۡكَ وِزۡرَكَۙ","And eased thee of the burden" ,"assets/094002.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094003","0","  جس نے تمہاری پیٹھ توڑ رکھی تھی " , "الَّذِىۡۤ اَنۡقَضَ ظَهۡرَكَۙ","Which weighed down thy back" ,"assets/094003.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094004","0","  اور تمہارا ذکر بلند کیا " , " وَرَفَعۡنَا لَـكَ ذِكۡرَكَؕ","And exalted thy fame?" ,"assets/094004.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094005","0","  ہاں ہاں مشکل کے ساتھ آسانی بھی ہے " , "  فَاِنَّ مَعَ الۡعُسۡرِ يُسۡرًاۙ","But lo! with hardship goeth ease," ,"assets/094005.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094006","0","  اور بے شک مشکل کے ساتھ آسانی ہے " , "  اِنَّ مَعَ الۡعُسۡرِ يُسۡرًاؕ","Lo! with hardship goeth ease" ,"assets/094006.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094007","0","  تو جب فارغ ہوا کرو تو (عبادت میں) محنت کیا کرو " , "  فَاِذَا فَرَغۡتَ فَانصَبۡۙ","So when thou art relieved, still toil" ,"assets/094007.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(15, "094008","0","  اور اپنے پروردگار کی طرف متوجہ ہو جایا کرو " , " وَاِلٰى رَبِّكَ فَارۡغَب","And strive to please thy Lord" ,"assets/094008.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095001","0","   انجیر کی قسم اور زیتون کی " , "وَٱلتِّينِ وَٱلزَّيْتُونِ","By the fig and the olive" ,"assets/095001.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095002","0","   اور طور سینین کی " , "وَطُوۡرِ سِيۡنِيۡنَ","By Mount Sinai," ,"assets/095002.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095003","0","     اور اس امن والے شہر کی " , " وَهٰذَا الۡبَلَدِ الۡاَمِيۡ","And by this land made safe" ,"assets/095003.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095004","0","      کہ ہم نے انسان کو بہت اچھی صورت میں پیدا کیا ہے " , "لَقَدۡ خَلَقۡنَا الۡاِنۡسَانَ فِىۡۤ اَحۡسَنِ تَقۡوِيۡمٍ","Surely We created man of the best stature" ,"assets/095004.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095005","0","       پھر (رفتہ رفتہ) اس (کی حالت) کو (بدل کر) پست سے پست کر دیا " , "  ثُمَّ رَدَدۡنٰهُ اَسۡفَلَ سَافِلِيۡنَ","Then we reduced him to the lowest of the low," ,"assets/095005.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095006","0","      مگر جو لوگ ایمان لائے اور نیک عمل کرتے رہے انکے لیے بےانتہا اجر ہے " , "   اِلَّا الَّذِيۡنَ اٰمَنُوۡا وَعَمِلُوۡا الصّٰلِحٰتِ فَلَهُمۡ اَجۡرٌ غَيۡرُ مَمۡنُوۡنٍ","Save those who believe and do good works, and theirs is a reward unfailing" ,"assets/095006.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095007","0","       تو (اے آدم زاد) پھر تو جزا کے دن کو کیوں جھٹلاتا ہے؟ " , "  فَمَا يُكَذِّبُكَ بَعۡدُ بِالدِّيۡنِ","So who henceforth will give the lie to thee about the judgment" ,"assets/095007.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(8, "095008","0","         کیا خدا سب سے بڑا حاکم نہیں ہے؟" , "اَلَيۡسَ اللّٰهُ بِاَحۡكَمِ الۡحٰكِمِيۡ","Is not Allah the most conclusive of all judges" ,"assets/095008.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099001","0","    جب زمین بھونچال سے ہلا دی جائے گی" , "إِذَا زُلْزِلَتِ ٱلْأَرْضُ زِلْزَالَهَا","When the earth is shaken in its ultimate quaking" ,"assets/099001.mp3")');
    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099002","0","   اور زمین اپنے (اندر) کے بوجھ نکال ڈالے گی " , "إوَأَخْرَجَتِ ٱلْأَرْضُ أَثْقَالَهَا","and when the earth throws out all its contents," ,"assets/099002.mp3")');
    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099003","0","   اور انسان کہے گا کہ اس کو کیا ہوا ہے؟" , "وَقَالَ ٱلْإِنسَـٰنُ مَا لَهَا","and humanity cries, “What is wrong with it?—," ,"assets/099003.mp3")');
    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099004","0","   اس روز وہ اپنے حالات بیان کردے گی" , "يَوْمَئِذٍۢ تُحَدِّثُ أَخْبَارَهَا","on that Day the earth will recount everything," ,"assets/099004.mp3")');
    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099005","0","   کیونکہ تمہارے پروردگار نے اس کو حکم بھیجا (ہوگا )" , "بِأَنَّ رَبَّكَ أَوْحَىٰ لَهَا","having been inspired by your Lord to do so." ,"assets/099005.mp3")');
    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099006","0","    اس دن لوگ گروہ گروہ ہو کر آئیں گے تاکہ ان کو ان کے اعمال دکھا دیئے جائیں" , "يَوْمَئِذٍۢ يَصْدُرُ ٱلنَّاسُ أَشْتَاتًۭا لِّيُرَوْا۟ أَعْمَـٰلَهُمْ","On that Day people will proceed in separate groups1 to be shown ˹the consequences of˺ their deeds." ,"assets/099006.mp3")');
    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099007","0","      تو جس نے ذرہ بھر نیکی کی ہو گی وہ اس کو دیکھ لے گا" , "فَمَن يَعْمَلْ مِثْقَالَ ذَرَّةٍ خَيْرًۭا يَرَهُۥۥ","So whoever does an atoms weight of good will see it." ,"assets/099007.mp3")');
    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(9, "099008","0","       اور جس نے ذرہ بھر برائی کی ہوگی وہ اسے دیکھ لے گا" , "وَمَن يَعْمَلْ مِثْقَالَ ذَرَّةٍۢ شَرًّۭا يَرَهُۥۥۥ","And whoever does an atoms weight of evil will see it." ,"assets/099008.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(10, "105001","0","   کیا تم نے نہیں دیکھا کہ تمہارے پروردگار نے ہاتھی والوں کے ساتھ کیا کی" , "أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَـٰبِ ٱلْفِيلِ","Have you not seen how your Lord dealt with those who had elephants?" ,"assets/105001.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(10, "105002","0","    کیا ان کا داؤں غلط نہیں کیا " , "أاَلَمۡ يَجۡعَلۡ كَيۡدَهُمۡ فِىۡ تَضۡلِيۡلٍۙ","Did He not bring their stratagem to naught" ,"assets/105002.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(10, "105003","0","    اور ان پر جھلڑ کے جھلڑ جانور بھیجے " , "وَّاَرۡسَلَ عَلَيۡهِمۡ طَيۡرًا اَبَابِيۡلَۙ","And send against them swarms of flying creatures," ,"assets/105003.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(10, "105004","0","    جو ان پر کھنگر کی پتھریاں پھینکتے تھ" , "وتَرۡمِيۡهِمۡ بِحِجَارَةٍ مِّنۡ سِجِّيۡلٍ","Which pelted them with stones of baked clay" ,"assets/105004.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(10, "105005","0","     تو ان کو ایسا کر دیا جیسے کھایا ہوا بھس" , " فَجَعَلَهُمۡ كَعَصۡفٍ مَّاۡكُوۡلٍ","And made them like green crops devoured " ,"assets/105005.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100001","0","       ان سرپٹ دوڑنے والے گھوڑوں کی قسم جو ہانپ اٹھتےہیں" , "وَٱلْعَـٰدِيَـٰتِ ضَبْحًۭا","By the galloping, panting horses" ,"assets/100001.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100002","0","       پھر (پتھروں پر نعل) مار کر آگ نکالتے ہیں" , "فَٱلْمُورِيَـٰتِ قَدْحًۭا","striking sparks of fire with their hoofs," ,"assets/100002.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100003","0","        پھر صبح کو چھاپہ مارتے ہیں" , "فَٱلْمُغِيرَٰتِ صُبْحًۭا","launching raids at dawn," ,"assets/100003.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100004","0","        پھر اس میں گرد اٹھاتے ہیں" , "فَأَثَرْنَ بِهِۦ نَقْعًۭا","stirring up clouds of dust," ,"assets/100004.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100005","0","        پھر اس وقت دشمن کی فوج میں جا گھستے ہیں" , "فَوَسَطْنَ بِهِۦ جَمْعًا","and penetrating into the heart of enemy lines!" ,"assets/100005.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100006","0","         کہ انسان اپنے پروردگار کا احسان ناشناس (اور ناشکرا) ہے" , "فإِنَّ ٱلْإِنسَـٰنَ لِرَبِّهِۦ لَكَنُودٌۭ","Surely humankind is ungrateful to their Lord—" ,"assets/100006.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100007","0","          اور وہ اس سے آگاہ بھی ہے" , "وَإِنَّهُۥ عَلَىٰ ذَٰلِكَ لَشَهِيدٌۭ","and they certainly attest to this—" ,"assets/100007.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100008","0","          وہ تو مال سے سخت محبت کرنے والا ہے" , "وَإِنَّهُۥ لِحُبِّ ٱلْخَيْرِ لَشَدِيدٌ","and they are truly extreme in their love of worldly gains." ,"assets/100008.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100009","0","           کیا وہ اس وقت کو نہیں جانتا کہ جو( مردے) قبروں میں ہیں وہ باہر نکال لیے جائیں گے" ,"أَفَلَا يَعْلَمُ إِذَا بُعْثِرَ مَا فِى ٱلْقُبُورِ ","Do they not know that when the contents of the graves will be spilled out," ,"assets/100009.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100010","0","           اور جو (بھید) دلوں میں ہیں وہ ظاہر کر دیئے جائیں گے"," وَحُصِّلَ مَا فِى ٱلصُّدُورِ ","and the secrets of the hearts will be laid bare—" ,"assets/100010.mp3")');
    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(11, "100011","0","            بےشک ان کا پروردگار اس روز ان سے خوب واقف ہوگا","إِنَّ رَبَّهُم بِهِمْ يَوْمَئِذٍۢ لَّخَبِيرٌۢ ","surely their Lord is All-Aware of them on that Day." ,"assets/100011.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(12, "106001","0","     قریش کے مانوس کرنے کے سبب" , " لِإِيلَـٰفِ قُرَيْشٍٍۙ"," For the taming of Qureysh. " ,"assets/106001.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(12, "106002","0","     ان کو جاڑے اور گرمی کے سفر سے مانوس کرنے کے سبب" , " اٖلٰفِهِمۡ رِحۡلَةَ الشِّتَآءِ وَالصَّيۡفِ‌ۚ","For their taming the caravans to set forth in winter and summer. " ,"assets/106002.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(12, "106003","0","     لوگوں کو چاہیئے کہ  اس گھر کے مالک کی عبادت کریں" , " فَلۡيَعۡبُدُوۡا رَبَّ هٰذَا الۡبَيۡتِۙ","So let them worship the Lord of this House, " ,"assets/106003.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(12, "106004","0","     جس نے ان کو بھوک میں کھانا کھلایا اور خوف سے امن بخشا" , "لَّذِىۡۤ اَطۡعَمَهُمۡ مِّنۡ جُوۡعٍوَّاٰمَنَهُمۡ مِّنۡ خَوۡفٍ","Who hath fed them against hunger and hath made them safe from fear " ,"assets/106004.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(13, "107001","0","     بھلا تم نے اس شخص کو دیکھا جو  جزا کو جھٹلاتا ہے" , "اَرَءَيۡتَ الَّذِىۡ يُكَذِّبُ بِالدِّيۡنِؕ","Hast thou observed him who belieth religion " ,"assets/107001.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(13, "107002","0","     یہ وہی ہے، جو یتیم کو دھکے دیتا ہے" , "افَذٰلِكَ الَّذِىۡ يَدُعُّ الۡيَتِيۡمَۙ"," That is he who repelleth the orphan" ,"assets/107002.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(13, "107003","0","     اور فقیر کو کھانا کھلانے کے لیے ترغیب نہیں دیتا" , "وَ لَا يَحُضُّ عَلٰى طَعَامِ الۡمِسۡكِيۡنِؕ","And urgeth not the feeding of the needy. " ,"assets/107003.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(13, "107004","0","     و ایسے نمازیوں کی خرابی ہے" , "افَوَيۡلٌ لِّلۡمُصَلِّيۡنَۙ","Ah, woe unto worshippers" ,"assets/107004.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(13, "107005","0","     جو نماز کی طرف سے غافل رہتے ہیں" , "الَّذِيۡنَ هُمۡ عَنۡ صَلَاتِهِمۡ سَاهُوۡنَۙ","Who are heedless of their prayer " ,"assets/107005.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(13, "107006","0","      جو ریا کاری کرتے ہیں" , "الَّذِيۡنَ هُمۡ يُرَآءُوۡنَۙ"," Who would be seen " ,"assets/107006.mp3")');

    await db.rawInsert(
        'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(13, "107007","0","     اور برتنے کی چیزیں عاریتہً نہیں دیتے" , "وَيَمۡنَعُوۡنَ الۡمَاعُوۡنَ","Yet refuse small kindnesses " ,"assets/107007.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(14, "097001","0"," ہم نے اس( قرآن) کو شب قدر میں نازل (کرنا شروع) کیا" , "  اِنَّاۤ اَنۡزَلۡنٰهُ فِىۡ لَيۡلَةِ الۡقَدۡرِۚ ","Is not Allah the most conclusive of all judges" ,"assets/097001.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(14, "097002","0","  اور تمہیں کیا معلوم کہ شب قدر کیا ہے؟" , "وَمَاۤ اَدۡرٰٮكَ مَا لَيۡلَةُ الۡقَدۡرِؕ","Is not Allah the most conclusive of all judges" ,"assets/097002.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(14, "097003","0","لَيۡلَةُ الۡقَدۡرِخَيۡرٌ مِّنۡ اَلۡفِ شَهۡرٍؕ"," شب قدر ہزار مہینے سے بہتر ہے" ,"Is not Allah the most conclusive of all judges" ,"assets/097003.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(14, "097004","0","  اس میں روح (الامین) اور فرشتے ہر کام کے (انتظام کے) لیے اپنے پروردگار کے حکم سے اترتے ہیں" , " تَنَزَّلُ الۡمَلٰٓٮِٕكَةُ وَالرُّوۡحُ فِيۡهَا بِاِذۡنِ رَبِّهِمۡ‌ۚ مِّنۡ كُلِّ اَمۡرٍۛ","Is not Allah the most conclusive of all judges" ,"assets/097004.mp3")');

    // await db.rawInsert(
    //     'INSERT INTO $ayattable ($fksurahid,$ayatnum,$ayatcounterval,$ayaturdu,$ayatarabic,$ayateng,$ayataudio) VALUES(14, "097005","0"," رات طلوع صبح تک (امان اور) سلامتی ہے ","سَلٰمٌ هِىَ حَتّٰى مَطۡلَعِ الۡفَجۡرِ" ,"Is not Allah the most conclusive of all judges" ,"assets/097005.mp3")');

    await db.execute(
        'CREATE TABLE $duafktable($subdiseasefkid INTEGER, $duafkid INTEGER,FOREIGN KEY ($subdiseasefkid) REFERENCES $DiseaseTable($dId), FOREIGN KEY ($duafkid) REFERENCES $ayattable($fksurahid) )');

    await db.execute(
        'CREATE TABLE $countertable($counterval INTEGER,$idofbetween INTEGER,FOREIGN KEY ($idofbetween) REFERENCES $betweentable($betweenid) )');

    await db.execute(
        'CREATE TABLE $favourite($favouriteid INTEGER PRIMARY KEY AUTOINCREMENT,$favbetweenid INTEGER,FOREIGN KEY ($favbetweenid) REFERENCES $betweentable($betweenid) )');

    print('third data');

    print('Child_Table Created....... ');
    print('DB Created... ');

    await db.execute(
        'CREATE TABLE $betweentable($betweenid INTEGER PRIMARY KEY AUTOINCREMENT,$bfkdiseaseidinbetween INTEGER NOT NULL,$bsurahid INTEGER NOT NULL,$bayaturdu TEXT NOT NULL, $bayatarabic TEXT NOT NULL,$bayateng TEXT NOT NULL,$bayataudio TEXT NOT NULL,$bdescription TEXT,$bayatcount TEXT,$busercount TEXT,$bcid INTEGER,$statuscode INTEGER)');

    print("between table");
  }

  void updatecounter(dynamic getcounterval, dynamic idofbet,int status) async {
    print("come from new screen");
    var db = await this.database;
    var result = await db.rawUpdate('''
    UPDATE $betweentable 
    SET $busercount = ? 
    ,$statuscode = ?
    WHERE $betweenid = $idofbet
    ''', ["$getcounterval","$status"]);
  }

  void BetweenTableRawInsertrion(
    int fksubdid,
    int recbsurahid,
    String urdu,
    String arabic,
    String eng,
    List<String> audio,
    String des,
    dynamic count,
    dynamic ucount,
      dynamic cid,
      dynamic statuscode
  ) async {
    print('-----------------------------');

    print(fksubdid);
    print(recbsurahid);
    print(urdu);
    print(arabic);
    print(eng);
    print(audio);
    print(des);
    print(count);
    print(ucount);
    print(cid);


    Map<String, dynamic> row = {
      "bfkdiseaseidinbetween": fksubdid,
      "bsurahid": recbsurahid,
      "bayaturdu": urdu,
      "bayatarabic": arabic,
      "bayateng": eng,
      "bayataudio": audio.toString(),
      "bdescription": des,
      "bayatcount": count,
      "busercount": ucount,
      "bcid":cid,
      "statuscode": statuscode
    };

    print('-----------------------------');
    int id = await _database!.insert(betweentable, row);
    // await _database!.rawInsert(
    //     'INSERT INTO $betweentable ($bfkdiseaseidinbetween,$bsurahid,$bayaturdu) VALUES ($fksubdid,$recbsurahid,$urdu)');

    List<Map> list =
        await _database!.rawQuery('SELECT $betweenid FROM $betweentable');

    List<Map> listt =
    await _database!.rawQuery('SELECT  * FROM $betweentable');

    print("list of between table insertion.. $listt");
    log("list of between table insertion.. $listt");

    print('new between table');
  }

  void addDiseaseForeginKey(dynamic subdid, dynamic idofdua) async {
    print("update foregin key on save button $subdid");
    print("update foregin key on save button $idofdua");

    await _database!.rawInsert(
        'INSERT INTO $duafktable ($subdiseasefkid,$duafkid) VALUES($subdid,$idofdua)');
    print('new table');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    //	var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(childsTable, orderBy: '$colId ASC');
    return result;
  }

  Future<List<Map<String, dynamic>>> getDiseaseMapList() async {
    Database db = await this.database;

    //	var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(DiseaseTable, orderBy: '$dId ASC');
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(childsTable, note.toMap());

    return result;
  }

  Future<int> insertDisease(AddDiseaseModel addDiseaseModel) async {
    Database db = await this.database;
    var result = await db.insert(DiseaseTable, addDiseaseModel.toMap());

    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(childsTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  Future<int> updateDisease(AddDiseaseModel addDiseaseModel) async {
    var db = await this.database;
    var result = await db.update(DiseaseTable, addDiseaseModel.toMap(),
        where: '$dId = ?', whereArgs: [addDiseaseModel.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $childsTable WHERE $colId = $id');
    return result;
  }

  Future<List> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>>? x =
        await db.rawQuery('SELECT COUNT (*) from $childsTable');

    int result;
    result = Sqflite.firstIntValue(x)!;
    print('count $x');
    return x;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Note>> getNoteList() async {
    var dbClient = await database;

    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $childsTable');

    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<Note> noteList = <Note>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }
    //print('list of childs $list');

    return noteList;
  }

  Future<List<AddDiseaseModel>> getDiseaseList() async {
    var dbClient = await database;

    var noteMapList = await getDiseaseMapList(); // Get 'Map List' from database
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $DiseaseTable');
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<AddDiseaseModel> addDiseaseModel = <AddDiseaseModel>[];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      addDiseaseModel.add(AddDiseaseModel.fromMapObject(noteMapList[i]));
    }
    print('list of disease $list');

    return addDiseaseModel;
  }

  Future<void> deleteDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + 'note.db';
    databaseFactory.deleteDatabase(path);
    print('Successfully Database deleted');
  }

  Future<List<JoinModel>> join(int cid) async {
    var db = await database;

    List<Map>? listofjoindata = await db.rawQuery(
        'select * from childs_table JOIN Disease_Table on childs_table.id=Disease_Table.fkid where childs_table.id= ' +
            '$cid');

    List<Map> listofJoinDatainGetFunction = listofjoindata;
    List<JoinModel> joinm = <JoinModel>[];
    for (int i = 0; i < listofJoinDatainGetFunction.length; i++) {
      joinm.add(new JoinModel(
        listofJoinDatainGetFunction[i]["did"],
        listofJoinDatainGetFunction[i]["dname"],
        listofJoinDatainGetFunction[i]["fkid"],
      ));
    }
    print('list of join data:$listofJoinDatainGetFunction');
    print(joinm.length);
    return joinm;
  }

  Future<List<AddDuaModel>> getadddua() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $adddua');
    List<AddDuaModel> slctdua = <AddDuaModel>[];
    for (int i = 0; i < list.length; i++) {
      slctdua.add(new AddDuaModel(
        list[i]["surahid"], list[i]["surahname"],
        //list[i]["des"], list[i]["count"], list[i]["surah"]
      ));
    }
    //print('list data:$list');
    //print(slctdua.length);

    return slctdua;
  }

  Future<List<AyatModel>> getayatdata() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $ayattable');
    List<AyatModel> slctdua = <AyatModel>[];
    for (int i = 0; i < list.length; i++) {
      slctdua.add(new AyatModel(
        list[i]["fksurahid"],
        list[i]["ayatnum"],
        list[i]["ayaturdu"],
        list[i]["ayatarabic"],
        list[i]["ayateng"],
        list[i]["ayataudio"],
      ));
    }
    //print('list of ayat data:$list');
    //print(slctdua.length);
    return slctdua;
  }

  Future<List> getsurahnameinlist() async {
    var dbClient = await database;
    List list =
        await dbClient.rawQuery('SELECT $surahname,$surahid FROM $adddua ');

    return list;
  }

  Future<List<JoinModel>> AddDAUAjoin(int cid) async {
    var db = await database;

    List<Map>? listofjoindata = await db.rawQuery(
        'select * from childs_table JOIN Disease_Table on childs_table.id=Disease_Table.fkid where childs_table.id= ' +
            '$cid');

    List<Map> listofJoinDatainGetFunction = listofjoindata;
    List<JoinModel> joinm = <JoinModel>[];
    for (int i = 0; i < listofJoinDatainGetFunction.length; i++) {
      joinm.add(new JoinModel(
        listofJoinDatainGetFunction[i]["did"],
        listofJoinDatainGetFunction[i]["dname"],
        listofJoinDatainGetFunction[i]["fkid"],
      ));
    }
    print('list of join data:$listofJoinDatainGetFunction');
    print(joinm.length);
    return joinm;
  }

  void updateForeginkey(dynamic getcounterval, dynamic idofdua) async {
    var db = await this.database;
    var result = await db.rawUpdate('''
    UPDATE $ayattable 
    SET $ayatcounterval = ? 
    WHERE $fksurahid = $idofdua
    ''', ["$getcounterval"]);
    getadddua();
  }

  Future<List<JoinDuaModel>> joinDua(int cid) async {
    print("subdiseaseid....$cid");
    var db = await database;

    List<Map>? listofjoindata = await db.rawQuery(
        'select * from newbetween JOIN Disease_Table on newbetween.bfkdiseaseidinbetween = Disease_Table.did where newbetween.bfkdiseaseidinbetween=' +
            '$cid ');
    print("iam here bro");
    print(listofjoindata);
    List<Map> listofJoinDatainGetFunction = listofjoindata;


    List<JoinDuaModel> joinm = <JoinDuaModel>[];
    for (int i = 0; i < listofjoindata.length; i++) {
      joinm.add(new JoinDuaModel(
        listofJoinDatainGetFunction[i]["betweenid"],
        listofJoinDatainGetFunction[i]["bfkdiseaseidinbetween"],
        listofJoinDatainGetFunction[i]["bsurahid"],
        listofJoinDatainGetFunction[i]["bayaturdu"],
        listofJoinDatainGetFunction[i]["bayatarabic"],
        listofJoinDatainGetFunction[i]["bayateng"],
        listofJoinDatainGetFunction[i]["bayataudio"],
        listofJoinDatainGetFunction[i]["did"],
        listofJoinDatainGetFunction[i]["dname"],
        listofJoinDatainGetFunction[i]["fkid"],
        listofJoinDatainGetFunction[i]["bdescription"],
        listofJoinDatainGetFunction[i]["bayatcount"],
        listofJoinDatainGetFunction[i]["busercount"],
      ));
    }
    // print(
    //   'list of join data in join dua function:$listofJoinDatainGetFunction');
    //print("length    ${joinm.length}");
    return joinm;
  }

  Future<List> getonchangedata(var idofdua) async {
    var dbClient = await database;
    List list = await dbClient
        .rawQuery('SELECT * FROM $ayattable WHERE $fksurahid = $idofdua ');

    //print(' ayat num:$list');
    return list;
  }

  // void updatedescription(dynamic getdes, dynamic from, dynamic to) async {
  //   // print("idss recieve $getdes");
  //   //print("ayat num $from");
  //   //print("ayat num $to");

  //   var db = await this.database;
  //   var result = await db.rawUpdate('''
  //   UPDATE $ayattable
  //   SET $description = ?
  //   WHERE $ayatnum BETWEEN $from AND $to
  //   ''', ["$getdes"]);
  //   getayatdata();
  // }

  // void updatecount(dynamic getcount, dynamic from, dynamic to) async {
  //   print("idss recieve $getcount");
  //   print("ayat num $from");
  //   print("ayat num $to");

  //   var db = await this.database;
  //   var result = await db.rawUpdate('''
  //   UPDATE $ayattable
  //   SET $ayatcount = ?
  //   WHERE $ayatnum BETWEEN $from AND $to
  //   ''', ["$getcount"]);
  //   getayatdata();
  // }

  Future<dynamic> GetAyatBetweenData(
      dynamic getayatnumfrom,
      dynamic getayatnumto,
      dynamic subdid,
      dynamic idofdua,
      dynamic des,
      dynamic count,
      dynamic ucount,

      dynamic cid,
      dynamic statuscode) async {
    print("get ayat num from $getayatnumfrom");
    print("get ayat num to $getayatnumto");
    print("subdid $subdid");
    print("id of dua $idofdua");
    var db = await this.database;
    List<Map>? res = await db.rawQuery('''
    SELECT * FROM $ayattable WHERE $ayatnum BETWEEN $getayatnumfrom AND  $getayatnumto 
    ''');
    print("result between $res");
    List<String> urdu = [];
    List<String> arabic = [];
    List<String> eng = [];
    List<String> audio = [];

    for (int i = 0; i < res.length; i++) {
      urdu.add(res[i]["ayaturdu"]);
      arabic.add(res[i]["ayatarabic"]);
      eng.add(res[i]["ayateng"]);
      audio.add(res[i]["ayataudio"]);
    }

    print("urdu ${urdu.join()}");
    print("arabic ${arabic.join()}");
    print("eng ${eng.join()}");
    print("audio ${audio}");
    BetweenTableRawInsertrion(subdid, idofdua, urdu.toString(), arabic.toString(),
        eng.toString(), audio, des, count, ucount,cid,statuscode);

    return res;
  }

  void updateAddDuaForeginkey(dynamic fkdid, dynamic addduaid) async {
    print("idss rec fkdid $fkdid");
    print("idss rec subdid $addduaid");

    var db = await this.database;
    var result = await db.rawUpdate('''
    UPDATE $adddua 
    SET $fkdiseaseid = ? 
    WHERE $surahid = $addduaid
    ''', ["$fkdid"]);
    getadddua();
  }

  void updateAyatForeginkey(dynamic fkdid, dynamic from, dynamic to) async {
    print("idss rec fkdid $fkdid");
    print("from recieve $from");
    print("to recieve $to");

    var db = await this.database;
    var result = await db.rawUpdate('''
    UPDATE $ayattable 
    SET $fkdiseaseidinayat = ? 
    WHERE $ayatnum BETWEEN $from AND $to
    ''', ["$fkdid"]);
    print("updateAyatForeginkey $result");
  }

  Future<List<NewJoinDuaModel>> NewData(var bid) async {
    var dbClient = await database;
    List<Map>? list = await dbClient
        .rawQuery('SELECT * FROM $betweentable WHERE $betweenid = $bid  ');
    print("iam here bro");
    print(list);
    List<Map> listofJoinDatainGetFunction = list;

    List<NewJoinDuaModel> joinm = <NewJoinDuaModel>[];
    for (int i = 0; i < list.length; i++) {
      joinm.add(new NewJoinDuaModel(
        listofJoinDatainGetFunction[i]["betweenid"],
        listofJoinDatainGetFunction[i]["bfkdiseaseidinbetween"],
        listofJoinDatainGetFunction[i]["bsurahid"],
        listofJoinDatainGetFunction[i]["bayaturdu"],
        listofJoinDatainGetFunction[i]["bayatarabic"],
        listofJoinDatainGetFunction[i]["bayateng"],
        listofJoinDatainGetFunction[i]["bayataudio"],
        listofJoinDatainGetFunction[i]["did"],
        listofJoinDatainGetFunction[i]["dname"],
        listofJoinDatainGetFunction[i]["fkid"],
        listofJoinDatainGetFunction[i]["bdescription"],
        listofJoinDatainGetFunction[i]["bayatcount"],
        listofJoinDatainGetFunction[i]["busercount"],
        listofJoinDatainGetFunction[i]["bayatcount"],
        listofJoinDatainGetFunction[i]["statuscode"],

      ));
    }
    // print(
    //     'list of join data in join dua function new screennnn:$listofJoinDatainGetFunction');
    log(     'list of join data in join dua function new screennnn:$listofJoinDatainGetFunction');
    print("length  new screennnn  ${joinm.length}");
    return joinm;
  }


  void updateFavForeignId(int? favduaid) async{



    var db = await this.database;
    var s= await _database!.rawInsert(
        'INSERT INTO $favourite ($favbetweenid) VALUES($favduaid)');


    print("sjsjsjs$s");




    // List<Map> list = await db.rawQuery('SELECT DISTINCT $favbetweenid FROM $favourite ');
    // print("hddksfdjke  $list ");
  }

  Future<List<Map>> FavData() async {
    var dbClient = await database;
    List<Map>? listofjoindata = await dbClient.rawQuery(
        'select DISTINCT betweenid, bayaturdu, bayatarabic,  bayateng , bayataudio, bdescription, bayatcount, busercount from newbetween JOIN $favourite on newbetween.betweenid = $favourite.$favbetweenid ');

    print(  "fav  $listofjoindata");

    // List<Map> listofJoinDatainGetFunction = listofjoindata;
    //
    //
    // List<favjoinDuaModel> joinm = <favjoinDuaModel>[];
    // for (int i = 0; i < listofjoindata.length; i++) {
    //   joinm.add(new favjoinDuaModel(
    //     listofJoinDatainGetFunction[i]["betweenid"],
    //     listofJoinDatainGetFunction[i]["bfkdiseaseidinbetween"],
    //     listofJoinDatainGetFunction[i]["bsurahid"],
    //     listofJoinDatainGetFunction[i]["bayaturdu"],
    //     listofJoinDatainGetFunction[i]["bayatarabic"],
    //     listofJoinDatainGetFunction[i]["bayateng"],
    //     listofJoinDatainGetFunction[i]["bayataudio"],
    //     listofJoinDatainGetFunction[i]["did"],
    //     listofJoinDatainGetFunction[i]["dname"],
    //     listofJoinDatainGetFunction[i]["fkid"],
    //     listofJoinDatainGetFunction[i]["bdescription"],
    //     listofJoinDatainGetFunction[i]["bayatcount"],
    //     listofJoinDatainGetFunction[i]["busercount"],
    //     listofJoinDatainGetFunction[i]["bcid"],
    //
    //   ));
    // }
    //
    // print(
    //     'list of join data in join dua function new screennnn:$listofJoinDatainGetFunction');
    // print("length  new screennnn  ${joinm.length}");
    //
    return listofjoindata;
  }



  Future<List<NewJoinDuaModel>> DuaHistory() async {
    var dbClient = await database;
    List<Map>? list = await dbClient
        .rawQuery('SELECT * FROM $betweentable WHERE $statuscode=0');
    print("iam here bro");
    print(list);
    List<Map> listofJoinDatainGetFunction = list;

    List<NewJoinDuaModel> joinm = <NewJoinDuaModel>[];
    for (int i = 0; i < list.length; i++) {
      joinm.add(new NewJoinDuaModel(
        listofJoinDatainGetFunction[i]["betweenid"],
        listofJoinDatainGetFunction[i]["bfkdiseaseidinbetween"],
        listofJoinDatainGetFunction[i]["bsurahid"],
        listofJoinDatainGetFunction[i]["bayaturdu"],
        listofJoinDatainGetFunction[i]["bayatarabic"],
        listofJoinDatainGetFunction[i]["bayateng"],
        listofJoinDatainGetFunction[i]["bayataudio"],
        listofJoinDatainGetFunction[i]["did"],
        listofJoinDatainGetFunction[i]["dname"],
        listofJoinDatainGetFunction[i]["fkid"],
        listofJoinDatainGetFunction[i]["bdescription"],
        listofJoinDatainGetFunction[i]["bayatcount"],
        listofJoinDatainGetFunction[i]["busercount"],
        listofJoinDatainGetFunction[i]["bayatcount"],
        listofJoinDatainGetFunction[i]["statuscode"],

      ));
    }
    // print(
    //     'list of join data in join dua function new screennnn:$listofJoinDatainGetFunction');
    log(     'list of join data in join dua function new screennnn:$listofJoinDatainGetFunction');
    print("length  new screennnn  ${joinm.length}");
    return joinm;
  }
}
