import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pacman/Game2/game/player.dart';
import 'package:pacman/Game2/game/path.dart';
import 'package:pacman/Game2/game/pixel.dart';
import 'package:pacman/Game2/game/ghost.dart';
import 'package:pacman/Game2/game/gamewon2.dart';
import 'package:pacman/Game2/game/gameover2.dart';


class Level2 extends StatefulWidget{
  @override
  _Level2State createState() => _Level2State();
}


class _Level2State extends State<Level2>{

  static int numberInRow= 11;
  int numberOfSquares= numberInRow * 17;
  int player =numberInRow*15 +1;

  List<int> barriers = [
    0,1,2,3,4,5,6,7,8,9,10,11,16,27,22,24,25,29,30,33,44,55,66,77,99,110,121
    ,132,143,154,165,176,177,178,179,180,181,182,183,184,185
    ,186,175,164,153,142,131,120,109,87,76,65,54,43,32,21
    ,24,46,30,51,52,78,79,80,47,49,71,82
    ,84,85,86,88,98,134,145,156,147,149,158,160,138,136,116,114
    ,140,151,162,100,101,102,103,105,106,107,108
  ];

  List<int> food =[];
  List<int> eatenFood =[];

  String direction="right";
  bool preGame=true;
  bool gameStarted=false;
  int score=0;
  int nbGhost=3;

  void startGame() {
    if(score==0) {
      preGame = false;
      moveGhost();
      moveGhost1();
      moveGhost2();
      gameStarted = true;
      getFood();
      _startCountDown();
      Duration duration = Duration(milliseconds: 180);
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

        if(player == ghost2){
          ghost2 = -1 ;
          score += 100 ;
          nbGhost--;
        }

        if(nbGhost==0 && score>900 && timeLeft==0){
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final response = await Future.delayed(Duration(seconds: 1));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GameWon2()));
          });
        }
        else if(timeLeft==0 && (nbGhost!=0 || score<1000)){
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final response = await Future.delayed(Duration(seconds: 1));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GameOver2()));
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
  int up =0;
  void moveGhost(){
    Duration duration=Duration(milliseconds: 400);
    Timer.periodic(duration, (timer)
    {
      if (ghost == 170) {
        ghostDirection = "right";
      }
      else if (ghost == 174) {
        ghostDirection = "up";
      }
      else if (ghost == 17 || ghost == 117) {
        ghostDirection = "down";
      }
      else if (ghost == 119 || ghost == 128) {
        ghostDirection = "left";
      }
      else if(ghost == 93 && down % 2 == 0){
        ghostDirection = "down";
        down++;
      }
      else if(ghost == 93 && down % 2 == 1){
        ghostDirection = "right";
        down++;
      }
      else if(ghost ==94 && left % 2 == 0){
        ghostDirection = "left";
        left++;
      }
      else if(ghost == 94 && left % 2 == 1){
        ghostDirection = "up";
        left++;
      }
      else if(ghost == 126 && up % 2 == 0){
        ghostDirection = "down";
        up++;
      }
      else if(ghost == 126 && up % 2 == 1){
        ghostDirection = "up";
        up++;
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
  int left1 = 0;
  void moveGhost1(){
    Duration duration=Duration(milliseconds: 400);
    Timer.periodic(duration, (timer)
    {
      if (ghost1 == 166) {
        ghostDirection1 = "right";
      }
      else if (ghost1 == 170) {
        ghostDirection1 = "up";
      }
      else if (ghost1 == 122) {
        ghostDirection1 = "down";
      }
      else if (ghost1 == 20) {
        ghostDirection1 = "left";
      }
      else if(ghost1 == 126 && left1 % 2 == 0){
        ghostDirection1 = "left";
        left1++;
      }
      else if(ghost1 == 126 && left1 % 2 == 1){
        ghostDirection1 = "up";
        left1++;
      }
      else if(ghost1 == 93){
        ghostDirection1 = "down";
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

  int ghost2=12;
  String ghostDirection2 = "right";
  void moveGhost2(){
    Duration duration=Duration(milliseconds: 400);
    Timer.periodic(duration, (timer)
    {

      if (ghost2 == 12) {
        ghostDirection2 = "right";
      }
      else if (ghost2 == 67) {
        ghostDirection2 = "up";
      }
      else if (ghost2 == 15) {
        ghostDirection2 = "down";
      }
      else if (ghost2 == 70) {
        ghostDirection2 = "left";
      }


      switch (ghostDirection2) {
        case "left":
          if (!barriers.contains(ghost2 - 1)) {
            if (mounted) setState(() {
              ghost2--;
            });
          }
          break;
        case "right":
          if (!barriers.contains(ghost2 + 1)) {
            if (mounted) setState(() {
              ghost2++;
            });
          }
          break;
        case "up":
          if (!barriers.contains(ghost2 - numberInRow)) {
            if (mounted) setState(() {
              ghost2 -= numberInRow;
            });
          }
          break;
        case "down":
          if (!barriers.contains(ghost2 + numberInRow)) {
            if (mounted) setState(() {
              ghost2 += numberInRow;
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


  int timeLeft=60;
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
                          else if(ghost==index || ghost1==index || ghost2==index){
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
                          else if(ghost2==index){
                            switch(ghostDirection2){
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