import 'package:flutter/material.dart';
import 'package:movietest/domain/models/movie_data/movie_data.dart';
import 'package:movietest/utils/constants.dart';

class ItemMovie extends StatefulWidget {
  MovieDetail detailMovie;
  ItemMovie( {Key? key,    required this.detailMovie}) : super(key: key);


  @override
  _ItemMovieState createState() => _ItemMovieState();
}

class _ItemMovieState extends State<ItemMovie> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    const Color mainColor = const Color(0xff3C3261);

    return Column(
      children: <Widget>[
         Row(
          children: <Widget>[
             Padding(
              padding:  EdgeInsets.all(0.0),
              child:  Container(
                margin:  EdgeInsets.all(16.0),
                child:  const  SizedBox(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration:  BoxDecoration(
                  borderRadius:  BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image:  DecorationImage(
                      image:  NetworkImage("${Constants.imageUrl}${widget.detailMovie.posterPath}"??""),
                      fit: BoxFit.cover),
                  boxShadow: [
                     BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            new Expanded(

                child:  Container(
                  margin: EdgeInsets.fromLTRB(16.0,0.0,16.0,0.0),
                  child:  Column(children: [
                     Text(widget.detailMovie.title!,
                      style:  TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,),
                    ),
                     Padding(padding: EdgeInsets.all(2.0)),
                    Text(widget.detailMovie.overview!,
                      maxLines: 3,
                      style:  TextStyle(
                          color:  Color(0xff8785A4)
                      ),)
                  ],
                    crossAxisAlignment: CrossAxisAlignment.start,),
                )
            ),
          ],
        ),

      ],
    );

    }

}
