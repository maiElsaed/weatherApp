import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class NoWeatherBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Text("there is no weather start searching now ",style: TextStyle(
               fontSize: 20
             ),
             textAlign: TextAlign.center,),
        ],
      ) ,
    ) ;
  }
}
