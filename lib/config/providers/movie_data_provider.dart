import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/movie_data/movie_data.dart';
import '../../infraestructure/driven_adapter/api/movies_data_api/movies_data_api.dart';


final movieDataProvider = Provider<MovieDataUseCase> ((ref) {
  return MovieDataUseCase(MovieDataApi());
},
);