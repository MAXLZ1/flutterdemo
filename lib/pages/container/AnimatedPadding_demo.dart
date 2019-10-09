import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget{
  @override
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State{
  double paddingVal = 20.0;

  _changePadding () {
    setState(() {
      paddingVal = paddingVal == 20.0 ? 100.0 : 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedPadding(
          padding: EdgeInsets.all(paddingVal),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.blue,
            height: 200.0,
          ),
        ),
        RaisedButton(
          child: Text('toggle padding'),
          onPressed: _changePadding,
        )
      ],
    );
  }
}