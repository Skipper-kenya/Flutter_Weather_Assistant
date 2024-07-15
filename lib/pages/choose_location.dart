import 'package:flutter/material.dart';
import 'package:weather_mailer/services/create_location.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<dynamic> locations = [
    CreateLocationWeather(location: 'Nairobi', flag: 'kenya.webp'),
    CreateLocationWeather(location: 'New York', flag: 'us.webp'),
    CreateLocationWeather(location: 'Lagos', flag: 'nigeria.webp'),
    CreateLocationWeather(location: 'London', flag: 'england.webp'),
    CreateLocationWeather(location: 'Tokyo', flag: 'japan.webp'),
    CreateLocationWeather(location: 'Cairo', flag: 'egypt.webp'),
    CreateLocationWeather(location: 'Chicago', flag: 'us.webp'),
    CreateLocationWeather(location: 'Paris', flag: 'france.webp'),
    CreateLocationWeather(location: 'perth', flag: 'australia.webp'),
    CreateLocationWeather(location: 'Moscow', flag: 'russia.webp'),
    CreateLocationWeather(location: 'Sao Paulo', flag: 'brazil.webp'),
    CreateLocationWeather(location: 'Eldoret', flag: 'kenya.webp'),
  ];



  void updateLocation(int idx) async {

    CreateLocationWeather instance = locations[idx];
   dynamic details = await instance.getWeather(context);

    Navigator.of(context).pop({
      "cityName": details["cityName"],
      "description": details["description"],
      "temp": details["temp"],
      "icon": details["icon"],
      "ic": details["ic"],
      "wind":details["wind"],
      "humidity":details["humidity"]
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent[200],
        title: const Text(
          "Choose Location",
          style: TextStyle(letterSpacing: 1.0, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, idx) {
            return Card(
              child: Padding(

                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: ListTile(
                  onTap: (){
                    updateLocation(idx);
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[idx].flag}'),
                    backgroundColor: Colors.redAccent[100],
                  ),
                  title: Text(
                    locations[idx].location,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            );
          }),
    );
  }
}


