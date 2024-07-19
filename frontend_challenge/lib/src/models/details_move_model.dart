import 'dart:convert';

ResponseModelDetails responseModelDetailsFromMap(String str) =>
    ResponseModelDetails.fromMap(json.decode(str));

class ResponseModelDetails {
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? plotOverview;
  final String? type;
  final dynamic runtimeMinutes;
  final int? year;
  final int? endYear;
  final DateTime? releaseDate;
  final String? imdbId;
  final int? tmdbId;
  final String? tmdbType;
  final List<int>? genres;
  List<String>? genreNames = [];
  final double? userRating;
  final int? criticScore;
  final String? usRating;
  final String? poster;
  final String? backdrop;
  final String? originalLanguage;
  final List<dynamic>? similarTitles;
  final List<int>? networks;
  final List<String>? networkNames;
  final double? relevancePercentile;
  final double? popularityPercentile;
  final String? trailer;
  final String? trailerThumbnail;

  ResponseModelDetails({
    this.id,
    this.title,
    this.originalTitle,
    this.plotOverview,
    this.type,
    this.runtimeMinutes,
    this.year,
    this.endYear,
    this.releaseDate,
    this.imdbId,
    this.tmdbId,
    this.tmdbType,
    this.genres,
    this.genreNames,
    this.userRating,
    this.criticScore,
    this.usRating,
    this.poster,
    this.backdrop,
    this.originalLanguage,
    this.similarTitles,
    this.networks,
    this.networkNames,
    this.relevancePercentile,
    this.popularityPercentile,
    this.trailer,
    this.trailerThumbnail,
  });

  factory ResponseModelDetails.fromMap(Map<String, dynamic> json) =>
      ResponseModelDetails(
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        plotOverview: json["plot_overview"],
        type: json["type"],
        runtimeMinutes: json["runtime_minutes"],
        year: json["year"] ?? 00.00,
        endYear: json["end_year"],
        releaseDate: DateTime.parse(json["release_date"]),
        imdbId: json["imdb_id"],
        tmdbId: json["tmdb_id"],
        tmdbType: json["tmdb_type"],
        genres: List<int>.from(json["genres"].map((x) => x)),
        genreNames: List<String>.from(json["genre_names"].map((x) => x ?? "")),
        userRating: json["user_rating"]?.toDouble(),
        criticScore: json["critic_score"],
        usRating: json["us_rating"],
        poster: json["poster"],
        backdrop: json["backdrop"],
        originalLanguage: json["original_language"],
        similarTitles: List<dynamic>.from(json["similar_titles"].map((x) => x)),
        networks: List<int>.from(json["networks"].map((x) => x)),
        networkNames: List<String>.from(json["network_names"].map((x) => x)),
        relevancePercentile: json["relevance_percentile"]?.toDouble(),
        popularityPercentile: json["popularity_percentile"]?.toDouble(),
        trailer: json["trailer"],
        trailerThumbnail: json["trailer_thumbnail"],
      );
}
