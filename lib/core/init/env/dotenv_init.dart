
import '../../../exportFiles.dart';

dotenvInit() async {
  await dotenv.load(fileName: ".env");
}
