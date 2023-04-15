import 'package:app_for_test/exportFiles.dart';

class NetworkError extends StatelessWidget {
  String title;
  String? message;
  String? routeName;
  String? buttonText;
  NetworkError(
      {super.key,
      required this.title,
       this.message,

      this.routeName,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    return
    
     WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        content: Container(
          width: 310.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(5.0.w),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 42.w,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 310.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 310.w,
                      height: 64.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 230.w,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: AppConstant.ErrorColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20.r,
                          ),
                          topRight: Radius.circular(
                            20.r,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                      ),
                      // height: 280.h,
                      width: 310.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      if(message !=null)    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 230.w,
                                child: Text(
                                  message!,
                                  style: TextStyle(
                                    color: AppConstant.ErrorColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          if (routeName != null && buttonText != null)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 22.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        Navigator.popAndPushNamed(
                                            context, routeName!);
                                      },
                                      child: Container(
                                        width: 239.w,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(vertical: 8.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10.r,),
                                          border: Border.all(color: AppConstant.primaryColor,width: 4.w,)
                                        ),
                                        child: Text(
                                          buttonText!,
                                          style: TextStyle(
                                            color: AppConstant.primaryColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 21.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
 
  }
}
