
import 'package:movietest/domain/models/genre_movie/gateway/genre_data.dart';
import 'package:movietest/domain/models/genre_movie/genre_data.dart';

import '../../models/movie_data/gateway/movie_data.dart';
import '../../models/movie_data/movie_data.dart';

class GenreDataUseCase{
  final GenreDataGateway genreDataGateway;
  GenreDataUseCase(this.genreDataGateway);
  Future<List<GenreDetail>> getGenreData() => genreDataGateway.getGenreList();
}