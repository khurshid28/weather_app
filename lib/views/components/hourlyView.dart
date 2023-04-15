import '../../exportFiles.dart';
import '../../model/forecastModel.dart';
import '../../model/weatherModel.dart';

class HourlyView extends StatelessWidget {
  List<ListElement> list;
   HourlyView({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
          ),
          child: Row(
            children: [
              Text(
                "Hourly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 1.sw,
          height: 150.h,
          alignment: Alignment.center,
          child: Container(
            width: 1.sw,
            height: 140.h,
            child: ListView.builder(
              itemCount: list.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HourlyCard(
                element: list[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
