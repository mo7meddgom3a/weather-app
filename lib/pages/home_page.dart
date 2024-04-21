import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/git_weather_cubit.dart';
import 'package:weather_app/cubits/git_weather_cubit/git_weather_states.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';
import 'package:weather_app/widgets/weather_info_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = getThemeColor(
      BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition,
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "WeatherApp",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            primaryColor, // Set the app bar color to match the primary color
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              primaryColor.withOpacity(.9),
              primaryColor.withOpacity(.8),
              primaryColor.withOpacity(.7),
              primaryColor.withOpacity(.6),
              primaryColor.withOpacity(.5),
              primaryColor.withOpacity(.4),
              primaryColor.withOpacity(.3),
              primaryColor.withOpacity(.2),
              primaryColor.withOpacity(.0),
            ],
          ),
        ),
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoWeatherWidget();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoWidget(
                weather: state.weatherModel,
              );
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                    child: Text(
                  "There was an error , enter a valid city name",
                  style: TextStyle(fontSize: 40),
                )),
              );
            }
          },
        ),
      ),
      extendBody: true,
    );
  }

  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition.toLowerCase()) {
      case "sunny":
        return Colors.orange;
      case "clear":
      case "partly cloudy":
      case "light snow":
      case "light snow showers":
      case "patchy light snow":
      case "patchy snow possible":
      case "patchy rain possible":
      case "light drizzle":
      case "moderate rain at times":
      case "light rain":
      case "light rain shower":
      case "patchy freezing drizzle possible":
      case "freezing drizzle":
      case "heavy freezing drizzle":
      case "thundery outbreaks possible":
      case "light showers with thunder":
      case "patchy light rain with thunder":
      case "patchy sleet possible":
      case "light sleet":
      case "light sleet showers":
      case "moderate or heavy sleet":
      case "moderate or heavy sleet showers":
      case "ice pellets":
      case "light showers of ice pellets":
      case "moderate or heavy showers of ice pellets":
        return Colors.lightBlue;
      case "cloudy":
        return Colors.grey;
      case "overcast":
        return Colors.cyan;
      case "moderate snow":
      case "moderate snow at times":
      case "patchy moderate snow":
        return Colors.blue;
      case "heavy rain at times":
      case "moderate rain":
      case "heavy rain":
      case "moderate or heavy rain":
      case "moderate or heavy rain shower":
      case "torrential rain shower":
      case "heavy snow":
      case "patchy heavy snow":
      case "blizzard":
      case "heavy snow with thunder":
      case "moderate or heavy snow with thunder":
      case "moderate or heavy rain with thunder":
        return Colors.indigo;
      case "fog":
        return Colors.grey;
      case "freezing fog":
        return Colors.cyan;
      default:
        return Colors.blue;
    }
  }
}
