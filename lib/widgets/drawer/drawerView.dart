import 'package:app_for_test/exportFiles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 294.w,
      child: Column(
        children: [
          Container(
            width: 294.w,
            height: 236.h,
            color: AppConstant.primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 140.w,
                  height: 140.w,
                  decoration: BoxDecoration(
                    color: AppConstant.primaryColor,
                    
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
               
              ],
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 21.w,
              right: 18.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                     
                    
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.profile_circled,
                          size: 35,
                          color: AppConstant.primaryColor,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "Profil".tr(),
                          style: TextStyle(
                              color: AppConstant.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                      

                    
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.history,
                          size: 35,
                          color: AppConstant.primaryColor,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "Buyurtmalar tarixi",
                          style: TextStyle(
                              color: AppConstant.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.money_dollar,
                          size: 35,
                          color: AppConstant.primaryColor,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "Mening hisobim",
                          style: TextStyle(
                            color: AppConstant.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
               
              ],
            ),
          ),
         
        ],
      ),
    );
  }


}
