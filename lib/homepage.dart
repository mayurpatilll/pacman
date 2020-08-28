import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapman/path.dart';
import 'package:mapman/pixel.dart';
import 'package:mapman/player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 13;
  int player = numberInRow * 11 + 1;

  List<int> barriers = [
    0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,77,88,99,110,121,132,133,134,135,136,137,138,139,140,141,142,
    131,120,109,98,87,65,54,43,32,21,
    27,115,114,116,103,105,26,28,37,39,24,35,101,112,30,41,107,118,
    56,57,58,59,61,62,63,64,83,84,85,86,78,79,80,81,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
              child: Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow),
                    itemBuilder: (BuildContext context, int index){
                    if (player == index) {
                      return MyPlayer();
                    }else if (barriers.contains(index)) {
                      return MyPixel(
                        innerColor: Colors.red[800],
                        outerColor: Colors.red[900],
                        //child: Text(index.toString()),
                      );
                    } else {
                      return MyPath(
                        innerColor: Colors.yellowAccent,
                        outerColor: Colors.black,
                        //child: Text(index.toString()),
                      );
                    }
                    }),
              ),),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("SCORE: ", style: TextStyle(color: Colors.white, fontSize: 40),),
                  Text("P L A Y ", style: TextStyle(color: Colors.white, fontSize: 40),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
