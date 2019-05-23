import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: Text("e.GO"),
      // ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Warnings(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpeedMeter(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Radio(),
            ),
          ],
        ),
      )),
    );
  }
}

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

class SpeedMeter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text("80 km/h",
                style: TextStyle(color: Colors.white, fontSize: 32)),
          ],
        ),
      ),
    );
  }
}

class Radio extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<Radio> with SingleTickerProviderStateMixin {
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
    return Column(
      children: <Widget>[
        Card(
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/deichkind.jpg'),
                width: 100,
                height: 100,
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("WDR 2",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(
                      "Remmidemmi (Yippie Yippie Yeah) ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text("Deichkind", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ))
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  size: _iconSize,
                  semanticLabel: 'play',
                  progress: _playPauseController,
                ),
                iconSize: _iconSize,
                onPressed: togglePlayPause,
              ),
              IconButton(
                icon: Icon(Icons.volume_mute, size: _iconSize),
                iconSize: _iconSize,
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.volume_down, size: _iconSize),
                iconSize: _iconSize,
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.volume_up, size: _iconSize),
                iconSize: _iconSize,
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
