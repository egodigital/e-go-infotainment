import 'dart:async';
import 'package:flutter/material.dart';
import '../api/api.dart';
import '../api/params.dart';

class SpeedMeter extends StatefulWidget {
  @override
  _SpeedMeterState createState() => _SpeedMeterState();
}

class _SpeedMeterState extends State<SpeedMeter> {
  StreamSubscription<Carparams> _notificationSubscription;
  int speed = 0;

  @override
  void dispose() {
    _notificationSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _notificationSubscription = EgoApi.notificationController.stream.listen((value) {
      setState(() {
        speed = value.speed;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(speed.toString() + " km/h",
                style: TextStyle(color: Colors.white, fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
