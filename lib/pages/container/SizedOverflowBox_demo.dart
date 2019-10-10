import 'package:flutter/material.dart';

class SizedOverflowBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedOverflowBox(
      size: Size(150.0, 100.0),
      child: Container(
        height: 200.0,
        width: 200.0,
        color: Colors.blue,
      )
    );
  }
}