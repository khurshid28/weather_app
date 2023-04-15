import 'package:app_for_test/exportFiles.dart';
import 'package:flutter/cupertino.dart';

class LoadingService {
  showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor:  AppConstant.primaryColor.withOpacity(0.3),
      builder: (context) => WillPopScope(
        onWillPop: ()async{
           return false;
        },
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          content: SizedBox(
            width: 100.w,
            height: 100.w,
            child: Center(
              child: CupertinoActivityIndicator(radius: 25.w,color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  
  }

  closeLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
