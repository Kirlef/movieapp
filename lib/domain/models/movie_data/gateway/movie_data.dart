import '../movie_data.dart';

abstract class MovieDataGateway {
  Future<List<MovieDetail>> getMovieData(String query);
  Future<MovieDetail> getMovieDetail(String id);
}