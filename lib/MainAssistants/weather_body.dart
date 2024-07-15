import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  final Map<String, dynamic>? data;

  const MainBody({super.key, this.data});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  Widget testFunction(String currentIcon) {
    String toLower = currentIcon.toString().toLowerCase();
    return Image(
        height: 100.0, image: AssetImage('assets/images/$toLower.png'));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = widget.data != null ? (widget.data) : "";

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.redAccent[100],
            ),
            title: Text(
              data?["description"],
              style: const TextStyle(fontSize: 20.0),
            ),
            subtitle: Text(data?["icon"]),
          ),
          ListTile(
            title: testFunction(data?["icon"]),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent[100],
              backgroundImage: AssetImage("assets/images/temp.webp"),
            ),
            title: const Text(
              "Temperature",
              style: const TextStyle(fontSize: 20.0),
            ),
            subtitle: Text(
              '${data?["temp"]} °C',
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent[100],
              backgroundImage: const AssetImage('assets/images/wind.png'),
            ),
            title: const Text(
              'Wind',
              style: const TextStyle(fontSize: 20.0),
            ),
            subtitle: Text(
              '${data?["wind"]} m/s',
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent[100],
              backgroundImage: const AssetImage('assets/images/humidity.png'),
            ),
            title: const Text(
              "Humidity",
              style: TextStyle(fontSize: 22.0),
            ),
            subtitle: Text(
              '${data?["humidity"]} %',
            ),
          ),
        ],
      ),
    );
  }
}
