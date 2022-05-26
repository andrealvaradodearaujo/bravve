import 'package:bravve/data/repositories/album_repository_impl.dart';
import 'package:bravve/domain/usecases/get_album_details.dart';
import 'package:bravve/domain/usecases/get_albums.dart';
import 'package:bravve/presentation/states/usecase_stores/get_album_details_store.dart';
import 'package:bravve/presentation/states/usecase_stores/get_albums_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/platform/settings.dart';
import 'data/datasources/album_remote_data_source.dart';
import 'domain/repositories/album_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.allowReassignment = true;

  //! Features
  _initGetAlbums();
  _initGetAlbumDetails();

  //! Core
  sl.registerLazySingleton<Settings>(() => Settings());
  sl.registerLazySingleton(() => Dio());

}

void _initGetAlbums() {
  // Stores
  sl.registerLazySingleton(
        () => GetAlbumsStore(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAlbums(sl()));

  // Repository
  sl.registerLazySingleton<AlbumRepository>(
        () => AlbumRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AlbumRemoteDataSource>(
        () => AlbumRemoteDataSourceImpl(),
  );
}

void _initGetAlbumDetails() {
  // Stores
  sl.registerLazySingleton(
        () => GetAlbumDetailsStore(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAlbumDetails(sl()));

}