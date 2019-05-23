import 'package:egoinfotainment/widgets/temperature_control.dart';
import 'package:flutter/material.dart';

import 'package:egoinfotainment/widgets/radio.dart' as ego;
import 'package:egoinfotainment/widgets/speedmeter.dart';
import 'package:egoinfotainment/widgets/warnings.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: Text("e.GO"),
      // ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Warnings(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpeedMeter(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ego.Radio(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TemperatureControl(),
            ),
          ],
        ),
      )),
    );
  }
}
