import 'dart:async';

import 'package:egoinfotainment/api/warning.dart';
import 'package:egoinfotainment/widgets/temperature_control.dart';
import 'package:flutter/material.dart';

import 'package:egoinfotainment/widgets/radio.dart' as ego;
import 'package:egoinfotainment/widgets/speedmeter.dart';
import 'package:egoinfotainment/widgets/warnings.dart';

import 'battery.dart';

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

  showWarning(Warning warning) async {
    final duration = Duration(seconds: 15);
    final timer = new Timer(duration, () {
      Navigator.pop(context);
    });
    await showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Warnings(warning)],
          );
        });
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: Text("e.GO"),
      // ),
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            double height = (MediaQuery.of(context).size.height - 100) / 2;
            double width = MediaQuery.of(context).size.width;
            return Column(
              children: <Widget>[
                buildStatusBar(context),
                buildBox1(context, height, width),
                buildBox2(context, height, width),
              ],
            );
          } else {
            double height = MediaQuery.of(context).size.height;
            double width = (MediaQuery.of(context).size.width - 20) / 2;
            return Row(
              children: <Widget>[
                buildBox1(context, height, width),
                buildBox2(context, height, width),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget buildStatusBar(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.red,
    );
  }

  Widget buildBox1(BuildContext context, double height, double width) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpeedMeter(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BatteryMeter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBox2(BuildContext context, double height, double width) {
    return Container(
      width: width,
      height: height,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ego.Radio(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TemperatureControl(),
              ),
            ],
          )),
    );
  }
}
