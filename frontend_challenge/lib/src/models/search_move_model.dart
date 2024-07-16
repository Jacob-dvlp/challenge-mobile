import 'dart:convert';

ResponseModelSearch responseModelSearchFromMap(String str) =>
    ResponseModelSearch.fromMap(json.decode(str));

class ResponseModelSearch {
  final List<SearchMoveModel>? results;

  ResponseModelSearch({
    this.results,
  });

  factory ResponseModelSearch.fromMap(Map<String, dynamic> json) =>
      ResponseModelSearch(
        results: List<SearchMoveModel>.from(
          json["results"].map(
            (x) => SearchMoveModel.fromMap(x),
          ),
        ),
      );
}

class SearchMoveModel {
  final String name;
  final double relevance;
  final String type;
  final int id;
  final int year;
  final String resultType;
  final String imdbId;
  final int tmdbId;
  final String tmdbType;
  final String imageUrl;

  SearchMoveModel({
    required this.name,
    required this.relevance,
    required this.type,
    required this.id,
    required this.year,
    required this.resultType,
    required this.imdbId,
    required this.tmdbId,
    required this.tmdbType,
    required this.imageUrl,
  });

  factory SearchMoveModel.fromMap(Map<String, dynamic> json) => SearchMoveModel(
        name: json["name"] ?? "",
        relevance: json["relevance"]?.toDouble() ?? 0,
        type: json["type"] ?? "",
        id: json["id"] ?? "",
        year: json["year"] ?? "",
        resultType: json["result_type"] ?? "",
        imdbId: json["imdb_id"] ?? "",
        tmdbId: json["tmdb_id"] ?? "",
        tmdbType: json["tmdb_type"] ?? "",
        imageUrl: json["image_url"] ?? "",
      );
}
