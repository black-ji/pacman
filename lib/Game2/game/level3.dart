import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pacman/Game2/game/player.dart';
import 'package:pacman/Game2/game/path.dart';
import 'package:pacman/Game2/game/pixel.dart';
import 'package:pacman/Game2/game/ghost.dart';
import 'package:pacman/Game2/game/gamewon3.dart';
import 'package:pacman/Game2/game/gameover3.dart';


class Level3 extends StatefulWidget{
  @override
  _Level3State createState() => _Level3State();
}


class _Level3State extends State<Level3>{

  static int numberInRow= 11;
  int numberOfSquares= numberInRow * 17;
  int player =numberInRow*15 +1;

  List<int> barriers = [
    0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,99,110,121
    ,132,143,154,165,176,177,178,179,180,181,182,183,184,185
    ,186,175,164,153,142,131,120,109,87,76,65,54,43,32,21
    ,91,90,89,88,95,96,97,98
    ,30,40,50,60,71,82,93,104,115,126,24,36,48,62,74,58,68
    ,112,124,136,138,128,118,146,156,150,162
  ];

  List<int> food =[];
  List<int> eatenFood =[];

  String direction="right";
  bool preGame=true;
  bool gameStarted=false;
  int score=0;
  int nbGhost=5;

  void startGame() {
    if(score==0) {
      preGame = false;
      moveGhost();
      moveGhost1();
      moveGhost2();
      moveGhost3();
      moveGhost4();
      gameStarted = true;
      getFood();
      _startCountDown();
      Duration duration = Duration(milliseconds: 200);
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

        if(player == ghost3){
          ghost3 = -1 ;
          score += 100 ;
          nbGhost--;
        }

        if(player == ghost4){
          ghost4 = -1 ;
          score += 100 ;
          nbGhost--;
        }

        if(nbGhost==0 && (score>1300 || timeLeft==0)){
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final response = await Future.delayed(Duration(seconds: 1));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GameWon3()));
          });
        }
        else if(timeLeft==0 && nbGhost!=0 && score<1000){
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final response = await Future.delayed(Duration(seconds: 1));
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GameOver3()));
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

  int ghost=51;
  String ghostDirection = "right";
  void moveGhost(){
    Duration duration=Duration(milliseconds: 1200);
    Timer.periodic(duration, (timer)
    {
      if (ghost == 45) {
        ghostDirection = "right";
      }
      else if (ghost == 53) {
        ghostDirection = "up";
      }
      else if (ghost == 12) {
        ghostDirection = "down";
      }
      else if (ghost == 20) {
        ghostDirection = "left";
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

  int ghost1=47;
  String ghostDirection1 = "left";
  void moveGhost1(){
    Duration duration=Duration(milliseconds: 1500);
    Timer.periodic(duration, (timer)
    {
      if (ghost1 == 45) {
        ghostDirection1 = "up";
      }
      else if (ghost1 == 53) {
        ghostDirection1 = "left";
      }
      else if (ghost1 == 12) {
        ghostDirection1 = "right";
      }
      else if (ghost1 == 20) {
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

  int ghost2=49;
  String ghostDirection2 = "up";
  void moveGhost2(){
    Duration duration=Duration(milliseconds: 2000);
    Timer.periodic(duration, (timer)
    {
      if (ghost2 == 16 || ghost2 == 105) {
        ghostDirection2 = "right";
      }
      else if (ghost2 == 67) {
        ghostDirection2 = "up";
      }
      else if (ghost2 == 20 || ghost2 == 83 || ghost2 == 108) {
        ghostDirection2 = "down";
      }
      else if (ghost2 == 86) {
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

  int ghost3=127;
  String ghostDirection3 = "up";
  void moveGhost3(){
    Duration duration=Duration(milliseconds: 800);
    Timer.periodic(duration, (timer)
    {
      if (ghost3 == 83 || ghost3 == 88 || ghost3 == 78) {
        ghostDirection3 = "right";
      }
      else if (ghost3 == 86) {
        ghostDirection3 = "up";
      }
      else if (ghost3 == 12 || ghost3 == 81 || ghost3 == 100) {
        ghostDirection3 = "down";
      }
      else if (ghost3 == 20 || ghost3 == 103) {
        ghostDirection3 = "left";
      }


      switch (ghostDirection3) {
        case "left":
          if (!barriers.contains(ghost3 - 1)) {
            if (mounted) setState(() {
              ghost3--;
            });
          }
          break;
        case "right":
          if (!barriers.contains(ghost3 + 1)) {
            if (mounted) setState(() {
              ghost3++;
            });
          }
          break;
        case "up":
          if (!barriers.contains(ghost3 - numberInRow)) {
            if (mounted) setState(() {
              ghost3 -= numberInRow;
            });
          }
          break;
        case "down":
          if (!barriers.contains(ghost3 + numberInRow)) {
            if (mounted) setState(() {
              ghost3 += numberInRow;
            });
          }
          break;
      }
    });
  }

  int ghost4=125;
  String ghostDirection4 = "up";
  void moveGhost4(){
    Duration duration=Duration(milliseconds: 800);
    Timer.periodic(duration, (timer)
    {
      if (ghost4 == 81 || ghost4 == 86) {
        ghostDirection4 = "left";
      }
      else if (ghost4 == 20 || ghost4 == 83 || ghost4 ==108) {
        ghostDirection4 = "down";
      }
      else if (ghost4 == 100 || ghost4 == 78) {
        ghostDirection4 = "up";
      }
      else if (ghost4 == 12 || ghost4 == 105) {
        ghostDirection4 = "right";
      }


      switch (ghostDirection4) {
        case "left":
          if (!barriers.contains(ghost4 - 1)) {
            if (mounted) setState(() {
              ghost4--;
            });
          }
          break;
        case "right":
          if (!barriers.contains(ghost4 + 1)) {
            if (mounted) setState(() {
              ghost4++;
            });
          }
          break;
        case "up":
          if (!barriers.contains(ghost4 - numberInRow)) {
            if (mounted) setState(() {
              ghost4 -= numberInRow;
            });
          }
          break;
        case "down":
          if (!barriers.contains(ghost4 + numberInRow)) {
            if (mounted) setState(() {
              ghost4 += numberInRow;
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


  int timeLeft=120;
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
                          else if(ghost3==index){
                            switch(ghostDirection3){
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
                          else if(ghost4==index){
                            switch(ghostDirection4){
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