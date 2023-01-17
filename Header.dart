import 'package:flutter/material.dart';
Widget headerul(){
  return SizedBox(
    child:Stack(
      children:<Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
          child:Text("Categories",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child:Column(
            children: <Widget> [
              Row(
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0,0),
                    child: Column(
                        children: <Widget> [
                          Image.asset('assets/men.png',width: 50,height: 50,),
                          Text("Men",style: TextStyle(fontSize: 12)),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 20, 0),
                    child:Column(
                        children: <Widget> [
                          Image.asset('assets/women.png',width: 45,height: 45,),
                          Text("Women",style: TextStyle(fontSize: 12)),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child:Column(
                        children: <Widget> [
                          Image.asset('assets/devices.png',width: 45,height: 45,),
                          Text("Devices",style: TextStyle(fontSize: 12)),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child:Column(
                        children: <Widget> [
                          Image.asset('assets/music.png',width: 45,height: 45,),
                          Text("Music",style: TextStyle(fontSize: 12)),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child:Column(
                        children: <Widget> [
                          Image.asset('assets/game.png',width: 45,height: 45,),
                          Text("Game",style: TextStyle(fontSize: 12)),
                        ]
                    ),
                  ),
                ],
              ) ,
            ],
          ),
        ),
      ],
    ),
  );
}
