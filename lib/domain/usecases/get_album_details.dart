import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failure.dart';
import '../../core/usecase.dart';
import '../entities/album_item.dart';
import '../repositories/album_repository.dart';

class GetAlbumDetails extends UseCase<void, Params> {
  final AlbumRepository repository;

  GetAlbumDetails(this.repository);

  @override
  Future<Either<Failure, List<AlbumItem?>?>> call(Params params) async {
    return repository.getAlbumDetails(albumId: params.albumId);
  }
}

class Params extends Equatable {
  final int albumId;

  const Params({
    required this.albumId,
  });

  @override
  List<Object> get props => [albumId];
}