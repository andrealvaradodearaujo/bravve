import 'package:bravve/core/store_state.dart';
import 'package:bravve/core/usecase.dart';
import 'package:bravve/domain/entities/album.dart';
import 'package:bravve/domain/usecases/get_albums.dart';
import 'package:mobx/mobx.dart';

part 'get_albums_store.g.dart';

class GetAlbumsStore extends _GetAlbumsStore with _$GetAlbumsStore {
  GetAlbumsStore(GetAlbums useCase) : super(useCase);
}

abstract class _GetAlbumsStore with Store {
  final GetAlbums _useCase;

  _GetAlbumsStore(this._useCase);

  @observable
  ObservableFuture? _useCaseFutureResponse;

  @observable
  bool successfullySent = false;

  @observable
  List<Album?>? albums;

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
  Future actionUseCase() async {
    errorMessage = null;
    successfullySent = false;

    _useCaseFutureResponse = ObservableFuture(_useCase(NoParams()));

    (await _useCaseFutureResponse).fold((failure) => errorMessage = "Mensagem de erro",
         (List<Album?>? result) {
          if (result != null && result.isNotEmpty) {
            successfullySent = true;
            albums = result;
          }
        });
  }
}
