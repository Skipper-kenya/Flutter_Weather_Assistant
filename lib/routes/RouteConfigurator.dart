import 'package:flutter/material.dart';
import 'package:weather_mailer/main.dart';
import 'package:weather_mailer/pages/choose_location.dart';
import 'package:weather_mailer/pages/loading.dart';
import 'package:weather_mailer/services/create_location.dart';

class Routeconfigurator {
  static Route<dynamic> configureRoutes(RouteSettings settings) {
    final args = settings.arguments as Map<String,dynamic>?;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) =>  HomeScreen(
          arguments: args,
        ));
      case "/choose_location":
        return MaterialPageRoute(builder: (_) =>  ChooseLocation());
      case "/loading":
        return MaterialPageRoute(builder: (_) =>  Loading());
      default:
        return MaterialPageRoute(builder: (_) =>  NotFound());
    }
  }
}

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("page not found");
  }
}
