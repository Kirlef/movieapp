import 'package:flutter/material.dart';
import 'package:movietest/domain/models/movie_data/movie_data.dart';
import 'package:movietest/utils/constants.dart';

import 'artclipper.dart';


class HeaderMovie extends StatefulWidget {
  final MovieDetail movieDetail;
  const HeaderMovie( {Key? key,required this.movieDetail}) : super(key: key);


  @override
  _HeaderMovieState createState() => _HeaderMovieState();
}

class _HeaderMovieState extends State<HeaderMovie> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.movieDetail.title!,
        ),
        SizedBox(height: 12.0),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ClipPath(
              clipper: ArcClipper(),
              child: Image.network(
                "${Constants.imageUrl}${widget.movieDetail.posterPath}"??"",
                width: MediaQuery.of(context).size.width,
                height: 230.0,
                fit: BoxFit.cover,
              ),
        ),
        ),

]
    );
  }


}