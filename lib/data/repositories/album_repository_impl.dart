import 'package:bravve/core/error/failure.dart';
import 'package:bravve/domain/entities/album.dart';
import 'package:bravve/domain/entities/album_item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import '../../core/error/exception.dart';
import '../../domain/repositories/album_repository.dart';
import '../datasources/album_remote_data_source.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  final AlbumRemoteDataSource remoteDataSource;

  AlbumRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Album?>?>> getAlbums() async {
    try {
      var albums = await remoteDataSource.getAlbums();
      return Right(albums);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(statusCode: e.statusCode, message: e.message),
      );
    } on PlatformException catch (e) {
      return Left(PlatformFailure(message: e.message));
    } on Exception {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, List<AlbumItem?>?>> getAlbumDetails({required int albumId}) async{
    try {
      var albumDetails = await remoteDataSource.getAlbumDetails(albumId);
      return Right(albumDetails);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(statusCode: e.statusCode, message: e.message),
      );
    } on PlatformException catch (e) {
      return Left(PlatformFailure(message: e.message));
    } on Exception {
      return Left(GenericFailure());
    }
  }

}
