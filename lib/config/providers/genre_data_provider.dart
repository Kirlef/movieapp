import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movietest/domain/models/genre_movie/gateway/genre_data.dart';
import 'package:movietest/domain/use_cases/genre_data/genre_data.dart';
import 'package:movietest/infraestructure/driven_adapter/api/genre_data_api/genre_data_api.dart';

import '../../domain/use_cases/movie_data/movie_data.dart';
import '../../infraestructure/driven_adapter/api/movies_data_api/movies_data_api.dart';


final genreDataProvider = Provider<GenreDataUseCase> ((ref) {
  return GenreDataUseCase(GenreDataApi());
},
);