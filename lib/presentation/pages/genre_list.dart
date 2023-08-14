import 'dart:math';
import 'package:flutter/material.dart';
import '../../config/routes/app_routes.dart';
import '../../domain/models/genre_movie/genre_data.dart';


class GenrePage extends StatefulWidget {
  Function callbackFunction;
  Future<List<GenreDetail>> genreDetailList;
  GenrePage( {Key? key,   required this.callbackFunction,   required this.genreDetailList}) : super(key: key);


  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      key: const Key('genre-list'),
      appBar: AppBar(title: const Text('Movie Genres'),
        automaticallyImplyLeading: false),
        body: FutureBuilder<List<GenreDetail>>(
          future: widget.genreDetailList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: ((context, index) {
                      GenreDetail genreDetail = snapshot.data![index];
                      return GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15)),

                          child: Text(genreDetail.name),
                        ),
                        onTap: (){
                          widget.callbackFunction(genreDetail.name);
                          Navigator.of(context).pushNamed(AppRoutes.list);
                        },
                      );


                    })),
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
