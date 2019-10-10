import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget{
  Widget fractionallySizedBox = FractionallySizedBox(
    widthFactor: 0.5,
    heightFactor: 0.5,
    alignment: Alignment.topLeft,
    child: SizedBox.fromSize(
      size: Size(100.0, 70.0),
      child: RaisedButton(
        child: Text('pressed'),
        onPressed: () => print('1'),
      ),
    )
  );

  Widget sizedBox = SizedBox.fromSize(
      size: Size(100.0, 50.0),
      child: RaisedButton(
        child: Text('pressed'),
        onPressed: () => {},
      )
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return fractionallySizedBox;
  }
}