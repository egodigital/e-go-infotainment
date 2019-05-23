import 'dart:async';

import 'package:egoinfotainment/api/warning.dart';
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
  StreamSubscription<Warning> _warningSubscription;

  @override
  void dispose() {
    _warningSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _warningSubscription = WarningEvaluator.warningController.stream.listen((warning) {
      showWarning(warning);
    });
    super.initState();
  }

  showWarning(Warning warning) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Warnings(warning)],
          );
        });
    final duration = Duration(seconds: 15);
    new Timer(duration, () {
      Navigator.pop(context);
    });
  }

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
