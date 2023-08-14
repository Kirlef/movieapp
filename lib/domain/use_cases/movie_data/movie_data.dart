

import '../../models/movie_data/gateway/movie_data.dart';
import '../../models/movie_data/movie_data.dart';

class MovieDataUseCase{
  final MovieDataGateway movieDataGateway;
  MovieDataUseCase(this.movieDataGateway);
  Future<List<MovieDetail>> getMovieData(query) => movieDataGateway.getMovieData(query);
  Future<MovieDetail> getMovieDetail(id) => movieDataGateway.getMovieDetail(id);
}