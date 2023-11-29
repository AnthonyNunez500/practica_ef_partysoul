import 'package:practica_ef_partysoul/models/joke.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  final int version = 1;
  Database? db;

  static final DbHelper dbHelper = DbHelper.internal();

  DbHelper.internal();

  factory DbHelper(){
    return dbHelper;
  }

  Future<Database> openDb() async{
    db ??= await openDatabase(
        join(await getDatabasesPath(), 'favoriteJokes.db'),
        onCreate: (database, version){
          database.execute(
              'CREATE TABLE favorites(id INTEGER PRIMARY KEY, text TEXT, rating DOUBLE)'
          );
        },
        version: version
    );
    return db!;
  }

  Future<int> insertFavorite(Joke favorito) async{
    int id = await db!.insert(
        'favorites',
        favorito.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
    //print(favorito);
    //print(id);
    return id;
  }
  Future<Joke>  getBestFavorite() async{
    final List<Map<String,dynamic>> maps = await db!.query('favorites', orderBy: 'rating');
    return Joke.fromDb(maps.last);
    /*return List.generate(
        maps.length,
            (i){
          Joke j = Joke();
          j.id = maps[i]['id'];
          j.rating = maps[i]['rating'];
          j.text = maps[i]['text'];
          return j;
        }
    );*/
  }

}