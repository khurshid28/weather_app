


import 'package:app_for_test/core/init/systemChrome/SystemChrome_init.dart';

import '../../exportFiles.dart';

Future<void> FullInit() async {
  widgetBuildInit();
  await SystemChrome_init();
  await storageInit();
  await initLanguages();
  await dotenvInit();
  
}
