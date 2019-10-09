import 'package:flutter/material.dart';

class PaddingDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Container(
          height: 100,
          width: 180,
          color: Colors.red
      ),
    );
  }
}