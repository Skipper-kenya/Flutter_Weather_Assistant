import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_mailer/services/create_location.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState()  {
    CreateLocationWeather instance =
        CreateLocationWeather(location: "nairobi", flag: "kenya.webp");
      instance.getWeather(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.redAccent[100],
        child: const SpinKitFadingFour(
          color: Colors.white,
          size: 50.0,
        ));
  }
}
