import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.rtl,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 90.0,
          color: Colors.redAccent,
        ),
        Container(
          height: 100.0,
          width: 190.0,
          color: Colors.purpleAccent,
        ),
        Container(
          height: 100.0,
          color: Colors.cyanAccent,
        ),
        Container(
          height: 100.0,
          width: 200.0,
          color: Colors.greenAccent,
        ),
        Container(
          height: 100.0,
          width: 290.0,
          color: Colors.yellow,
        ),
      ],
    );
  }
}