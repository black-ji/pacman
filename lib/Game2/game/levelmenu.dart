import 'package:flutter/material.dart';
import 'package:pacman/Game2/game/level1.dart';
import 'package:pacman/Game2/game/level2.dart';
import 'package:pacman/Game2/game/level3.dart';

class LevelMenu extends StatelessWidget {
  const LevelMenu({Key? key}) : super(key: key);

  @override
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
                child: Text('Choose Level',
                style: TextStyle(fontSize: 50)),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => Level1()));
                },
                child: Text('Level 1'),
              ),
              ElevatedButton(
                onPressed: (){Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Level2()));
                },
                child: Text('Level 2'),
              ),
              ElevatedButton(
                onPressed: (){Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Level3()));
                },
                child: Text('Level 3'),
              )
            ],
          ),)
        ),
      );
    }
  }
