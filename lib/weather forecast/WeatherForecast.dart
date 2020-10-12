

import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:weather_forecast/model/weatherforecast_model.dart';
import 'package:weather_forecast/network/Network.dart';
import 'package:weather_forecast/ui/bottomview.dart';
import 'package:weather_forecast/ui/midView.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
 Future<weatherforecast_model> forecastobject;
 String city="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //forecastobject = getweather();
 /*/ forecastobject.then((weather) =>
   {
     print(weather.city.name),
     print(weather.city.country)
   });
  */
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Weather Forecast"),
      ),
     body: ListView(
       children: <Widget>[
         textField(),
         Container(
           child: FutureBuilder<weatherforecast_model>(
             future: forecastobject,
             builder: (BuildContext context, AsyncSnapshot<weatherforecast_model> snapshot)
               {
                     if(snapshot.hasData)
                       return Column(
                         children: <Widget>[
                           midView(snapshot),
                           bottomview(snapshot, context)
                         ],
                       );
                     else
                       {
                         return Container(
                           child: Center(child: CircularProgressIndicator(),),
                         );
                       }

               }
           ),
         )
       ],
     )
    );
  }

 Widget textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter your City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
            ),
        onSubmitted: (value)
            {
               setState(() {
                 city= value;
                 forecastobject = getweather(cityname: city);
               });
            }
          ),
        ),

      );

  }

 Future<weatherforecast_model> getweather({ String cityname}) =>
     new Network().getweatherforecast(cityname: city);
}



