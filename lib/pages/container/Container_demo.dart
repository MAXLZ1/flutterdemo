import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart';
class ContainerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffff0000),
          width: 2.0,
        ),
        color: const Color(0xFFfff000),
          image: DecorationImage(
            image: NetworkImage('http://pic33.nipic.com/20131007/13639685_123501617185_2.jpg'),
            fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      width: 300.0,
      height: 150.0,
      //color: Colors.blue,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(20.0),
      constraints: BoxConstraints.expand(width: 200.0, height: 150.0),
//      foregroundDecoration: BoxDecoration(
//        border: Border.all(
//          color: const Color(0xFFd00a7f),
//          width: 2.0
//        )
//      ),
      transform: Matrix4.translation(Vector3(20.0, 30.0, 0)),
      child: Text(
        'Container demo',
        style: TextStyle(
          color: const Color(0xFFFF0000)
        ),
      ),
    );
  }
}