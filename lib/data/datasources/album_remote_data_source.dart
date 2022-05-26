import 'package:bravve/core/platform/settings.dart';
import 'package:bravve/domain/entities/album.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../domain/entities/album_item.dart';
import '../models/album_item_model.dart';
import '../models/album_model.dart';

abstract class AlbumRemoteDataSource {
  Future<List<Album?>?> getAlbums();
  Future<List<AlbumItem?>?> getAlbumDetails(int albumId);
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {

  @override
  Future<List<Album?>?> getAlbums() async {
    var response = await GetIt.I.get<Dio>().get("${Settings.baseUrl}/albums");
    return AlbumModel.listFromJson(response.data);
  }

  @override
  Future<List<AlbumItem?>?> getAlbumDetails(int albumId) async{
    var response = await GetIt.I.get<Dio>().get("${Settings.baseUrl}/albums/$albumId/photos");
    return AlbumItemModel.listFromJson(response.data);
  }

}
