import 'package:bravve/presentation/widgets/album_details_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../core/store_state.dart';
import '../../core/ui/loading_widget.dart';
import '../states/usecase_stores/get_album_details_store.dart';

class AlbumDetailsPage extends StatefulWidget {
  final String title;
  const AlbumDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AlbumDetailsPage> createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<AlbumDetailsPage> {
  late GetAlbumDetailsStore _getAlbumDetailsStore;

  @override
  void initState() {
    _getAlbumDetailsStore = GetIt.I.get<GetAlbumDetailsStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer( builder: (_) {
      switch (_getAlbumDetailsStore.state) {
        case StoreState.initial:
        case StoreState.loading:
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const Center(
              child: LoadingWidget(),
            ),
          );
        case StoreState.loaded:
          return !_getAlbumDetailsStore.successfullySent
              ? Center(
                  child: Text(
                    _getAlbumDetailsStore.errorMessage ?? "",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              )
              : Scaffold(
                  appBar: AppBar(
                    leading: InkWell(
                      child: const Icon(Icons.arrow_back),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    title: Text(
                        widget.title
                    ),
                  ),
                  body: OrientationBuilder(builder: (context, orientation) {
                    return AlbumDetailsListWidget(_getAlbumDetailsStore.albumDetails, orientation: orientation,);
                  }),
                );
      }
    });
  }
}

