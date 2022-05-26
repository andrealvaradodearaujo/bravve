// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_album_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAlbumDetailsStore on _GetAlbumDetailsStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_GetAlbumDetailsStore.state'))
          .value;

  late final _$_useCaseFutureResponseAtom = Atom(
      name: '_GetAlbumDetailsStore._useCaseFutureResponse', context: context);

  @override
  ObservableFuture<dynamic>? get _useCaseFutureResponse {
    _$_useCaseFutureResponseAtom.reportRead();
    return super._useCaseFutureResponse;
  }

  @override
  set _useCaseFutureResponse(ObservableFuture<dynamic>? value) {
    _$_useCaseFutureResponseAtom
        .reportWrite(value, super._useCaseFutureResponse, () {
      super._useCaseFutureResponse = value;
    });
  }

  late final _$successfullySentAtom =
      Atom(name: '_GetAlbumDetailsStore.successfullySent', context: context);

  @override
  bool get successfullySent {
    _$successfullySentAtom.reportRead();
    return super.successfullySent;
  }

  @override
  set successfullySent(bool value) {
    _$successfullySentAtom.reportWrite(value, super.successfullySent, () {
      super.successfullySent = value;
    });
  }

  late final _$albumDetailsAtom =
      Atom(name: '_GetAlbumDetailsStore.albumDetails', context: context);

  @override
  List<AlbumItem?>? get albumDetails {
    _$albumDetailsAtom.reportRead();
    return super.albumDetails;
  }

  @override
  set albumDetails(List<AlbumItem?>? value) {
    _$albumDetailsAtom.reportWrite(value, super.albumDetails, () {
      super.albumDetails = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_GetAlbumDetailsStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$actionUseCaseAsyncAction =
      AsyncAction('_GetAlbumDetailsStore.actionUseCase', context: context);

  @override
  Future<dynamic> actionUseCase(int albumId) {
    return _$actionUseCaseAsyncAction.run(() => super.actionUseCase(albumId));
  }

  @override
  String toString() {
    return '''
successfullySent: ${successfullySent},
albumDetails: ${albumDetails},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
