import 'package:equatable/equatable.dart';

class AlbumItem extends Equatable {
  final int? id;
  final int? albumId;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  const AlbumItem({
    this.id,
    this.albumId,
    this.title,
    this.url,
    this.thumbnailUrl
  });

  @override
  List<Object?> get props => [id, albumId, title, url, thumbnailUrl];
}

// {
//   "albumId": 1,
//   "id": 1,
//   "title": "accusamus beatae ad facilis cum similique qui sunt",
//   "url": "https://via.placeholder.com/600/92c952",
//   "thumbnailUrl": "https://via.placeholder.com/150/92c952"
// },