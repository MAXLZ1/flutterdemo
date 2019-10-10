import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 100.0,
        minHeight: 50.0,
        maxWidth: 100.0,
        minWidth: 50.0
      ),
      child: Container(
        height: 1000.0,
        width: 1000.0,
        color: Colors.red,
      )
    );
  }
}