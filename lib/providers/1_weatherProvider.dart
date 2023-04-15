import 'package:app_for_test/blocs/weather/weatherBloc.dart';

import '../exportFiles.dart';

class WeatherProvider {
  Future getWeather(
    BuildContext context, {
    required String lat,
    required String lon,
  }) async {
    try {
      final data = await BlocProvider.of<WeatherBloc>(context)
          .getWeather(lat: lat, lon: lon);
      return {
        "success": true,
        "data": data,
        "massage": " WeatherProvider getCurrent Success",
      };
    } catch (e) {
      return {
        "success": false,
        "data": null,
        "message": "WeatherProvider  Error",
      };
    }
  }

  

}
