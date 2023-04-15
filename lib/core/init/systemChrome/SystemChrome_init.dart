import 'package:app_for_test/exportFiles.dart';
import 'package:flutter/services.dart';

Future<void> SystemChrome_init() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
      systemNavigationBarColor: AppConstant.primaryColor,
      statusBarColor: AppConstant.primaryColor,
    ),
  );
}
