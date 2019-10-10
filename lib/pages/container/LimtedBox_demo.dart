import 'package:flutter/material.dart';

class LimtedBoxRowDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
      children: [
        LimitedBox(
          maxWidth: 150.0,
          maxHeight: 200.0, // 不会生效
          child: Container(
            color: Colors.lightGreen,
            width: 250.0,
            height: 400.0,
          ),
        ),
      ],

    );
  }
}
class LimitedBoxColumnDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        LimitedBox(
          maxHeight: 100.0,
          maxWidth: 200.0, // maxWidth不会生效
          child: Container(
            color: Colors.blue,
            height: 300.0,
            width: 300.0,
          ),
        )
      ],
    );
  }
}