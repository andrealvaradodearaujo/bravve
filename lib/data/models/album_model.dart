import 'package:bravve/domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel({
    id, title
  }): super(
      id: id,
      title: title,
  );

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    // if (json == null) return null;
    return AlbumModel(
        id: json['id'],
        title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
  };

  static List<AlbumModel?>? listFromJson(List<dynamic>? json) {
    return json?.map((value) => AlbumModel.fromJson(value)).toList();
  }

}