import 'package:flutter/material.dart';

class RotateBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RotatedBox(
      quarterTurns: 2,
      child: Text(
        'RotatedBox demo.'
      ),
    );
  }
}