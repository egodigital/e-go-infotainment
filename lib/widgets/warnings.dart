import 'package:flutter/material.dart';

class Warnings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text("⚠️ Wischwasser ist leer.",
                style: TextStyle(color: Colors.deepOrange, fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
