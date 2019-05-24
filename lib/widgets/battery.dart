import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../api/api.dart';
import '../api/params.dart';

class BatteryMeter extends StatefulWidget {
  @override
  _BatteryMeterState createState() => _BatteryMeterState();
}

class _BatteryMeterState extends State<BatteryMeter> with TickerProviderStateMixin {
  StreamSubscription<Carparams> _notificationSubscription;

  Animation<double> _percentageAnimation;
  AnimationController _percentageAnimationController;

  int _loadingCap = 0;
  int _calculatedRemainingDistance = 0;
  double _percentage = 0;

  void updateCap(int value, int calculatedRemainingDistance) {
    int oldSpeed = _loadingCap;
    setState(() {
      _loadingCap = value;
      _calculatedRemainingDistance = calculatedRemainingDistance;
    });
    _percentageAnimation =
        Tween<double>(begin: oldSpeed / 100, end: _loadingCap / 100).animate(_percentageAnimationController)
          ..addListener(() {
            setState(() {
              _percentage = _percentageAnimation.value;
            });
          });
    _percentageAnimationController.forward(from: 0);
  }

  @override
  void initState() {
    super.initState();
    _percentageAnimationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

    _notificationSubscription = EgoApi.notificationController.stream.listen((value) {
      updateCap(value.batteryStateOfCharge, value.calculatedRemainingDistance);
    });
  }

  @override
  void dispose() {
    _notificationSubscription.cancel();
    if (_percentageAnimationController != null) {
      _percentageAnimationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      color: Colors.white,
                      image: AssetImage('assets/low_energy.png'),
                      height: 40,
                    ),
                    Column(
                      children: <Widget>[
                        Text("$_calculatedRemainingDistance km", style: TextStyle(fontSize: 28, color: Colors.white)),
                        Text("$_loadingCap %", style: TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                    Container(
                      width: 24,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 5.0,
                width: 200.0,
                child: CustomPaint(
                  foregroundPainter: MyPainter(_percentage),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double percentage;

  MyPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final width = 200.0;
    final hot = percentage < 0.15;
    final cold = percentage > 0.3;

    Paint backgroundLine = Paint()
      ..color = hot ? Colors.red.shade900 : cold ? Colors.green.shade900 : Colors.orange.shade900
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;
    Paint speedLine = Paint()
      ..color = hot ? Colors.red.shade400 : cold ? Colors.green.shade400 : Colors.orange.shade400
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    canvas.drawLine(
      Offset(0, 0),
      Offset(width, 0),
      backgroundLine,
    );

    canvas.drawLine(
      Offset(0, 0),
      Offset(width * percentage, 0),
      speedLine,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
