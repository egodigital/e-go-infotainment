import 'package:egoinfotainment/api/warning.dart';
import 'package:flutter/material.dart';

class Warnings extends StatelessWidget {
  Warning warning;

  Warnings(this.warning);

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(100, 100, 100, 1);
    switch (warning.state) {
      case Warning.STATE_YELLOW:
        color = Color.fromRGBO(250, 160, 0, 1);
        break;
      case Warning.STATE_RED:
        color = Color.fromRGBO(141, 0, 0, 1);
        break;
    }
    return Container(
      color: color,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(warning.notification,
                maxLines: 5,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}
