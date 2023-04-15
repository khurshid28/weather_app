import '../../../exportFiles.dart';

class HiveService {
  static Box? box;
  init()async{
     box = await Hive.openBox("weatherBox");
  }
  read() {
    return box?.get('data');
  }

  Future<void> write(Map data) async {
      await box?.put('data', data);
  }

 

}
