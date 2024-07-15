import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_mailer/routes/RouteConfigurator.dart';
import 'package:weather_mailer/MainAssistants/weather_body.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load(fileName: ".env");
  runApp(const MaterialApp(
    initialRoute: '/loading',
    onGenerateRoute: Routeconfigurator.configureRoutes,
  ));
}

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic>? arguments;

  const HomeScreen({super.key, this.arguments});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? data = {};

  DecorationImage backgroundImage(String icon) {
    String l = icon.toString().toLowerCase();

    DecorationImage returnedImage(String condition) {
      return DecorationImage(
          image: AssetImage('assets/bg/$condition.jpg'), fit: BoxFit.cover);
    }
//snow//humidity//wind

    if (l == "rain" || l == "drizzle") {
      return returnedImage("rain");
    } else if (l == "mist" || l == "fog") {
      return returnedImage("fog");
    } else if (l == "clear") {
      return returnedImage("clear");
    } else if (l == "clouds") {
      return returnedImage("clouds1");
    } else if (l == "clouds" && data?["description"] == "overcast clouds") {
      return returnedImage("clouds");
    } else if (l == "rain") {
      return returnedImage("rain");
    } else if (l == "thunderstorm") {
      return returnedImage("thunderstorm");
    } else {
      return returnedImage("night");
    }
  }

  @override
  Widget build(BuildContext context) {
    data = data != null
        ? (data!.isNotEmpty ? data : widget.arguments)
        : widget.arguments;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.redAccent[200],
          title: const Text(
            "Weather Mailer",
            style: TextStyle(letterSpacing: 1.0, color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: backgroundImage(data != null ? (data?["icon"]) : "")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 2.0),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 2.0),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          dynamic res = await Navigator.of(context)
                              .pushNamed('/choose_location');

                          setState(() {
                            data = {
                              "cityName": res["cityName"],
                              "description": res["description"],
                              "temp": res["temp"],
                              "icon": res["icon"],
                              "ic": res["ic"],
                              "wind": res["wind"],
                              "humidity": res["humidity"]
                            };
                          });
                        },
                        child: const Text(
                          "Choose Location",
                          style: TextStyle(fontSize: 20.0, letterSpacing: 1.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data != null ? (data?["cityName"]) : "",
                        style: const TextStyle(
                            fontSize: 25.0, color: Colors.redAccent),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MainBody(data: data)
                ],
              ),
            ),
          ],
        ));
  }
}
