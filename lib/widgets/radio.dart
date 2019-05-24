import 'package:flutter/material.dart';

const sender = [ "Hochschulradio Aachen", "BigFM", "1 LIVE", "WDR2", "Radio Aachen", "Radio Köln" ];

class RadioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Senderauswahl"),
      ),
      body: ListView.builder(
        itemCount: sender.length,
        itemBuilder: (context, index) => Container(
          color: sender[index] == 'WDR2' ? Colors.blue : index % 2 == 0 ? Colors.black87 : Colors.black12,
          child: ListTile(
            leading: Text("${index + 1}", style: TextStyle(color: Colors.white, fontSize: 26)),
            title: Text(sender[index], style: TextStyle(color: Colors.white, fontSize: 26)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> with SingleTickerProviderStateMixin {
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
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RadioPage()));
              },
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
                        Text("WDR 2", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
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
          ),
        ),
        Card(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Image(
                  color: Colors.white,
                  image: AssetImage('assets/radio_list.png'),
                ),
                iconSize: _iconSize,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RadioPage()));
                },
              ),
              IconButton(
                icon: Image(
                  color: Colors.white,
                  image: AssetImage('assets/sound_off.png'),
                ),
                iconSize: _iconSize,
                onPressed: () {},
              ),
              IconButton(
                icon: Image(
                  color: Colors.white,
                  image: AssetImage('assets/sound_down.png'),
                ),
                iconSize: _iconSize,
                onPressed: () {},
              ),
              IconButton(
                icon: Image(
                  color: Colors.white,
                  image: AssetImage('assets/sound_up.png'),
                ),
                iconSize: _iconSize,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
