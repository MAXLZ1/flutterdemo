import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisSize: MainAxisSize.max,
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.down,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Container(
          width: 80.0,
          height: 200.0,
          color: Colors.cyanAccent,
        ),
        Container(
          width: 80.0,
          color: Colors.red,
        ),
        Container(
          width: 80.0,
          height: 170.0,
          color: Colors.green,
        ),
        Container(
          width: 80.0,
          height: 600.0,
          color: Colors.orange,
        ),
      ],
    );
  }
}