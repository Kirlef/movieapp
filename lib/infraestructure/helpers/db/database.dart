import 'dart:io';
import 'package:movietest/domain/models/genre_movie/genre_data.dart';
import 'package:movietest/domain/models/movie_data/movie_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBprovider {
  static Database _dataBase = _dataBase;
  static final DBprovider db = DBprovider._();
  DBprovider._();
  Future<Database> get database async {
    _dataBase = await initDB();
    return _dataBase;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "/" + 'movies.db';
    return await openDatabase(path,
        version: 1,
        onOpen: (db) {}, onCreate: (Database db, int version) async {


          await db.execute('CREATE TABLE Movie('
              "id INTEGER PRIMARY KEY,"
              "backdropPath TEXT,"
              "budget INTEGER,"
              "homepage TEXT"
              "imdbId TEXT,"
              "originalLanguage TEXT,"
              "originalTitle TEXT,"
              "overview TEXT,"
              "posterPath NUMBER,"
              "releaseDate TEXT,"
              "revenue NUMBER,"
              "runtime NUMBER,"
              "status TEXT,"
              "tagline TEXT,"
              "title TEXT,"
              "voteAverage NUMBER,"
              "voteCount INTEGER,"
              ')');




          await db.execute('CREATE TABLE Genre('
              "id INTEGER PRIMARY KEY,"
              "name TEXT,"
              ')');
        });
  }

  Future<int> createMovie(MovieDetail movie) async {
    Database database = await initDB();
    var result = await database.insert("Movie", movie.toJson());
    return result;
  }

  Future<List<MovieDetail>> getMovie() async {
    Database database = await initDB();
    List<Map<String, dynamic>> result = await database.query("Movie",
        columns: ["id",
            "backdropPath",
            "budget",
            "homepage",
            "imdbId",
            "originalLanguage",
            "originalTitle",
            "overview",
            "posterPath",
            "releaseDate",
            "revenue",
            "runtime",
            "status",
            "tagline",
            "title",
            "voteAverage",
            "voteCount"
        ]);
    List<MovieDetail> data = [];
    result.forEach((element) {
      data.add(MovieDetail(
        id: element["id"],
          backdropPath: element["backdropPath"],
          budget: element["budget"],
          homepage: element["homepage"],
          imdbId: element["imdbId"],
          originalLanguage: element["originalLanguage"],
          originalTitle: element["originalTitle"],
          overview: element["overview"],
          posterPath: element["posterPath"],
         releaseDate: element["releaseDate"],
          revenue: element["revenue"],
          runtime: element["runtime"],
          status: element["status"],
         tagline: element["tagline"],
          title: element["title"],
          voteAverage: element["voteAverage"],
          voteCount: element["voteCount"],
      ));
    });

    return data;
  }

  Future<int> createGenre(GenreDetail genre) async {
    Database database = await initDB();
    var result = await database.insert("Genre", genre.toJson());
    // print(result.toString());
    return result;
  }


  Future<List<GenreDetail>> getGenre() async {
    Database database = await initDB();

    List<Map<String, dynamic>> result = await database.query("Genre",
        columns: ["id", "name"]);
    List<GenreDetail> data = [];
    result.forEach((element) {
      data.add(GenreDetail(
        id: element["id"],
        name: element["name"],
      ));
    });

    return data;
  }
  Future<int> updateMovie(MovieDetail movie) async {
    Database database = await initDB();
    var result = await database.update("Movie", movie.toJson());
    //print(result.toString());
    return result;
  }




}
