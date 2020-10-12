

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/model/weatherforecast_model.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';
class Network {
  Future<weatherforecast_model> getweatherforecast({String cityname}) async
  {
    var finalurl = "http://api.openweathermap.org/data/2.5/forecast?q=" +
        cityname + "&appid=" + Util.appId;
    final response = await get(Uri.encodeFull(finalurl));
    //print("URL:${Uri.encodeFull(finalurl)}");
    print("weather: ${response.body}");
    if (response.statusCode == 200) {
      //print("weather: ${response.body}");
      return weatherforecast_model.fromJson(json.decode(response.body));
    }
   /* else if(response.statusCode!=200)
      {
        Text("invalid city");
      }
*/

  }
}
