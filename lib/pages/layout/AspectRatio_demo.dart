import 'package:flutter/material.dart';

class AspectRatioDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      child: AspectRatio(
        aspectRatio: 3.0/2.0,
        child: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
