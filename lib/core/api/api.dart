import '../../exportFiles.dart';

class Api {
  static const int receiveTimeout = 10000;
  static const int connectionTimeout = 10000;
  static String base_url = dotenv.env["base_url"] ?? "";
  static String forecast = dotenv.env["forecast"] ?? "";
  static String weather = dotenv.env["forecast"] ?? "";


}





