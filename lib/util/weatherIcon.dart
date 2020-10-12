import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon( String desciption, double size)
{
  switch(desciption)
  {
    case "Clear":
      return Icon(FontAwesomeIcons.sun, color: Colors.yellowAccent.shade700, size: size);
      break;
    case "Clouds":
      return Icon(FontAwesomeIcons.cloud, color: Colors.blueGrey,size: size);
      break;
    case "Snow":
      return Icon(FontAwesomeIcons.snowflake, color: Colors.blue.shade200, size: size);
      break;
    case "Rainy":
      return Icon(FontAwesomeIcons.cloudRain, color: Colors.blue.shade600, size: size);
      break;
    default:
      return Icon(FontAwesomeIcons.sun, color: Colors.yellowAccent.shade700, size: size);
      break;


  }
}
