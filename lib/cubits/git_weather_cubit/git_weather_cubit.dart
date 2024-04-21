import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/git_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit <WeatherState>{
  GetWeatherCubit(): super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      // WeatherModel weatherModel =
      weatherModel =
          await WeatherService(Dio()).getWeather(city: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}