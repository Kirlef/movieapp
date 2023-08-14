import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movietest/config/providers/genre_data_provider.dart';
import 'package:movietest/config/providers/movie_data_provider.dart';
import 'package:movietest/domain/models/movie_data/movie_data.dart';
import 'package:movietest/presentation/pages/genre_list.dart';
import 'package:movietest/presentation/pages/movie_list.dart';
import 'package:movietest/presentation/pages/splash_screen.dart';
import '../config/routes/app_routes.dart';
import '../presentation/pages/detail_movie.dart';

class App extends ConsumerWidget  {
   App({super.key});

  late String query="";
  late MovieDetail id;

  callbackQuery(String genre) {
    query=genre;
  }
   callbackMovie(MovieDetail movie) {
     id=movie;
   }
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF401a71),
          primarySwatch: Colors.deepPurple,
          textTheme:   const TextTheme(
            headline1:   TextStyle(
              fontFamily: "Corben",
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Color.fromARGB(255, 243, 240, 240),
            ),
            headline2:  TextStyle(
              fontFamily: "Corben",
              fontWeight: FontWeight.w900,
              fontSize: 22,
              color: Color.fromARGB(255, 243, 240, 240),
            ),
            headline3: TextStyle(
              fontFamily: "Corben",
              fontWeight: FontWeight.w400,
              fontSize: 21,
              color: Color.fromARGB(255, 243, 240, 240),
            ),

          )),
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case (AppRoutes.splash):
            return MaterialPageRoute(
                builder: ((context) => SplashScreen()));
          case (AppRoutes.home):
            return MaterialPageRoute(
                builder: ((context) => GenrePage(
                    callbackFunction: callbackQuery,
                    genreDetailList:
                    ref.watch(genreDataProvider).getGenreData())));
          case (AppRoutes.list):
            return MaterialPageRoute(
                builder: ((context) => MoviesPage(callbackFunction: callbackMovie,
                  movieDetailList:
                  ref.watch(movieDataProvider).getMovieData(query),
                )));
          case (AppRoutes.movie):
            return MaterialPageRoute(
                builder: ((context) => DetailMoviePage(movieDetail: id)));
          default:
            return MaterialPageRoute(
                builder: ((context) => SplashScreen()));
        }

      },
    );

  }


  /// It gets the token of the device to firebase.
  void getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("Token Firebase: $fcmToken");
  }
}

