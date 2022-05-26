import 'package:bravve/domain/entities/album_item.dart';
import 'package:flutter/material.dart';
import '../../core/utils/dimensions.dart';

class AlbumDetailsItemWidget extends StatelessWidget {
  final AlbumItem? albumItem;

  const AlbumDetailsItemWidget(this.albumItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.I?.setHeight(extraLarge: 234, large: 224, medium: 190, small: 150),
      width: Dimensions.I?.setWidth(extraLarge: 448, large: 430, medium: 350, small: 320),
      color: Colors.grey,
      child: Row(
        children: [
          SizedBox(
            height: Dimensions.I?.setWidth(extraLarge: 150, large: 150, medium: 120, small: 120),
            width: Dimensions.I?.setWidth(extraLarge: 150, large: 150, medium: 120, small: 120),
            child: Image.network(
              albumItem?.thumbnailUrl ?? "",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: Dimensions.I?.setWidth(extraLarge: 10, large: 10, medium: 10, small: 10),
          ),
          Expanded(
              child: Text(
                albumItem?.title ?? "",
                style: TextStyle(
                    fontSize: Dimensions.I?.setSp(fsExtraLarge: 20, fsLarge: 20, fsMedium: 18, fsSmall: 15),
                    color: Colors.black
                ),
              )
          )
        ],
      ),
    );
  }
}