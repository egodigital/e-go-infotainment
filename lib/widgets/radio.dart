import 'package:flutter/material.dart';

class Radio extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<Radio> with SingleTickerProviderStateMixin {
  double _iconSize = 36;
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
          color: Colors.black,
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/deichkind.jpg'),
                width: 80,
                height: 80,
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("WDR 2",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 8),
                    Text(
                      "Remmidemmi (Yippie Yippie Yeah) ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text("Deichkind", style: TextStyle(fontSize: 12, color: Colors.white)),
                  ],
                ),
              ))
            ],
          ),
        ),
        Card(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: AnimatedIcon(
                  color: Colors.white,
                  icon: AnimatedIcons.play_pause,
                  size: _iconSize,
                  semanticLabel: 'play',
                  progress: _playPauseController,
                ),
                iconSize: _iconSize,
                onPressed: togglePlayPause,
              ),
              IconButton(
                icon: Icon(Icons.volume_mute, size: _iconSize, color: Colors.white),
                iconSize: _iconSize,
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.volume_down, size: _iconSize, color: Colors.white),
                iconSize: _iconSize,
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.volume_up, size: _iconSize, color: Colors.white),
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
