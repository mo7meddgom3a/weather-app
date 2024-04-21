import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "5946d4d943764715bab124504242003";
  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String city}) async {

    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$city&days=1",
      );
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there was an error , try again later";
      throw Exception(errorMessage);
    } catch (e){
      log(e.toString());
      throw Exception("oops there was an error , try again later");
    }
  }
}

// if (response.statusCode == 200) {
// WeatherModel weatherModel = WeatherModel.fromjson(response.data);
// return weatherModel;
//
// }else {
// final String errorMessage  = response.data["error"]["message"];
// throw Exception(errorMessage);
// }
