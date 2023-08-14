import 'package:http/http.dart' as http;
import 'package:movietest/domain/models/genre_movie/genre_data.dart';
import 'package:movietest/utils/constants.dart';
import '../../../../domain/models/genre_movie/gateway/genre_data.dart';
import '../../../helpers/db/database.dart';
import 'error/genre_data_error.dart';

class GenreDataApi extends GenreDataGateway {


  @override
  Future<List<GenreDetail>> getGenreList()  async{
    Uri url = Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=${Constants.apiKeyV3}&language=en-US');
    final response = await http.get(url);
    if(response.statusCode == 200 ){
      final genre = genreFromJson(response.body);
      final genreDetails = genre.genreDetails;
      try{
        saveLocalData(genreDetails);
      }catch(e){
        throw GenreDataApiError();
      }

      return genreDetails;

    }else {

      Future<List<GenreDetail>> genres =  DBprovider.db.getGenre();
      return genres;
    }
  }

  void saveLocalData(List<GenreDetail> genrelist){
  for (var i = 0; i <genrelist.length; i++) {
    GenreDetail genre = genrelist[i];
    DBprovider.db.createGenre(genre);
  }
}

}