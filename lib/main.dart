import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/views/home_view.dart';

import 'cubits/get_weather_cubits/get_weather_cubit.dart';
import 'cubits/get_weather_cubits/get_weather_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(), child: CustomWidget());
  }
}

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weathermodel
                      ?.WeatherCondition)),
          title: 'Flutter Demo',
          home: HomeView(),
        );
      },
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case null:
      return Colors.grey;
    case 'Sunny':
    case 'Clear':
    case 'Party Cloudy':
    case 'Cloudy':
    case 'OverCast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
      return Colors.blue;
    default:
      return Colors.grey;
  }
}
