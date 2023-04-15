import 'package:app_for_test/exportFiles.dart';

class AppConstant {
  static const Color AcceptColor = Color.fromARGB(255, 11, 160, 240);
  static Color ErrorColor = Color.fromARGB(255, 180, 28, 18);
  static Color primaryColor = Color.fromARGB(255, 22, 67, 179);
  static String appid ="f8336feed9134b793abfd5ba776b91ac";
  static String Weather ="hourly,daily";
  static KievDefault kievDefault = KievDefault();



}


class KievDefault{
  String city ="Kiev";
  double lat = 50.4501;
  double lon = 30.5234;

}