

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weatherforecast_model.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:weather_forecast/util/weatherIcon.dart';

Widget midView(AsyncSnapshot<weatherforecast_model> snapshot)
 {
    var forecastList = snapshot.data.list;
    var formateddate =new DateTime.fromMillisecondsSinceEpoch
      (forecastList[0].dt*1000);
    var formatedDate = Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch( (forecastList[0].dt*1000)));
    var temperature =forecastList[0].main.temp;
    temperature=temperature-273.15;


    // ignore: non_constant_identifier_names
    Container midView = Container(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          <Widget>[
            Text("${snapshot.data.city.name},"
                "${snapshot.data.city.country}",
        style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 18
        ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child:Text("${formatedDate}", style: TextStyle(
                  fontSize: 15,
                      color: Colors.grey.shade900,
              ),),
            ),

           getWeatherIcon(forecastList[0].weather[0].main.toString(), 150.0),
            //Icon(FontAwesomeIcons.cloud, size: 190),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("${temperature.toStringAsFixed(0)} °C", style: TextStyle(
                    fontSize: 32
                  ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10,0,0,0),
                      child: Text("${forecastList[0].weather[0].description}", style: TextStyle(
                        fontSize: 20,

                      ),)
                  )

                ],
                //Text("${forecastList[0].main.temp.toStringAsFixed(0)} F"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20,0,10,0),
                    child:Text("${forecastList[0].wind.speed.toStringAsFixed(0)} m/h", style:
                    TextStyle(
                      fontSize: 17,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15,0,10,0),
                    child:Text("${forecastList[0].main.humidity} %", style:
                    TextStyle(
                      fontSize: 17,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20,0,10,0),
                    child:Text("${temperature.toStringAsFixed(0)} °C", style:
                    TextStyle(
                      fontSize: 17,
                    )),
                  ),

                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,0,18,0),
                    child: Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30,0,20,0),
                    child: Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown,),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(30,0,5,0),
                    child: Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,),
                  ),

                ],

              ),
            ),
          ],
        ),
      ),
    );
return midView;
}