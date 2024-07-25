import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:weather_mailer/pages/choose_location.dart';

class CreateLocationWeather {
  String url = "";
  String location = "";
  int temperature = 0;
  String description = "";
  String icon = "";
  String flag = "";




  CreateLocationWeather({required this.location, required this.flag});

  Future<dynamic> getWeather(BuildContext context) async {


    try {
      Uri uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?units=metric/&appid=&q=$location");

      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      String icon = data['weather'][0]['main'];
      String temp = (data['main']['temp'] - 273.15).round().toString();
      String cityName = data['name'];
      String wind = data['wind']['speed'].toString();
      String humidity = data['main']['humidity'].toString();
      String description = data['weather'][0]['description'];
      Map<String, dynamic> sys = data['sys'];
      String ic = data['weather'][0]['icon'];

      Map<String, dynamic> details = {
        "cityName": cityName,
        "description": description,
        "temp": temp,
        "icon": icon,
        "ic": ic,
        "wind": wind,
        "humidity": humidity
      };

      if (context.widget.runtimeType.toString() == "Loading") {
        Navigator.of(context).pushNamed('/', arguments: details);
      }
      ;

      return details;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
