import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pacman/Game2/game/player.dart';
import 'package:pacman/Game2/game/path.dart';
import 'package:pacman/Game2/game/pixel.dart';
import 'package:pacman/Game2/game/ghost.dart';
import 'package:pacman/Game2/game/gamewon1.dart';
import 'package:pacman/Game2/game/gameover1.dart';

class Level1 extends StatefulWidget{
  @override
  _Level1State createState() => _Level1State();
}


class _Level1State extends State<Level1>{

  static int numberInRow= 11;
  int numberOfSquares= numberInRow * 17;
  int player =numberInRow*15 +1;

  List<int> barriers = [
    0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,99,110,121
    ,132,143,154,165,176,177,178,179,180,181,182,183,184,185
    ,186,175,164,153,142,131,120,109,87,76,65,54,43,32,21
    ,24,35,46,57,26,28,37,38,39,30,41,52,63,78,79,80,81,70,59
    ,61,72,83,84,85,86,123,134,145,156,147,148,149,158,160,129
    ,140,151,162,100,101,102,103,105,106,107,108,114,125,116,127
  ];

  List<int> food =[];
  List<int> eatenFood =[];

  String direction="right";
  bool preGame=true;
  bool gameStarted=false;
  int score=0;
  int nbGhost=2;

  void startGame() {
    if(score==0) {
      preGame = false;
      moveGhost();
      moveGhost1();
      gameStarted = true;
      getFood();
      _startCountDown();
      Duration duration = Duration(milliseconds: 150);
      Timer.periodic(duration, (timer) {
        if (food.contains(player)) {
          eatenFood.add(player);
          food.remove(player);
          score+=10;
        }

        if (player == ghost) {
          ghost = -1;
          score += 100;
          nbGhost--;
        }

        if(player == ghost1){
          ghost1 = -1 ;
          score += 100 ;
          nbGhost--;
        }

        if(nbGhost==0 && score>600 && timeLeft==0){
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final response = await Future.delayed(Duration(seconds: 1));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GameWon1()));
          });
        }
        else if(timeLeft==0 && (nbGhost!=0 || score<600)){
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final response = await Future.delayed(Duration(seconds: 1));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GameOver1()));
          });
        }

        switch (direction) {
          case "left":
            moveLeft();
            break;
          case "right":
            moveRight();
            break;
          case "up":
            moveUp();
            break;
          case "down":
            moveDown();
            break;
        }
      });
    }
  }

  int ghost=numberInRow*2-2;
  String ghostDirection = "left";
  int down = 0;
  int left = 0;
  void moveGhost(){
    Duration duration=Duration(milliseconds: 400);
    Timer.periodic(duration, (timer)
    {

      if (ghost == 47 || ghost == 67 || ghost == 73 || ghost == 166) {
        ghostDirection = "right";
      }
      else if (ghost == 69 || ghost == 75 || ghost==135 || ghost ==174) {
        ghostDirection = "up";
      }
      else if (ghost == 12 || ghost == 51 || ghost == 111 || ghost == 117) {
        ghostDirection = "down";
      }
      else if (ghost == 20 || ghost == 113 || ghost==119 || ghost==139) {
        ghostDirection = "left";
      }
      else if(ghost == 49 && down % 2 == 0){
        ghostDirection = "down";
        down++;
      }
      else if(ghost == 49 && down % 2 == 1){
        ghostDirection = "right";
        down++;
      }
      else if(ghost == 137 && left % 2 == 0){
        ghostDirection = "left";
        left++;
      }
      else if(ghost == 137 && left % 2 == 1){
        ghostDirection = "up";
        left++;
      }

      switch (ghostDirection) {
        case "left":
          if (!barriers.contains(ghost - 1)) {
            if (mounted) setState(() {
              ghost--;
            });
          }
          break;
        case "right":
          if (!barriers.contains(ghost + 1)) {
            if (mounted) setState(() {
              ghost++;
            });
          }
          break;
        case "up":
          if (!barriers.contains(ghost - numberInRow)) {
            if (mounted) setState(() {
              ghost -= numberInRow;
            });
          }
          break;
        case "down":
          if (!barriers.contains(ghost + numberInRow)) {
            if (mounted) setState(() {
              ghost += numberInRow;
            });
          }
          break;
      }
    });
  }

  int ghost1=93;
  String ghostDirection1 = "down";
  int down1 = 0;
  int left1 = 0;
  void moveGhost1(){
    Duration duration=Duration(milliseconds: 400);
    Timer.periodic(duration, (timer)
    {

      if (ghost1 == 47 || ghost1 == 67 || ghost1 == 73 || ghost1 == 166) {
        ghostDirection1 = "right";
      }
      else if (ghost1 == 69 || ghost1 == 75 || ghost1 ==135 || ghost1 ==174) {
        ghostDirection1 = "up";
      }
      else if (ghost1 == 12 || ghost1 == 51 || ghost1 == 111 || ghost1 == 117) {
        ghostDirection1 = "down";
      }
      else if (ghost1 == 20 || ghost1 == 113 || ghost1 ==119 || ghost1 ==139) {
        ghostDirection1 = "left";
      }
      else if(ghost1 == 49 && down1 % 2 == 1){
        ghostDirection1 = "down";
        down1++;
      }
      else if(ghost1 == 49 && down1 % 2 == 0){
        ghostDirection1 = "right";
        down1++;
      }
      else if(ghost1 == 137 && left1 % 2 == 0){
        ghostDirection1 = "left";
        left1++;
      }
      else if(ghost1 == 137 && left1 % 2 == 1){
        ghostDirection1 = "up";
        left1++;
      }

      switch (ghostDirection1) {
        case "left":
          if (!barriers.contains(ghost1 - 1)) {
            if (mounted) setState(() {
              ghost1--;
            });
          }
          break;
        case "right":
          if (!barriers.contains(ghost1 + 1)) {
            if (mounted) setState(() {
              ghost1++;
            });
          }
          break;
        case "up":
          if (!barriers.contains(ghost1 - numberInRow)) {
            if (mounted) setState(() {
              ghost1 -= numberInRow;
            });
          }
          break;
        case "down":
          if (!barriers.contains(ghost1 + numberInRow)) {
            if (mounted) setState(() {
              ghost1 += numberInRow;
            });
          }
          break;
      }
    });
  }

  void getFood(){
    for(int i=0;i<numberOfSquares;i++)
    {
      if(!barriers.contains(i)){
        food.add(i);
      }
    }
  }

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      if (mounted) setState(() {
        player--;
      });
    }
  }
  void moveRight() {
    if (!barriers.contains(player + 1)) {
      if (mounted) setState(() {
        player++;
      });
    }
  }
  void moveUp() {
    if(!barriers.contains(player-numberInRow)){
      if (mounted) setState(() {
        player-=numberInRow;
      });
    }
  }
  void moveDown() {
    if(!barriers.contains(player+numberInRow)){
      if (mounted) setState(() {
        player+=numberInRow;
      });
    }
  }


  int timeLeft=30;
  void _startCountDown(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(timeLeft>0){
        if (mounted) setState(() {
        timeLeft--;
      });
    }
      else{
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          children: [
            Expanded(
                flex: 5,
                child: GestureDetector(
                  onVerticalDragUpdate: (details){
                    if(details.delta.dy > 0){
                      direction="up";
                    }
                    else if(details.delta.dy < 0){
                      direction="down";
                    }
                  },
                  onHorizontalDragUpdate: (details){
                    if(details.delta.dx > 0){
                      direction="left";
                    }
                    else if(details.delta.dx < 0){
                      direction="right";
                    }
                  },
                  child: Container(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: numberOfSquares,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numberInRow),
                        itemBuilder: (BuildContext context, int index) {
                          if(player==index){
                            switch(direction){
                              case "left":
                                return Transform.rotate(angle: pi,child: MyPlayer(),);
                              case "right":
                                return MyPlayer();
                              case "up":
                                return Transform.rotate(angle: 3*pi/2,child: MyPlayer(),);
                              case "down":
                                return Transform.rotate(angle: pi/2,child: MyPlayer(),);
                              default : return MyPlayer();
                            }
                          }
                          else if(barriers.contains(index)){
                            return MyPixel(
                              innerColor: Colors.blue[800],
                              outerColor: Colors.blue[900],
                            );
                          }
                          else if(ghost==index){
                            switch(ghostDirection){
                              case "right":
                                return Transform.rotate(angle: pi,child: MyGhost(),);
                              case "left":
                                return MyGhost();
                              case "up":
                                return Transform.rotate(angle: 3*pi/2,child: MyGhost(),);
                              case "down":
                                return Transform.rotate(angle: pi/2,child: MyGhost(),);
                              default : return MyGhost();
                            }
                          }
                          else if(ghost1==index){
                            switch(ghostDirection1){
                              case "right":
                                return Transform.rotate(angle: pi,child: MyGhost(),);
                              case "left":
                                return MyGhost();
                              case "up":
                                return Transform.rotate(angle: 3*pi/2,child: MyGhost(),);
                              case "down":
                                return Transform.rotate(angle: pi/2,child: MyGhost(),);
                              default : return MyGhost();
                            }
                          }
                          else if(eatenFood.contains(index)){
                            return MyPath(
                              innerColor: Colors.black,
                              outerColor: Colors.black,
                            );
                          }
                          else{
                            return MyPath(
                              innerColor: Colors.yellow,
                              outerColor: Colors.black,
                            );
                          }
                        }),
                  ),
                )
            ),
          ]
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Text("Score: "+score.toString(),
              style: TextStyle(color: Colors.white,fontSize: 35),),
            /*GestureDetector(
                onTap : startGame,
                child: Text(
                    "P L A Y",
                    style: TextStyle(color: Colors.white,fontSize: 35))
            ),*/
            Text(timeLeft==0 ? 'DONE': timeLeft.toString(),
                  style: TextStyle(fontSize: 30,color: Colors.white),
            ),
            MaterialButton(
                onPressed: startGame,
                child: Text(
                    "P L A Y",
                    style: TextStyle(color: Colors.white,fontSize: 35)
                )
            )
          ],
        ),),
    );
  }
}