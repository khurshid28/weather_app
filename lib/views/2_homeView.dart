import 'package:app_for_test/blocs/weather/weatherBloc.dart';
import 'package:app_for_test/blocs/weather/weatherState.dart';
import 'package:app_for_test/exportFiles.dart';
import 'package:app_for_test/services/storage/db/db_Service.dart';
import 'package:app_for_test/views/components/currentView.dart';
import 'package:app_for_test/views/components/dailyView.dart';
import 'package:app_for_test/views/components/hourlyView.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

import '../model/forecastModel.dart' as fore;
import '../model/weatherModel.dart' as we;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Timer? timer;
  @override
  void initState() {
    getLocation();
    timer = Timer.periodic(Duration(minutes: 1), (T) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
  }

  getLocation() async {
    Position? position = await LocationService().getCurrentPoint();
    if (position == null) {
      WeatherProvider().getWeather(
        context,
        lat: AppConstant.kievDefault.lat.toString(),
        lon: AppConstant.kievDefault.lon.toString(),
      );
    } else {
      WeatherProvider().getWeather(
        context,
        lat: position.latitude.toString(),
        lon: position.longitude.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.primaryColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                dynamic data = HiveService().read();
                if (state is WeatherIntialState || data != null) {
                  if (data != null) {
                    data = fore.ForeCastModel.fromJson(data).list;
                  }
                  return data == null
                      ? Container()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CurrentView(
                              element: data[0],
                            ),
                            SizedBox(
                              height: 70.h,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                HourlyView(list: data),
                                SizedBox(
                                  height: 10.h,
                                ),
                                // there are 40 dataes
                                DailyView(list: [
                                  data[7],
                                  data[15],
                                  data[23],
                                  data[31],
                                  data[39]
                                ])
                              ],
                            ),
                          ],
                        );
                } else if (state is WeatherWaitingState) {
                  return Lottie.asset("assets/animations/cloud.json");
                } else if (state is WeatherSuccessState) {
                  List<fore.ListElement> list = state.data.list;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CurrentView(
                        element: state.data.list[0],
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HourlyView(list: list),
                          SizedBox(
                            height: 10.h,
                          ),
                          // there are 40 dataes
                          DailyView(list: [
                            list[7],
                            list[15],
                            list[23],
                            list[31],
                            list[39]
                          ])
                        ],
                      ),
                    ],
                  );
                }
                return Text("Error");
              }),
            ],
          ),
        ),
      ),
    );
  }
}
