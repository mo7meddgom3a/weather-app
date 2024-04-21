import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import '../cubits/git_weather_cubit/git_weather_cubit.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image}"),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp : ${weatherModel.maxTemp.round()}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Mintemp : ${weatherModel.minTemp.round()}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),

    );
  }
}
