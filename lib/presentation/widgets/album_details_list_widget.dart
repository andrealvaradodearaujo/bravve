import 'package:bravve/domain/entities/album_item.dart';
import 'package:bravve/presentation/widgets/album_details_item_widget.dart';
import 'package:flutter/material.dart';
import '../../core/utils/dimensions.dart';

class AlbumDetailsListWidget extends StatelessWidget {
  final List<AlbumItem?>? albumDetails;
  final Orientation orientation;

  const AlbumDetailsListWidget(this.albumDetails, {Key? key, required this.orientation}) : super(key: key);

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
              itemCount: albumDetails?.length,
              itemBuilder: (context, index) {
                return _rowOrColumn(
                  orientation: orientation,
                  children: [
                    AlbumDetailsItemWidget(albumDetails?[index]),
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