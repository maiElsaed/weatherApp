import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';

import '../cubits/get_weather_cubits/get_weather_cubit.dart';

class SearchView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search a city'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.03),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
               var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
               getWeatherCubit.getWeather(cityName: value);
               Navigator.pop(context);
              //log(weathermodel.cityName);
              },
           decoration: InputDecoration(
             border: OutlineInputBorder(
               borderSide: BorderSide(
                 width: 2,
               )
             ),
             label: Text('Search'),
             hintText: 'Enter City Name',
             suffixIcon: Icon(Icons.search),
             contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 32)
           ),
          ),
        ),
      ),
    );
  }
}

