import 'dart:convert';

ResponseModelDetails responseModelDetailsFromMap(String str) =>
    ResponseModelDetails.fromMap(json.decode(str));

String responseModelDetailsToMap(ResponseModelDetails data) =>
    json.encode(data.toMap());

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
  final List<String>? genreNames;
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

  ResponseModelDetails copyWith({
    int? id,
    String? title,
    String? originalTitle,
    String? plotOverview,
    String? type,
    dynamic runtimeMinutes,
    int? year,
    int? endYear,
    DateTime? releaseDate,
    String? imdbId,
    int? tmdbId,
    String? tmdbType,
    List<int>? genres,
    List<String>? genreNames,
    double? userRating,
    int? criticScore,
    String? usRating,
    String? poster,
    String? backdrop,
    String? originalLanguage,
    List<dynamic>? similarTitles,
    List<int>? networks,
    List<String>? networkNames,
    double? relevancePercentile,
    double? popularityPercentile,
    String? trailer,
    String? trailerThumbnail,
  }) =>
      ResponseModelDetails(
        id: id ?? this.id,
        title: title ?? this.title,
        originalTitle: originalTitle ?? this.originalTitle,
        plotOverview: plotOverview ?? this.plotOverview,
        type: type ?? this.type,
        runtimeMinutes: runtimeMinutes ?? this.runtimeMinutes,
        year: year ?? this.year,
        endYear: endYear ?? this.endYear,
        releaseDate: releaseDate ?? this.releaseDate,
        imdbId: imdbId ?? this.imdbId,
        tmdbId: tmdbId ?? this.tmdbId,
        tmdbType: tmdbType ?? this.tmdbType,
        genres: genres ?? this.genres,
        genreNames: genreNames ?? this.genreNames,
        userRating: userRating ?? this.userRating,
        criticScore: criticScore ?? this.criticScore,
        usRating: usRating ?? this.usRating,
        poster: poster ?? this.poster,
        backdrop: backdrop ?? this.backdrop,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        similarTitles: similarTitles ?? this.similarTitles,
        networks: networks ?? this.networks,
        networkNames: networkNames ?? this.networkNames,
        relevancePercentile: relevancePercentile ?? this.relevancePercentile,
        popularityPercentile: popularityPercentile ?? this.popularityPercentile,
        trailer: trailer ?? this.trailer,
        trailerThumbnail: trailerThumbnail ?? this.trailerThumbnail,
      );

  factory ResponseModelDetails.fromMap(Map<String, dynamic> json) =>
      ResponseModelDetails(
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        plotOverview: json["plot_overview"],
        type: json["type"],
        runtimeMinutes: json["runtime_minutes"],
        year: json["year"],
        endYear: json["end_year"],
        releaseDate: DateTime.parse(json["release_date"]),
        imdbId: json["imdb_id"],
        tmdbId: json["tmdb_id"],
        tmdbType: json["tmdb_type"],
        genres: List<int>.from(json["genres"].map((x) => x)),
        genreNames: List<String>.from(json["genre_names"].map((x) => x)),
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

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "plot_overview": plotOverview,
        "type": type,
        "runtime_minutes": runtimeMinutes,
        "year": year,
        "end_year": endYear,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "imdb_id": imdbId,
        "tmdb_id": tmdbId,
        "tmdb_type": tmdbType,
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "genre_names": List<dynamic>.from(genreNames!.map((x) => x)),
        "user_rating": userRating,
        "critic_score": criticScore,
        "us_rating": usRating,
        "poster": poster,
        "backdrop": backdrop,
        "original_language": originalLanguage,
        "similar_titles": List<dynamic>.from(similarTitles!.map((x) => x)),
        "networks": List<dynamic>.from(networks!.map((x) => x)),
        "network_names": List<dynamic>.from(networkNames!.map((x) => x)),
        "relevance_percentile": relevancePercentile,
        "popularity_percentile": popularityPercentile,
        "trailer": trailer,
        "trailer_thumbnail": trailerThumbnail,
      };
}
