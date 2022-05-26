import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../core/utils/dimensions.dart';
import '../../domain/entities/album.dart';
import '../states/usecase_stores/get_album_details_store.dart';
import '../pages/album_details_page.dart';

class AlbumWidget extends StatelessWidget {
  final Album album;

  const AlbumWidget(this.album, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GetIt.I.get<GetAlbumDetailsStore>().actionUseCase(album.id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlbumDetailsPage(title: album.title)),
        );
      },
      child: Container(
        height: Dimensions.I?.setHeight(extraLarge: 234, large: 224, medium: 190, small: 150),
        width: Dimensions.I?.setWidth(extraLarge: 448, large: 430, medium: 350, small: 320),
        padding: Dimensions.I?.getEdgeInsets(
            eidExtraLarge: EdgeInsetsBreakpoint(top: 2, bottom: 2, left: 2, right: 2),
            eidLarge: EdgeInsetsBreakpoint(top: 2, bottom: 2, left: 2, right: 2),
            eidMedium: EdgeInsetsBreakpoint(top: 2, bottom: 2, left: 2, right: 2),
            eidSmall: EdgeInsetsBreakpoint(top: 2, bottom: 2, left: 2, right: 2),
        ),
        color: Colors.purple,
        child: Center(
          child: Text(
            album.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Dimensions.I?.setSp(fsExtraLarge: 36, fsLarge: 36, fsMedium: 36, fsSmall: 25),
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}