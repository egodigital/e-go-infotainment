import 'package:egoinfotainment/api/api.dart';
import 'package:egoinfotainment/api/params.dart';
import 'package:flutter/material.dart';

class TemperatureControl extends StatefulWidget {
  @override
  _TemperatureControlState createState() => _TemperatureControlState();
}

class _TemperatureControlState extends State<TemperatureControl>
    with SingleTickerProviderStateMixin {
  double _iconSize = 48;
  AnimationController _playPauseController;

  @override
  void initState() {
    super.initState();
    _playPauseController = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _playPauseController.dispose();
    super.dispose();
  }

  get isPlaying => _playPauseController.value > 0.5;

  play() {
    print('play');
    _playPauseController.forward();
  }

  pause() {
    print('pause');
    _playPauseController.reverse();
  }

  togglePlayPause() {
    if (isPlaying) {
      pause();
    } else {
      play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.plus_one, size: _iconSize),
              iconSize: _iconSize,
              tooltip: 'Increase volume by 10',
              onPressed: () {
                Carparams carparams = Carparams();
                carparams.temperatureInside = 16;
                EgoApi().patchSignal(carparams);
              },
            ),
            Text("12", style: TextStyle(fontSize:  32)),
            IconButton(
              icon: Icon(Icons.plus_one, size: _iconSize),
              iconSize: _iconSize,
              tooltip: 'Increase volume by 10',
              onPressed: () {
                Carparams carparams = Carparams();
                carparams.temperatureInside = 18;
                EgoApi().patchSignal(carparams);
              },
            ),
          ],
        ),
      ),
    );
  }
}
