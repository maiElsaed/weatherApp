import 'package:flutter/foundation.dart';

class WeatherModel{
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String WeatherCondition;
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.WeatherCondition,
    this.image
});
  factory WeatherModel.FromJson(json){
    return WeatherModel(
        cityName:json['location']['name'],
        date:DateTime.parse(json['current']['last_updated']),
        temp:json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp:30.5,
        minTemp:json['forecast']['forecastday'][0]['day']['mintemp_c'],
        WeatherCondition:json['forecast']['forecastday'][0]['day']['condition']['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']

    );
  }
}