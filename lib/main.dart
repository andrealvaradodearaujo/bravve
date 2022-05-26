import 'package:bravve/core/utils/dimensions.dart';
import 'package:bravve/presentation/pages/albums_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AlbumsPage(),
      builder: (context, widget){
        Dimensions(
            smallScreenSize: BreakpointSize(width: 455, height: 720),
            mediumScreenSize: BreakpointSize(width: 768, height: 1024),
            largeScreenSize: BreakpointSize(width: 1000, height: 1024), //BreakpointSize(width: 1366, height: 768),
            extraLargeScreenSize: BreakpointSize(width: 1366, height: 1024),//BreakpointSize(width: 1920, height: 1080),
            allowFontScaling: true
        ).init(context);
        return widget ?? Container();
      },
    );
  }
}