import 'package:app_for_test/core/api/api.dart';
import 'package:app_for_test/model/forecastModel.dart';
import 'package:app_for_test/model/weatherModel.dart';
import 'package:dio/dio.dart' as dio;

import '../../exportFiles.dart';
import '../../services/storage/cash/cash_Service.dart';
import '../../services/storage/db/db_Service.dart';
import 'weatherState.dart';

class WeatherBloc extends Cubit<WeatherState> {
  DioClient dioClient = DioClient();
  WeatherBloc() : super(WeatherIntialState());

  Future getWeather({required String lat,required String lon,}) async {
    emit(WeatherWaitingState());
     dio.Response response_forecast = await dioClient.get(
     Api.forecast+ "?lat=${lat}&lon=${lon}&exclude=${AppConstant.Weather}&appid=${AppConstant.appid}",
    );
    dio.Response response_weather = await dioClient.get(
     Api.weather+ "?lat=${lat}&lon=${lon}&appid=${AppConstant.appid}",
    );

    
    if (response_forecast.statusCode == 200 && response_weather.statusCode ==200) {
      await HiveService().write(response_forecast.data);
      await CashService().write(WeatherModel.fromJson(response_weather.data).name);
      emit(WeatherSuccessState(data: ForeCastModel.fromJson(response_forecast.data)),);
    } else {
      emit(WeatherErrorState(title: "Network Error",message: "Something Error"),);
    }

    return response_forecast.data;
  }
}










