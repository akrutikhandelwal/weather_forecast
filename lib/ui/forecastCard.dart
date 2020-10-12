import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weatherforecast_model.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:weather_forecast/util/weatherIcon.dart';
Widget ForecastCard(AsyncSnapshot <weatherforecast_model> snapshot,int index)
{
   var forecastList=snapshot.data.list;
  var date= Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000));
  var day=date.split(",")[0];
  var mintemp=(forecastList[index].main.tempMin-273).toStringAsFixed(0);
  var maxtemp=(forecastList[index].main.tempMax-273).toStringAsFixed(0);
   return Padding(
     padding: const EdgeInsets.all(8.0),

     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.start,

       children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text("${day}")),
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            getWeatherIcon(forecastList[index].weather[0].main.toString(), 40.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  children: <Widget>[

                         Row(
                   children: <Widget>
                   [
                   Padding(
              padding: EdgeInsets.only(left:5,top:0.0,right:0,bottom: 0),
              child:Text("${maxtemp} °C"),
                ),

               Padding(
             padding: EdgeInsets.all(5),
               child: Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white, size: 18)
                ),
                ],

                  ),

                           Row(
                             children: <Widget>
                               [
                               Padding(
                                 padding: EdgeInsets.only(left:5,top:0.0,right:0,bottom: 0),
                                 child:Text("${maxtemp} °C"),
                               ),

                               Padding(
                                   padding: EdgeInsets.all(5),
                                   child: Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white, size: 18)
                               ),
                            ],

                          ),


                        ],
                      ),

                    ),

                  ]

              ),

          ],
          //
        ),

   );
}