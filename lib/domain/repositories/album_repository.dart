import 'package:bravve/domain/entities/album.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/album_item.dart';

abstract class AlbumRepository {
  Future<Either<Failure, List<Album?>?>> getAlbums();

  Future<Either<Failure, List<AlbumItem?>?>> getAlbumDetails({required int albumId});
}