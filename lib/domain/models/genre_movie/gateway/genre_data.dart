import 'package:movietest/domain/models/genre_movie/genre_data.dart';


abstract class GenreDataGateway {
  Future<List<GenreDetail>> getGenreList();
}