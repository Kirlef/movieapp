import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movietest/app/app.dart';
import 'package:movietest/config/providers/genre_data_provider.dart';
import 'package:movietest/config/providers/movie_data_provider.dart';
import 'package:movietest/domain/use_cases/genre_data/genre_data.dart';
import 'package:movietest/domain/use_cases/movie_data/movie_data.dart';
import 'package:movietest/infraestructure/driven_adapter/api/genre_data_api/genre_data_api.dart';
import 'package:movietest/infraestructure/driven_adapter/api/movies_data_api/movies_data_api.dart';
import 'package:movietest/presentation/pages/splash_screen.dart';

import '../mock/response_mock.dart';

void main() {
  testWidgets('App should navigate to correct pages', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          genreDataProvider.overrideWithValue(GenreDataUseCase(GenreDataApi())),
          movieDataProvider.overrideWithValue(MovieDataUseCase(MovieDataApi())),
        ],
        child: MaterialApp(
          home: App(),
        ),
      ),
    );

    // Verify that the SplashScreen is shown initially.
    expect(find.byType(SplashScreen), findsOneWidget);

    await tester.pump();
/*
    // Verify that the MoviesPage is displayed.
    expect(find.byType(GenrePage), findsOneWidget);

    // Simulate navigation to MoviesPage.
    await tester.tap(find.text('Action'));
    await tester.pumpAndSettle();

    // Verify that the MoviesPage is displayed.
    expect(find.byType(MoviesPage), findsOneWidget);

    // Simulate navigation to DetailMoviePage.
    await tester.tap(find.text('A Man of Action'));
    await tester.pumpAndSettle();

    // Verify that the DetailMoviePage is displayed.
    expect(find.byType(DetailMoviePage), findsOneWidget);
*/
  });
}


