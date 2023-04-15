



import 'package:app_for_test/services/storage/cash/cash_Service.dart';
import 'package:app_for_test/services/storage/db/db_Service.dart';

import '../../../exportFiles.dart';

Future storageInit() async {
 await Hive.initFlutter();
 await HiveService().init();
 await CashService().init();
}
