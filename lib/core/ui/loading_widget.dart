
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';


class LoadingWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double size;
  final double strokeWidth;
  final Color color;

  const LoadingWidget({Key? key,
    this.margin,
    this.size = 21,
    this.strokeWidth = 5,
    this.color = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: Dimensions.I?.setWidth(extraLarge: size, large: size, medium: size, small: size,),
      width: Dimensions.I?.setWidth(extraLarge: size, large: size, medium: size, small: size,),
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
