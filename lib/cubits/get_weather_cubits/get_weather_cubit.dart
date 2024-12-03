import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/views/search_view.dart';
import '../../models/weather_model.dart';
import '../../services/weather_services.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weathermodel;
  getWeather({required String cityName})async{
    try{
      weathermodel= await WeatherServices(Dio()).getCurrentService(city: cityName);
      emit(WeatherLoadedState(weathermodel!));
      print("type of state     ||||||||||| ${state}");
    }catch(v){
      emit(WeatherFailureState());
      print("type of state     ||||||||||| ${state}");
    }

  }

}