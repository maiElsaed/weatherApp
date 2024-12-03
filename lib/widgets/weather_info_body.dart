import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  late final WeatherModel weathermodel;
   WeatherInfoBody(WeatherModel weathermodel){
     this.weathermodel=weathermodel!;
   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 170, left: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weathermodel.cityName,
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * .07),
          ),
          Text(
            "updated at ${weathermodel.date.hour} : ${weathermodel.date.minute}",
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * .04),
          ),
          Row(
            children: [
              Image.network(weathermodel.image!.contains("https:")?"${weathermodel.image!}":
                  "https:${weathermodel.image!}",
                  width: MediaQuery.of(context).size.width * .3,
                  height: MediaQuery.of(context).size.height * .3),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              Text(
                '${weathermodel.temp}',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .07),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              Column(
                children: [
                  Text("MaxTemp ${weathermodel.maxTemp}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .03)),
                  Text("MinTemp ${weathermodel.minTemp}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .03))
                ],
              ),
            ],
          ),

            Text('${weathermodel.WeatherCondition}',
            style: TextStyle(fontSize: MediaQuery.of(context).size.width*.06,fontWeight:FontWeight.bold ),)
        ],
      ),
    );
  }
}
