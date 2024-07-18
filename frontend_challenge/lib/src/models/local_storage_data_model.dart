import 'dart:convert';

class LocalStorageDataModel {
  final String index;
  final LocalStorageDataMoveModel? data;

  LocalStorageDataModel({
    required this.index,
    this.data,
  });
}

class LocalStorageDataMoveModel {
  final String id;
  final String urlImg;
  final String title;

  LocalStorageDataMoveModel(
      {required this.id, required this.urlImg, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'urlImg': urlImg,
      'title': title,
    };
  }

  factory LocalStorageDataMoveModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {}

    return LocalStorageDataMoveModel(
      id: map!['id'],
      urlImg: map['urlImg'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  static LocalStorageDataMoveModel? fromJson(String source) =>
      LocalStorageDataMoveModel.fromMap(json.decode(source));
}
