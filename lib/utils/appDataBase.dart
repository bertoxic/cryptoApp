import 'package:shopping/controllers/newsController.dart';
import 'package:shopping/generated/assets.dart';
import 'package:shopping/shopping/models/newsModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class AppDataBase{
  static final AppDataBase instance =AppDataBase._init();
  static Database? _database;
  String versionNub='1';
  String tableName ="mytable";
  AppDataBase._init();

  Future<Database> get database async{
    if(_database!=null) {print('databaswcreateddddddddd');return _database!;}
    _database=await _initDB('notes.db');
    print('databaswcreated');
    return  _database!;

  }

  Future<Database> _initDB(String filePath)async{
    final dbpath = await getDatabasesPath();
    final path = join(dbpath,filePath);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db , int version) async{
   // final db = await instance.database;
    DataNote note=DataNote();
   await db.execute('''
   CREATE TABLE $tableName(
   ${DataNote.id} INTEGER PRIMARY KEY AUTOINCREMENT,
   ${DataNote.pubDate} TEXT NOT NULL,
   ${DataNote.title} TEXT NOT NULL,
   ${DataNote.creator} TEXT NOT NULL,
   ${DataNote.description} TEXT NOT NULL,
   ${DataNote.content} TEXT NOT NULL,
   ${DataNote.image_url} TEXT NOT NULL,
   ${DataNote.source_id} TEXT NOT NULL
   
   )
   ''');
  }
  // Future insert(int index)async{
  //   DataNote note=DataNote();
  //   Map<String ,dynamic> jon=Get.find<NewsController>().getDataBase(index);
  //   print("i am printing this ${jon.toString()} ${instance.database.toString()}");
  //   Database db = await instance.database;
  //   int rowid = await db.insert(tableName, jon);
  //   print(rowid.toString());
  //
  //     print('database insertedd oh success ${jon.length}');
  //     print("hey we got ${tableName.toString()}");
  //   return await rowid;

 // }
  Future create(int index) async {
    NewsModel newsM =NewsModel();
    final db = await instance.database;
    Map<String ,dynamic> jon=Get.find<NewsController>().getDataBase(index);
    // print("${jon['creator']}");
    final id = await db.insert(tableName, jon);
    print('oh hello i was just made $id');
    return newsM.copy(copyid:id);
  }

  Future<List<Map<String,dynamic>>> readNote()async{
    final db= await instance.database;
    final lizt = await db.query(tableName);
    return lizt;
  }
  Future <int> delete(int id)async{
    Database db= await instance.database;
    return db.delete(tableName,where: '${DataNote.id} = ?',whereArgs: [id]);
  }

  Future close()async{
    final db = await instance.database;
    db.close();
  }
}
