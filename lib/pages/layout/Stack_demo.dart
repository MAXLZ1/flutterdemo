import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: AlignmentDirectional.topStart,
      textDirection: TextDirection.ltr,
      fit: StackFit.loose,
      overflow: Overflow.clip,
      children: <Widget>[
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.yellow,
        ),
      ],
    );
  }
}

class StackAlignDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.settings, size: 30,),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.add_location, size: 30,),
          ),
          Align(
            alignment: Alignment(-1, 0.9),
            child: Icon(Icons.forward, size: 30,),
          ),
          Align(
            alignment: Alignment(1, 0.9),
            child: Icon(Icons.home, size: 30,),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.center_focus_strong, size: 40,),
          )
        ],
      ),
    );
  }
}

class StackPositionedDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: Icon(Icons.settings, size: 30,),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Icon(Icons.add_location, size: 30,),
        ),
        Positioned(
          left: 0,
          bottom: 20,
          child: Icon(Icons.forward, size: 30,),
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child: Icon(Icons.home, size: 30,),
        ),
        Positioned.fill(
          child: Icon(Icons.center_focus_strong, size: 40,),
        )
      ],
    );
  }
}