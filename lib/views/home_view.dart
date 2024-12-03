import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/widgets/weather_info_body.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:flutter/material.dart';
import '../cubits/get_weather_cubits/get_weather_cubit.dart';
import '../cubits/get_weather_cubits/get_weather_states.dart';
import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          actions: [
            IconButton(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                     return SearchView();
                   },));
                 },
                icon:Icon(Icons.search),)
          ],
        ),
      body: BlocBuilder<GetWeatherCubit,WeatherStates>(
        builder: (BuildContext context, state) {
             print("type of state  |||||||||||${state}");
             if(state is NoWeatherState){
               return NoWeatherBody();
             }else if(state is WeatherLoadedState){
               return WeatherInfoBody(state.weathermodel);
             }else{
               return Text("opps , there was an error");
             }
        },

      ),
    );
  }
}
