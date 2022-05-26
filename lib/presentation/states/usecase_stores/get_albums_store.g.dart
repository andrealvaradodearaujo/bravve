// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_albums_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAlbumsStore on _GetAlbumsStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_GetAlbumsStore.state'))
          .value;

  late final _$_useCaseFutureResponseAtom =
      Atom(name: '_GetAlbumsStore._useCaseFutureResponse', context: context);

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
      Atom(name: '_GetAlbumsStore.successfullySent', context: context);

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

  late final _$albumsAtom =
      Atom(name: '_GetAlbumsStore.albums', context: context);

  @override
  List<Album?>? get albums {
    _$albumsAtom.reportRead();
    return super.albums;
  }

  @override
  set albums(List<Album?>? value) {
    _$albumsAtom.reportWrite(value, super.albums, () {
      super.albums = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_GetAlbumsStore.errorMessage', context: context);

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
      AsyncAction('_GetAlbumsStore.actionUseCase', context: context);

  @override
  Future<dynamic> actionUseCase() {
    return _$actionUseCaseAsyncAction.run(() => super.actionUseCase());
  }

  @override
  String toString() {
    return '''
successfullySent: ${successfullySent},
albums: ${albums},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
