
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:movietest/domain/models/genre_movie/genre_data.dart';
import 'package:movietest/infraestructure/driven_adapter/api/genre_data_api/genre_data_api.dart';
import 'dart:convert';
import 'package:http/http.dart';

import '../../../../mock/response_mock.dart';

void main() {
    test('get List Genres',
          () async {
        final mockHTTPClient = MockClient((request) async {
          const response = MockResponseList.responseGenre;
          return Response(jsonEncode(response), 200);
        });
        expect(await GenreDataApi().getGenreList(), isA<List<GenreDetail>>());
      });
}
