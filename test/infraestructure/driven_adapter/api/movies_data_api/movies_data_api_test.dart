import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:movietest/domain/models/movie_data/movie_data.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:movietest/infraestructure/driven_adapter/api/movies_data_api/movies_data_api.dart';

import '../../../../mock/response_mock.dart';

void main() {
  test('get List Movies',
          () async {
        final mockHTTPClient = MockClient((request) async {
          const  response =  MockResponseList.responseMovies;
          return Response(jsonEncode(response), 200);
        });
        expect(await MovieDataApi().getMovieData("matrix"), isA<List<MovieDetail>>());
      });
}