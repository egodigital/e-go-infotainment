import 'dart:async';
import 'package:flutter/material.dart';

import 'package:egoinfotainment/api/api.dart';
import 'package:egoinfotainment/api/params.dart';

class TemperatureControl extends StatefulWidget {
  @override
  _TemperatureControlState createState() => _TemperatureControlState();
}

class _TemperatureControlState extends State<TemperatureControl>
    with SingleTickerProviderStateMixin {
  StreamSubscription<Carparams> _notificationSubscription;

  int _currentTemperature;
  int _expectedTemperature = 20;
  String _expectedTemperatureUnit = "°C";
  double _iconSize = 36;

  @override
  void initState() {
    super.initState();
    _notificationSubscription =
        EgoApi.notificationController.stream.listen((value) {
      setState(() {
        _currentTemperature = value.temperatureInside;
      });
    });
  }

  @override
  void dispose() {
    _notificationSubscription.cancel();
    super.dispose();
  }

  decreaseTemperature() {
    setState(() {
      _expectedTemperature--;
    });
    changeRemoteTemperature(_expectedTemperature);
  }

  increaseTemperature() {
    setState(() {
      _expectedTemperature++;
    });
    changeRemoteTemperature(_expectedTemperature);
  }

  changeRemoteTemperature(int temperature) {
    Carparams carparams = Carparams();
    carparams.temperatureInside = temperature;
    EgoApi().patchSignal(carparams);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_drop_down, size: _iconSize, color: Colors.white,),
              iconSize: _iconSize,
              tooltip: 'Increase volume by 10',
              onPressed: decreaseTemperature,
            ),
            Column(
              children: <Widget>[
                Text("$_expectedTemperature $_expectedTemperatureUnit",
                    style: TextStyle(fontSize: 32, color: Colors.white)),
                Text(_currentTemperature != null ? "Aktuell: $_currentTemperature $_expectedTemperatureUnit" : '',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            IconButton(
              icon: Icon(Icons.arrow_drop_up, size: _iconSize, color: Colors.white),
              iconSize: _iconSize,
              tooltip: 'Increase volume by 10',
              onPressed: increaseTemperature,
            ),
          ],
        ),
      ),
    );
  }
}
