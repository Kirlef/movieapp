// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
  Genre({
    required this.genreDetails,
  });
  final List<GenreDetail> genreDetails;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    genreDetails: List<GenreDetail>.from(json["genres"].map((x) => GenreDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(genreDetails.map((x) => x.toJson())),
  };
}

class GenreDetail {
  GenreDetail({
    required  this.id,
    required  this.name,
  });

  final int id;
  final String name;

  factory GenreDetail.fromJson(Map<String, dynamic> json) => GenreDetail(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}