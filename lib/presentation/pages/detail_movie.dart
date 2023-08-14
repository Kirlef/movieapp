import 'package:flutter/material.dart';
import 'package:movietest/domain/models/movie_data/movie_data.dart';
import 'package:movietest/presentation/widget/header_movie_detail.dart';


class DetailMoviePage extends StatefulWidget {
   MovieDetail movieDetail;
   DetailMoviePage( {Key? key,required this.movieDetail}) : super(key: key);

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(widget.movieDetail.title!),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderMovie(movieDetail: widget.movieDetail),
              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Container(
                         width: MediaQuery.of(context).size.width*0.5,
                         child:  Text.rich(
                           TextSpan(
                               style: const TextStyle(
                                   fontSize: 25,
                                   color: Colors.black45
                               ),

                               children: [
                                 TextSpan(
                                   text: widget.movieDetail.title!,

                                 ),
                               ]
                           ),
                         ),
                       ),

                        const SizedBox(height: 8.0),
                        Text(
                          "Popularity: ${widget.movieDetail.voteAverage}",
                          style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                        ),),
                        const SizedBox(height: 8.0),
                        Text(
                          "Original Language: ${widget.movieDetail.originalLanguage}",
                          style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                        ),),const SizedBox(height: 8.0),

                      ],
                    ),
                  ),
                  //
                  //  ActorScroller(movie.actors),
                ],
              ),


             Padding(padding: EdgeInsets.symmetric(horizontal: 20),
             child:  Text.rich(
               TextSpan(
                   style: const TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w300
                   ),
                   children: [
                     TextSpan(
                         text: widget.movieDetail.overview!
                     ),
                   ]
               ),
             ),)

            ],
          ),

          ));
  }


}

