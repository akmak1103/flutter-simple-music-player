import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/happier.png'), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      'Now Playing',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/happier.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Happier',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Marshmellow',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 25,
              ),
              buildControl(
                  icon: Icon(Icons.play_arrow),
                  label: 'Play',
                  onPressedFunction: () {
                    audioCache.play('Neelambari.mp3');
                  }),
              buildControl(
                  icon: Icon(Icons.pause),
                  label: 'Pause',
                  onPressedFunction: () {
                    audioPlayer.pause();
                  }),
              buildControl(
                  icon: Icon(Icons.stop),
                  label: 'Stop',
                  onPressedFunction: () {
                    audioPlayer.stop();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildControl({Icon icon, Function onPressedFunction, String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8, right: 10, top: 10),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 8),
              child: GestureDetector(onTap: onPressedFunction, child: icon),
            ),
            // IconButton(icon: icon, onPressed: onPressedFunction),
            Text(label)
          ],
        ),
      ),
    );
  }
}
