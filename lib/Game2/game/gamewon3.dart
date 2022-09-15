import 'package:flutter/material.dart';
import 'package:pacman/Game2/screens/homepage.dart';



class GameWon3 extends StatelessWidget {
  const GameWon3({Key? key}) : super(key: key);

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
                  'Congratulations!!'
                      'You Won',
                  style: TextStyle(fontSize: 50) ),
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