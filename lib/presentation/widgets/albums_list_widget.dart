import 'package:bravve/presentation/widgets/album_widget.dart';
import 'package:flutter/material.dart';
import '../../core/utils/dimensions.dart';
import '../../domain/entities/album.dart';

class AlbumsListWidget extends StatelessWidget {
  final List<Album?>? albums;
  final Orientation orientation;

  const AlbumsListWidget(this.albums, {Key? key, required this.orientation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: orientation == Orientation.landscape
                ? Dimensions.I?.setHeight(extraLarge: 234, large: 224, medium: 190, small: 150,)
                : MediaQuery.of(context).size.height - (Dimensions.I?.setHeight(extraLarge: 50, large: 36, medium: 25, small: 20) ?? 0.0),
            width: MediaQuery.of(context).size.width - (Dimensions.I?.setWidth(extraLarge: 50, large: 36, medium: 25, small: 20) ?? 0.0),
            child: ListView.builder(
              scrollDirection: orientation == Orientation.landscape ? Axis.horizontal : Axis.vertical,
              itemCount: albums?.length,
              itemBuilder: (context, index) {
                return _rowOrColumn(
                  orientation: orientation,
                  children: [
                    albums?[index] != null
                        ? AlbumWidget(albums![index]!)
                        : Container(),
                    _spaceWidget(orientation),
                  ],
                );
              },
            )
        )
      ],
    );
  }

  Widget _spaceWidget(Orientation orientation){
    return SizedBox(
      width: orientation == Orientation.landscape ? Dimensions.I?.setWidth(extraLarge: 50, large: 36, medium: 25, small: 20) : null,
      height: orientation == Orientation.portrait ? Dimensions.I?.setWidth(extraLarge: 50, large: 36, medium: 25, small: 20) : null,
    );
  }

  Widget _rowOrColumn({required Orientation orientation, required List<Widget> children}){
    return orientation == Orientation.portrait
        ? Column(children: children)
        : Row(children: children);

  }
}