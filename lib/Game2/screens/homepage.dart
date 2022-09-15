//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:pacman/Game2/game/settings.dart';
import 'package:pacman/Game2/game/levelmenu.dart';
//import 'package:audioplayers/src/audioplayer.dart';
//import '';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  /*late AudioPlayer player;
  late AudioCache cache;
  bool IsPlaying= false;*/
  @override
  /*void initState(){
    super.initState();
    player = AudioPlayer();
    cache = AudioCache();
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/Game2/images/background.jpg'),
              fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Text('PacMan',
              style: TextStyle(fontSize: 50,color: Colors.white),),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => LevelMenu()));
                },
                child: Text('Play'),
            ),
            /*ElevatedButton(
              onPressed: (){Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Settings()));
              },
              child: Text('Settings'),
            ),*/
            /*ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Home()));
              },
              child: Text('Exit'),
            ),*/
          ],
        ),
      ),
      ));
  }
}
