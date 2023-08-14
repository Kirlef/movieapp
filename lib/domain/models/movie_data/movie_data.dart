import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());



 class Movie{
   Movie({
     required this.movieDetails,
   });
   final List<MovieDetail> movieDetails;

   factory Movie.fromJson(Map<String, dynamic> json) => Movie(
     movieDetails: List<MovieDetail>.from(json["results"].map((x) => MovieDetail.fromJson(x))),
   );

   Map<String, dynamic> toJson() => {
     "results": List<dynamic>.from(movieDetails.map((x) => x.toJson())),
   };

 }
class MovieDetail {
  String? backdropPath;
  int? budget;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieDetail(
      {
        this.backdropPath,
        this.budget,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.status,
        this.tagline,
        this.title,
        this.voteAverage,
        this.voteCount
      });

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
      id : json['id'],
      backdropPath : json['backdrop_path'],
  budget : json['budget'],
  homepage : json['homepage'],
  imdbId : json['imdb_id'],
  originalLanguage : json['original_language'],
  originalTitle : json['original_title'],
  overview : json['overview'],
  popularity : json['popularity'],
  posterPath : json['poster_path'],
  releaseDate : json['release_date'],
  revenue : json['revenue'],
  runtime : json['runtime'],
  status : json['status'],
  tagline : json['tagline'],
  title : json['title'],
  voteAverage : json['vote_average'],
  voteCount : json['vote_count'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "backdropPath" : backdropPath,
    "budget" : budget,
    "homepage" : homepage,
    "imdbId" : imdbId,
    "originalLanguage" : originalLanguage,
    "originalTitle" : originalTitle,
    "overview" : overview,
    "popularity" : popularity,
    "posterPath" : posterPath,
    "releaseDate" : releaseDate,
    "revenue" : revenue,
    "runtime" : runtime,
    "status" : status,
    "tagline" : tagline,
    "title" : title,
    "voteAverage" : voteAverage,
    "voteCount" : voteCount,
  };



}



