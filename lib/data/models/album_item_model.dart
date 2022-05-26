import '../../domain/entities/album_item.dart';

class AlbumItemModel extends AlbumItem {
  const AlbumItemModel({
    id, albumId, title, url, thumbnailUrl
  }): super(
      id: id,
      albumId: albumId,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl
  );

  factory AlbumItemModel.fromJson(Map<String, dynamic> json) {
    return AlbumItemModel(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'albumId' : albumId,
    'title' : title,
    'url' : url,
    'thumbnailUrl' : thumbnailUrl,
  };

  static List<AlbumItemModel?>? listFromJson(List<dynamic>? json) {
    return json?.map((value) => AlbumItemModel.fromJson(value)).toList();
  }

}