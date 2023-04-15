import 'package:app_for_test/services/storage/cash/cash_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../../exportFiles.dart';
import '../../model/forecastModel.dart';
import '../../model/weatherModel.dart';

class CurrentView extends StatelessWidget {
  ListElement element;
  CurrentView({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          CashService().read(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          DateFormat.yMMMEd().format(DateTime.now()) +
              "   " +
              DateFormat('hh:mm a').format(DateTime.now()),
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ////// frjej
            Transform.scale(
                scale: 2,
                child: Image.network(
                  'http://openweathermap.org/img/w/${element.weather[0].icon}.png',
                )),
            SizedBox(
              width: 30.w,
            ),
            Text(
              " ${(element.main.temp - 273.15).toInt()}\u00B0 C",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                  color: AppConstant.primaryColor,
                  border: Border.all(color: Colors.white, width: 4.w),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.w, 1.h),
                        blurRadius: 4.w)
                  ],
                  borderRadius: BorderRadius.circular(
                    12.r,
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.wind,
                    size: 40.w,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    element.wind.speed.toString() + " km/h",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                  color: AppConstant.primaryColor,
                  border: Border.all(color: Colors.white, width: 4.w),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.w, 1.h),
                        blurRadius: 4.w)
                  ],
                  borderRadius: BorderRadius.circular(
                    12.r,
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.percent,
                    size: 40.w,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    element.main.humidity.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
