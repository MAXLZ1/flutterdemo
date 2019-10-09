import 'package:flutter/material.dart';

class CenterDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      widthFactor: 3.0,
      heightFactor: 2.0,
      child: Text(
        '这是居中文本',
        style: TextStyle(
          color: Colors.red,
          fontSize: 15
        ),
      ),
    );
  }
}