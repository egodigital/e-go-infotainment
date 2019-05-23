import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../api/api.dart';
import '../api/params.dart';

class SpeedMeter extends StatefulWidget {
  @override
  _SpeedMeterState createState() => _SpeedMeterState();
}

class _SpeedMeterState extends State<SpeedMeter> with TickerProviderStateMixin {
  StreamSubscription<Carparams> _notificationSubscription;

  Animation<double> _percentageAnimation;
  AnimationController _percentageAnimationController;

  int _speed = 0;
  int _maxSpeed = 180;
  double _percentage = 0;

  void updateSpeed(int value) {
    int oldSpeed = _speed;
    setState(() {
      _speed = value;
    });
    _percentageAnimation = Tween<double>(begin: oldSpeed / _maxSpeed, end: _speed / _maxSpeed).animate(_percentageAnimationController)
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

    _notificationSubscription =
        EgoApi.notificationController.stream.listen((value) {
          updateSpeed(value.speed);
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 200.0,
          width: 200.0,
          child: new CustomPaint(
            foregroundPainter: MyPainter(_percentage),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_speed",
                    style: TextStyle(fontSize: 52, color: Colors.white)),
                new Text("km/h",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double percentage;

  MyPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final hot = percentage > 0.8;

    Paint backgroundLine = Paint()
      ..color = hot ? Colors.red.shade800 : Colors.blue.shade800
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;
    Paint speedLine = Paint()
      ..color = hot ? Colors.red.shade400 : Colors.blue.shade200
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0.4 * pi * 2.0,
      0.7 * pi * 2.0,
      false,
      backgroundLine,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0.4 * pi * 2.0,
      0.7 * pi * 2.0 * percentage,
      false,
      speedLine,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
