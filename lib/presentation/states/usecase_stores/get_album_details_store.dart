import 'package:bravve/core/store_state.dart';
import 'package:bravve/domain/usecases/get_album_details.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/album_item.dart';

part 'get_album_details_store.g.dart';

class GetAlbumDetailsStore extends _GetAlbumDetailsStore with _$GetAlbumDetailsStore {
  GetAlbumDetailsStore(GetAlbumDetails useCase) : super(useCase);
}

abstract class _GetAlbumDetailsStore with Store {
  final GetAlbumDetails _useCase;

  _GetAlbumDetailsStore(this._useCase);

  @observable
  ObservableFuture? _useCaseFutureResponse;

  @observable
  bool successfullySent = false;

  @observable
  List<AlbumItem?>? albumDetails;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_useCaseFutureResponse == null || _useCaseFutureResponse?.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _useCaseFutureResponse?.status == FutureStatus.pending ? StoreState.loading : StoreState.loaded;
  }

  @action
  Future actionUseCase(int albumId) async {
    errorMessage = null;
    successfullySent = false;

    _useCaseFutureResponse = ObservableFuture(_useCase(Params(albumId: albumId)));

    (await _useCaseFutureResponse).fold((failure) => errorMessage = "Mensagem de erro",//Converter.getFailureMessage(failure, doLogoutOnError: true),
        (List<AlbumItem?>? result) {
          if (result != null && result.isNotEmpty) {
            successfullySent = true;
            albumDetails = result;
          }
        });
  }
}
