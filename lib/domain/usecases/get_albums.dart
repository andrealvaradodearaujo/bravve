import 'package:bravve/domain/entities/album.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../core/usecase.dart';
import '../repositories/album_repository.dart';

class GetAlbums extends UseCase<void, NoParams> {
  final AlbumRepository repository;

  GetAlbums(this.repository);

  @override
  Future<Either<Failure, List<Album?>?>> call(NoParams params) async {
    return repository.getAlbums();
  }
}