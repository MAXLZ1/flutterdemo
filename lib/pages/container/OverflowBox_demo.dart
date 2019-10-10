import 'package:flutter/material.dart';

class OverflowBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100.0,
      width: 100.0,
      color: Colors.red,
      child: OverflowBox(
        minHeight: 50.0,
        maxHeight: 80.0,
        child: Container(
          width: 100.0,
          height: 200.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}