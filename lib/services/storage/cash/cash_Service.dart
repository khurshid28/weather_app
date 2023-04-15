import 'package:app_for_test/exportFiles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashService {
  static SharedPreferences? prefs;
  Future init() async {
     prefs = await SharedPreferences.getInstance();
    if (read() == null) {
      await write(AppConstant.kievDefault.city);
    }
  }

  read() {
    return prefs?.getString('city');
  }

  Future<void> write(
    String value,
  ) async {
    await prefs?.setString(
      'city',
      value,
    );
  }
}
