import 'dart:async';

import 'package:egoinfotainment/api/api.dart';
import 'package:egoinfotainment/api/params.dart';
import 'package:egoinfotainment/api/warning.dart';
import 'package:egoinfotainment/widgets/temperature_control.dart';
import 'package:flutter/material.dart';

import 'package:egoinfotainment/widgets/radio.dart' as ego;
import 'package:egoinfotainment/widgets/speedmeter.dart';
import 'package:egoinfotainment/widgets/warnings.dart';
import 'package:intl/intl.dart';

import 'battery.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  StreamSubscription<Warning> _warningSubscription;
  StreamSubscription<Carparams> _notificationSubscription;
  Carparams currentParams;
  String _timeString;

  @override
  void dispose() {
    _warningSubscription.cancel();
    _notificationSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _timeString = DateFormat('hh:mm').format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
    _warningSubscription = WarningEvaluator.warningController.stream.listen((warning) {
      showWarning(warning);
    });
    _notificationSubscription = EgoApi.notificationController.stream.listen((value) {
      setState(() {
        currentParams = value;
      });
    });
    super.initState();
  }

  _updateTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = DateFormat('hh:mm').format(now);
    setState(() {
      _timeString = formattedDateTime;
    });
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
            double height = (MediaQuery.of(context).size.height - 150) / 2;
            double width = MediaQuery.of(context).size.width;
            return Column(
              children: <Widget>[
                buildStatusBar(context),
                buildBox1(context, height, width),
                buildBox2(context, height, width),
                buildMenuHoriz(context, width),
              ],
            );
          } else {
            double height = MediaQuery.of(context).size.height - 70;
            double width = (MediaQuery.of(context).size.width - 80) / 2;
            return Column(
              children: <Widget>[
                buildStatusBar(context),
                Row(
                  children: <Widget>[
                    buildBox1(context, height, width),
                    buildBox2(context, height, width),
                    buildMenuVert(context, height),
                  ],
                ),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget icon(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(
        color: color,
        image: AssetImage('assets/'+ name + '.png'),
        height: 30,
      ),
    );

  }

  Widget buildMenuVert(BuildContext context, double height) {
    return Container(
      width: 60,
      height: height,
      color: Colors.green,
    );
  }

  Widget buildMenuHoriz(BuildContext context, double width) {
    return Container(
      height: 60,
      width: width,
      color: Colors.red,
    );
  }

  Widget buildStatusBar(BuildContext context) {
    List<Widget> alerts = new List<Widget>();
    if (currentParams != null) {
      if (currentParams.batteryStateOfCharge < 15) {
        alerts.add(icon('low_energy', Colors.red));
      } else if (currentParams.batteryStateOfCharge < 30) {
        alerts.add(icon('low_energy', Colors.orange));
      }
      if (currentParams.powerConsumption > 35) {
        alerts.add(icon('high_consumption', Colors.red));
      }
      if (currentParams.tirePressureFrontRight < 2 || currentParams.tirePressureFrontLeft < 2 || currentParams.tirePressureBackRight < 2 || currentParams.tirePressureBackLeft < 2) {
        alerts.add(icon('low_pressure', Colors.red));
      } else if (currentParams.tirePressureFrontRight < 2.5 || currentParams.tirePressureFrontLeft < 2.5 || currentParams.tirePressureBackRight < 2.5 || currentParams.tirePressureBackLeft < 2.5) {
        alerts.add(icon('low_pressure', Colors.orange));
      }
      if (currentParams.doorFrontLeft != 'closed' || currentParams.doorFrontRight != 'closed') {
        alerts.add(icon('doors_open', Colors.orange));
      }
    }
    return Container(
      height: 70,
      child: Padding(padding: EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_timeString, style: TextStyle(color: Colors.white, fontSize: 32),),
                Row(
                  children: alerts,
                )
              ],
          ),
        ),
      ),),
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
