import 'package:flutter/material.dart';

class AlignDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300.0,
      color: Colors.redAccent,
      child: Align(
        alignment: Alignment.center,
        widthFactor: 2.0,
        heightFactor: 2.0,
        child: Text(
          'Align demo',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}