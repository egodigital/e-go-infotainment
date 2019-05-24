import 'package:flutter/material.dart';

import 'package:egoinfotainment/config.dart';
import 'package:egoinfotainment/widgets/dashboard.dart';

import 'dart:async';
import 'api/api.dart';
import 'api/warning.dart';

void main() {
  EgoApi().getSignal();
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
  WarningEvaluator _warningEvaluator;

  @override
  void dispose() {
    _warningEvaluator.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _warningEvaluator = WarningEvaluator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primaryColor: Color(0xFF262626),
        scaffoldBackgroundColor: Color.fromRGBO(48, 48, 48, 1),
      ),
      home: DashboardPage(),
    );
  }
}
