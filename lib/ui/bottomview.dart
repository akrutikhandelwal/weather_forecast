
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'forecastCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/model/weatherforecast_model.dart';

Widget bottomview(AsyncSnapshot<weatherforecast_model> snapshot, BuildContext context)
{
  var forecastList = snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("7 day weather forecast"),
      Container(
        height: 170,
           padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 10.0),
           child: ListView.separated(
             scrollDirection: Axis.horizontal,
               separatorBuilder: (context,index)=>SizedBox(width: 8),
               itemCount: 7,
             itemBuilder: (context,index)=>ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),
               child: Container(
               // child: Text("hi"),

                 width: MediaQuery.of(context).size.width/2.4,
                 height: 160,
                 child: ForecastCard(snapshot, index),
                 decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [Color(0xff9661C3),Colors.white],
                   begin: Alignment.topLeft, end: Alignment.bottomRight)
                 ),

),
             ),

           ),

         )

    ]
    ,
  );
}