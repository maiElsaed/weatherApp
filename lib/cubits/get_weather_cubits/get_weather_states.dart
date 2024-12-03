
import '../../models/weather_model.dart';

class WeatherStates{}
class NoWeatherState extends WeatherStates{}
class WeatherLoadedState extends WeatherStates{
  late final WeatherModel weathermodel;
  WeatherLoadedState(WeatherModel weathermodel){
    this.weathermodel=weathermodel;
  }
}
class WeatherFailureState extends WeatherStates{}