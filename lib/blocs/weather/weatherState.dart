


import '../../model/forecastModel.dart';

abstract class WeatherState{}

class WeatherIntialState extends WeatherState{}
class WeatherWaitingState extends WeatherState{}
class WeatherSuccessState extends WeatherState{
  final ForeCastModel data;
  WeatherSuccessState({required this.data});
}
class WeatherErrorState extends WeatherState{
  String title;
  String message;
  WeatherErrorState({required this.message,required this.title});
}

