import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/git_weather_cubit.dart';
import 'package:weather_app/cubits/git_weather_cubit/git_weather_states.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) {
            return BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  // theme: ThemeData(
                  //   primarySwatch: getThemeColor(
                  //     BlocProvider
                  //         .of<GetWeatherCubit>(context)
                  //         .weatherModel
                  //         ?.weatherCondition,
                  //   ),
                  // ),
                  debugShowCheckedModeBanner: false,
                  home: HomePage(),
                );
              },
            );
          }
      ),
    );
  }
}

// MaterialColor getThemeColor(String? condition) {
//   if (condition == null) {
//     return Colors.blue;
//   }
//   switch (condition.toLowerCase()) {
//     case "sunny":
//       return Colors.orange;
//     case "clear":
//     case "partly cloudy":
//     case "light snow":
//     case "light snow showers":
//     case "patchy light snow":
//     case "patchy snow possible":
//     case "patchy rain possible":
//     case "light drizzle":
//     case "moderate rain at times":
//     case "light rain":
//     case "light rain shower":
//     case "patchy freezing drizzle possible":
//     case "freezing drizzle":
//     case "heavy freezing drizzle":
//     case "thundery outbreaks possible":
//     case "light showers with thunder":
//     case "patchy light rain with thunder":
//     case "patchy sleet possible":
//     case "light sleet":
//     case "light sleet showers":
//     case "moderate or heavy sleet":
//     case "moderate or heavy sleet showers":
//     case "ice pellets":
//     case "light showers of ice pellets":
//     case "moderate or heavy showers of ice pellets":
//       return Colors.lightBlue;
//     case "cloudy":
//       return Colors.grey;
//     case "overcast":
//       return Colors.cyan;
//     case "moderate snow":
//     case "moderate snow at times":
//     case "patchy moderate snow":
//       return Colors.blue;
//     case "heavy rain at times":
//     case "moderate rain":
//     case "heavy rain":
//     case "moderate or heavy rain":
//     case "moderate or heavy rain shower":
//     case "torrential rain shower":
//     case "heavy snow":
//     case "patchy heavy snow":
//     case "blizzard":
//     case "heavy snow with thunder":
//     case "moderate or heavy snow with thunder":
//     case "moderate or heavy rain with thunder":
//       return Colors.indigo;
//     case "fog":
//       return Colors.grey;
//     case "freezing fog":
//       return Colors.cyan;
//     default:
//       return Colors.blue;
//   }
// }

