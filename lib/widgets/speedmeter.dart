import 'package:flutter/material.dart';

class SpeedMeter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text("80 km/h",
                style: TextStyle(color: Colors.white, fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
