import 'package:flutter/material.dart';

class TransformDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Transform(
        origin: Offset(25,25),
        transform: Matrix4.skew(1.0, 1.0),
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.red,
        ),
      ),
    );
  }
}