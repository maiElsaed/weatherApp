import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherServices{
  final Dio dio;
  final String baseUrl='https://api.weatherapi.com/v1';
  final String apiKey='f249606ee84746829bb92812242006';
  //https://api.weatherapi.com/v1/forecast.json?key=f249606ee84746829bb92812242006&q=cairo&days=1
  WeatherServices(this.dio);
 Future<WeatherModel>  getCurrentService({required String city})async{
  try{
    final url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$city&days=7');

    Response response = await dio.get("$url");
      print(response);
      WeatherModel weatherModel=WeatherModel.FromJson(response.data);
      print(" llllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
      print(weatherModel);
      return weatherModel;
  }on DioException catch(e){
    //هنا لؤ جاي nullحيرجه الكلمه الي بعده
    final String errMessage=e.response?.data['error']['message']??"there was an error ,try later";
    throw Exception(errMessage);

  }catch(e){
    log(e.toString());
    throw Exception('there was an error ,try later');
  }
 }
}
