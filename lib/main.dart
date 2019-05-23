import 'package:flutter/material.dart';

import 'package:egoinfotainment/widgets/dashboard.dart';

import 'dart:async';
import 'api/api.dart';

void main() {
  const interval = const Duration(seconds:10);
  new Timer.periodic(interval, (Timer t) {
    EgoApi().getSignal();
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
