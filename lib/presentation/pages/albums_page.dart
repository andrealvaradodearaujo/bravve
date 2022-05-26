import 'package:bravve/presentation/states/usecase_stores/get_albums_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../core/store_state.dart';
import '../../core/ui/loading_widget.dart';
import '../widgets/albums_list_widget.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  late GetAlbumsStore _getAlbumsStore;

  @override
  void initState() {
    _getAlbumsStore = GetIt.I.get<GetAlbumsStore>();
    _getAlbumsStore.actionUseCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer( builder: (_) {
      switch (_getAlbumsStore.state) {
        case StoreState.initial:
        case StoreState.loading:
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const Center(
              child: LoadingWidget(),
            ),
          );
        case StoreState.loaded:
          return !_getAlbumsStore.successfullySent
              ? Center(
                  child: Text(
                    _getAlbumsStore.errorMessage ?? "",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              )
              : Scaffold(
                  body: OrientationBuilder(builder: (context, orientation) {
                    return AlbumsListWidget(_getAlbumsStore.albums, orientation: orientation,);
                  }),
                );
      }
    });
  }
}





