import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleRoute extends StatefulWidget{
  @override
  _AnimatedDefaultTextStyleRouteState createState() {
    // TODO: implement createState
    return _AnimatedDefaultTextStyleRouteState();
  }
}

class _AnimatedDefaultTextStyleRouteState extends State<AnimatedDefaultTextStyleRoute> {
  double _fontSize = 10.0;
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedDefaultTextStyle(
              child: Container(
                constraints: BoxConstraints.tight(Size(300,300)),
                alignment: Alignment.center,
                child: Text(
                    'AnimatedDefaultTextStyle'
                ),
              ),
              style: TextStyle(
                fontSize: _fontSize,
                color: _color
              ),
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
            ),
            FlatButton(
              child: Text('start animate'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  _fontSize = (_fontSize == 20.0 ? 10.0 : 20.0);
                  _color = (_color == Colors.blue ? Colors.red : Colors.blue);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}