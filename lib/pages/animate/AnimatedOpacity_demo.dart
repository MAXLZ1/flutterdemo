import 'package:flutter/material.dart';

class  AnimatedOpacityRoute extends StatefulWidget{
  @override
  _AnimatedOpacityRouteState createState() {
    // TODO: implement createState
    return _AnimatedOpacityRouteState();
  }
}

class _AnimatedOpacityRouteState extends State<AnimatedOpacityRoute> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedOpacity(
              child: Container(
                constraints: BoxConstraints.tight(Size(300,300)),
                color: Colors.red,
                margin: EdgeInsets.symmetric(vertical: 30.0),
              ),
              opacity: _opacity,
              curve: Curves.easeOutSine,
              duration: Duration(seconds: 1),
            ),
            RaisedButton(
              child: Text('start animate'),
              onPressed: () {
                setState(() {
                  _opacity = (_opacity == 1.0 ? 0.0 : 1.0);
                });
              },
            )
          ],
        ),
      )
    );
  }
}