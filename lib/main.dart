import 'package:flutter/material.dart';

import 'package:egoinfotainment/config.dart';
import 'package:egoinfotainment/widgets/dashboard.dart';

import 'dart:async';
import 'api/api.dart';

void main() {
  new Timer.periodic(UPDATE_INTERNVAL, (Timer t) {
    EgoApi().getSignal();
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  showWarning() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Text('hallo')],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey,
      ),
      home: DashboardPage(),
    );
  }
}
