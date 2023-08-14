import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movietest/domain/models/movie_data/movie_data.dart';
import 'package:movietest/presentation/widget/item_list_movie.dart';
import '../../config/routes/app_routes.dart';


class MoviesPage extends StatefulWidget {
   Function callbackFunction;
   Future<List<MovieDetail>> movieDetailList;
   MoviesPage( {Key? key, required this.callbackFunction, required this.movieDetailList}) : super(key: key);


  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('Movies')),
        body: FutureBuilder<List<MovieDetail>>(
          future: widget.movieDetailList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child:ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      MovieDetail movie = snapshot.data![index];
                      return  GestureDetector(
                        child: ItemMovie(detailMovie: movie),
                        onTap: (){
                          widget.callbackFunction(movie);
                          Navigator.of(context).pushNamed(AppRoutes.movie);
                        },

                      );

                    }),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.hasError}');
            }
            return const Center(
                child: SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator()));
          },
        ));
  }


}

