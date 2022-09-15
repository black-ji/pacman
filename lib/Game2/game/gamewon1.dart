import 'package:flutter/material.dart';
import 'package:pacman/Game2/game/level2.dart';
import 'package:pacman/Game2/screens/homepage.dart';



class GameWon1 extends StatelessWidget {
  const GameWon1({Key? key}) : super(key: key);

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
                  'You Won',
                  style: TextStyle(fontSize: 50) ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => Level2()));
              },
              child: Text('Continue'),
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