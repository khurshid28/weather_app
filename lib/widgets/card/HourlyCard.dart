import 'package:intl/intl.dart';

import '../../exportFiles.dart';
import '../../model/forecastModel.dart';

class HourlyCard extends StatelessWidget {
  ListElement element;
  HourlyCard({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('hh:mm a').format(element.dtTxt),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Image.network(
            'http://openweathermap.org/img/w/${element.weather[0].icon}.png',
          ),
          SizedBox(
            height: 4.w,
          ),
          Text(
            "${(element.main.temp - 273.15).toInt() > 0 ? "+" + (element.main.temp - 273.15).toInt().toString() : (element.main.temp - 273.15).toInt().toString()}\u00B0 C",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      height: 140.h,
      width: 110.w,
      decoration: BoxDecoration(
        color: AppConstant.primaryColor,
        border: Border.all(color: Colors.white, width: 4.w),
        boxShadow: [
          BoxShadow(
              color: Colors.black, offset: Offset(1.w, 1.h), blurRadius: 4.w)
        ],
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
    );
  }
}
