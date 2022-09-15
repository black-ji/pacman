import 'package:flutter/material.dart';
import 'package:pacman/Game2/game/level1.dart';
import 'package:pacman/Game2/screens/homepage.dart';



class GameOver1 extends StatelessWidget {
  const GameOver1({Key? key}) : super(key: key);

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
              child: Text(
                  'GAME OVER',
                  style: TextStyle(fontSize: 50),),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Level1()));
              },
              child: Text('Retry'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => HomePage()));
              },
              child: Text('Quit'),
            )
          ],
        ),
      ),
    ));
  }
}