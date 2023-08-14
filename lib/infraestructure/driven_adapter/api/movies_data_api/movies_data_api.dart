import 'package:http/http.dart' as http;
import 'package:movietest/utils/constants.dart';

import '../../../../domain/models/movie_data/gateway/movie_data.dart';
import '../../../../domain/models/movie_data/movie_data.dart';
import '../../../helpers/db/database.dart';
import 'error/movie_data_error.dart';

class MovieDataApi extends MovieDataGateway {


  Future<MovieDetail> getMovieDetail(String idMovie)  async{
    Uri url = Uri.parse('https://api.themoviedb.org/3/movie/$idMovie?api_key=${Constants.apiKeyV3}');
    final response = await http.get(url);
    if(response.statusCode == 200 ){
      final movie = movieFromJson(response.body);
      final movieDetails = movie.movieDetails[0];

      return movieDetails;
    }else {
      throw MovieDataApiError();
    }
  }


    @override
  Future<List<MovieDetail>> getMovieData(String query)  async{
    String keyword = query.replaceAll(RegExp(' '), '+');
    Uri url = Uri.parse('https://api.themoviedb.org/3/search/movie?query=$keyword&api_key=${Constants.apiKeyV3}');
    final response = await http.get(url);
    if(response.statusCode == 200 ){
      final movie = movieFromJson(response.body);
      final movieDetails = movie.movieDetails;
      try{
        saveLocalData(movieDetails);
      }catch(e){
        throw MovieDataApiError();
      }
      return movieDetails;

    }else {
      Future<List<MovieDetail>> movies =  DBprovider.db.getMovie();
      return movies;
    }
  }
  void saveLocalData(List<MovieDetail> movieslist){
    for (var i = 0; i <movieslist.length; i++) {
      MovieDetail movie = movieslist[i];
      DBprovider.db.createMovie(movie);
    }
  }
}