import 'dart:math' show cos, sqrt, asin;

import 'package:app_for_test/exportFiles.dart';
import 'package:dio/dio.dart' as dio;
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentPoint() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return null;
      }

      permission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return null;
      }

      if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
        return null;
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print("Geolocator getCurrentPosition Error: $e");
      return null;
    }
  }

  // Future<String> getCityName({
  //   required Position currentPosition,
  // }) async {
  //   dio.Response response = await DioClient().get(
  //       Api.getCityName +
  //           "?latitude=${currentPosition.latitude}&longitude=${currentPosition.longitude}&localityLanguage=en",
  //       base_url: ApiService.getCityName_BASE_URL);
  //   return response.data["city"];
  // }
}
