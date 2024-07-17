import 'dart:convert';

ResponseModelReleasesMove responseModelReleasesMoveFromMap(String str) =>
    ResponseModelReleasesMove.fromMap(json.decode(str));

class ResponseModelReleasesMove {
  final List<ReleaseMove>? releases;

  ResponseModelReleasesMove({
    this.releases,
  });

  factory ResponseModelReleasesMove.fromMap(Map<String, dynamic> json) =>
      ResponseModelReleasesMove(
        releases: List<ReleaseMove>.from(
          json["releases"].map(
            (x) => ReleaseMove.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "releases": List<dynamic>.from(
          releases!.map(
            (x) => x.toMap(),
          ),
        ),
      };
}

class ReleaseMove {
  final int id;
  final String title;
  final String type;
  final String imdbId;
  final int tmdbId;
  final String tmdbType;
  final int seasonNumber;
  final String posterUrl;
  final DateTime sourceReleaseDate;
  final int sourceId;
  final String sourceName;
  final int isOriginal;

  ReleaseMove({
    required this.id,
    required this.title,
    required this.type,
    required this.imdbId,
    required this.tmdbId,
    required this.tmdbType,
    required this.seasonNumber,
    required this.posterUrl,
    required this.sourceReleaseDate,
    required this.sourceId,
    required this.sourceName,
    required this.isOriginal,
  });

  factory ReleaseMove.fromMap(Map<String, dynamic> json) => ReleaseMove(
        id: json["id"] ?? 0,
        title: json["title"] ??"",
        type: json["type"] ?? "",
        imdbId: json["imdb_id"] ?? "",
        tmdbId: json["tmdb_id"] ?? 0,
        tmdbType: json["tmdb_type"] ?? "",
        seasonNumber: json["season_number"] ?? 0,
        posterUrl: json["poster_url"] ?? "",
        sourceReleaseDate: DateTime.parse(json["source_release_date"]),
        sourceId: json["source_id"] ?? 0,
        sourceName: json["source_name"] ?? "",
        isOriginal: json["is_original"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "type": type,
        "imdb_id": imdbId,
        "tmdb_id": tmdbId,
        "tmdb_type": tmdbType,
        "season_number": seasonNumber,
        "poster_url": posterUrl,
        "source_release_date":
            "${sourceReleaseDate.year.toString().padLeft(4, '0')}-${sourceReleaseDate.month.toString().padLeft(2, '0')}-${sourceReleaseDate.day.toString().padLeft(2, '0')}",
        "source_id": sourceId,
        "source_name": sourceName,
        "is_original": isOriginal,
      };
}
