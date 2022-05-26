import 'package:flutter/material.dart';

class BreakpointsWidth {
  static const int extraLarge = 1000;
  static const int large = 768;
  static const int medium = 510;
  static const int small = 360;
}


enum ScreenSize {
  extraLarge,
  large,
  medium,
  small
}

enum DimensionsApproach{
  widthBased,
  heightBased
}

class EdgeInsetsBreakpoint{
  double top;
  double bottom;
  double left;
  double right;
  double vertical;
  double horizontal;
  double size;

  EdgeInsetsBreakpoint({
    this.top = 0.0,
    this.bottom = 0.0,
    this.left = 0.0,
    this.right = 0.0,
    this.vertical = 0.0,
    this.horizontal = 0.0,
    this.size = 0.0
  });
}

class BreakpointSize{
  final double width;
  final double height;

  BreakpointSize({required this.width, required this.height});
}

class Dimensions {
  static Dimensions? _instance;

  static Dimensions? get I => _instance;

  factory Dimensions(
      {required BreakpointSize smallScreenSize, BreakpointSize? mediumScreenSize, required BreakpointSize largeScreenSize, BreakpointSize? extraLargeScreenSize, bool allowFontScaling = false}) {
    _instance ??= Dimensions._(
        smallScreenSize: smallScreenSize,
        mediumScreenSize: mediumScreenSize,
        largeScreenSize: largeScreenSize,
        extraLargeScreenSize: extraLargeScreenSize,
        allowFontScaling: allowFontScaling
    );
    return _instance!;
  }

  Dimensions._({
    required this.smallScreenSize,
    this.mediumScreenSize,
    required this.largeScreenSize,
    this.extraLargeScreenSize,
    this.allowFontScaling = false,
  });

  BreakpointSize? extraLargeScreenSize;
  BreakpointSize largeScreenSize;
  BreakpointSize? mediumScreenSize;
  BreakpointSize smallScreenSize;
  bool allowFontScaling;
  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;


  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  static double get textScaleFactory => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  static double get screenWidthDp => _screenWidth;

  static double get screenHeightDp => _screenHeight;

  static double get screenWidth => _screenWidth * _pixelRatio;

  static double get screenHeight => _screenHeight * _pixelRatio;

  static double get statusBarHeight => _statusBarHeight * _pixelRatio;

  static double get bottomBarHeight => _bottomBarHeight * _pixelRatio;

  get scaleWidth {
    return (_screenWidth / _baseScreenWidth);
  }

  get scaleHeight {
    return (_screenHeight / _baseScreenHeight);
  }

  get _baseScreenHeight {
    switch (_getScreenSize()) {
      case ScreenSize.extraLarge:
        return _instance?.extraLargeScreenSize?.height;
      case ScreenSize.large:
        return _instance?.largeScreenSize.height;
      case ScreenSize.medium:
        return _instance?.mediumScreenSize?.height;
      case ScreenSize.small:
        return _instance?.smallScreenSize.height;
    }
  }

  get _baseScreenWidth {
    switch (_getScreenSize()) {
      case ScreenSize.extraLarge:
        return _instance?.extraLargeScreenSize?.width;
      case ScreenSize.large:
        return _instance?.largeScreenSize.width;
      case ScreenSize.medium:
        return _instance?.mediumScreenSize?.width;
      case ScreenSize.small:
        return _instance?.smallScreenSize.width;
    }
  }

  double setWidth({
    DimensionsApproach dimensionsApproach = DimensionsApproach.widthBased,
    double? large,
    double? extraLarge,
    double? medium,
    double? small,
    bool adjustToFontScale = false
  }) {
    double? width;
    switch (_getScreenSize()) {
      case ScreenSize.extraLarge:
        width = extraLarge;
        break;
      case ScreenSize.large:
        width = large;
        break;
      case ScreenSize.medium:
        width = medium;
        break;
      case ScreenSize.small:
        width = small;
        break;
    }

    if (width == null) return 0.0;
    switch (dimensionsApproach) {
      case DimensionsApproach.widthBased:
        return width * scaleWidth * (adjustToFontScale ? _textScaleFactor : 1);
      case DimensionsApproach.heightBased:
        return width * scaleHeight * (adjustToFontScale ? _textScaleFactor : 1);
    }
  }

  double setHeight({
    DimensionsApproach dimensionsApproach = DimensionsApproach.widthBased,
    double? large,
    double? extraLarge,
    double? medium,
    double? small,
    bool adjustToFontScale = false
  }) {
    double? height;
    switch (_getScreenSize()) {
      case ScreenSize.extraLarge:
        height = extraLarge;
        break;
      case ScreenSize.large:
        height = large;
        break;
      case ScreenSize.medium:
        height = medium;
        break;
      case ScreenSize.small:
        height = small;
        break;
    }
    if (height == null) return 0.0;

    switch (dimensionsApproach) {
      case DimensionsApproach.widthBased:
        return height * scaleWidth * (adjustToFontScale ? _textScaleFactor : 1);
      case DimensionsApproach.heightBased:
        return height * scaleHeight *
            (adjustToFontScale ? _textScaleFactor : 1);
    }
  }

  ScreenSize _getScreenSize() {
    //recupera baseado na largura
    if (_screenWidth > BreakpointsWidth.extraLarge) {
      return ScreenSize.extraLarge;
    } else if (_screenWidth > BreakpointsWidth.large) {
      return ScreenSize.large;
    } else if (_screenWidth > BreakpointsWidth.medium) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.small;
    }
  }

  setSp({
    double? fsExtraLarge,
    double? fsLarge,
    double? fsMedium,
    double? fsSmall
  }) {
    double width = setWidth(extraLarge: fsExtraLarge,
        large: fsLarge,
        medium: fsMedium,
        small: fsSmall);

    return allowFontScaling
        ? width
        : width / _textScaleFactor;
  }

  EdgeInsets getEdgeInsets(
      {EdgeInsetsBreakpoint? eidLarge, EdgeInsetsBreakpoint? eidExtraLarge, EdgeInsetsBreakpoint? eidMedium, EdgeInsetsBreakpoint? eidSmall}) {
    return EdgeInsets.only(
        top: setHeight(large: eidLarge?.top,
            extraLarge: eidExtraLarge?.top,
            medium: eidMedium?.top,
            small: eidSmall?.top),
        bottom: setHeight(large: eidLarge?.bottom,
            extraLarge: eidExtraLarge?.bottom,
            medium: eidMedium?.bottom,
            small: eidSmall?.bottom),
        left: setWidth(large: eidLarge?.left,
            extraLarge: eidExtraLarge?.left,
            medium: eidMedium?.left,
            small: eidSmall?.left),
        right: setWidth(large: eidLarge?.right,
            extraLarge: eidExtraLarge?.right,
            medium: eidMedium?.right,
            small: eidSmall?.right)
    );
  }
}