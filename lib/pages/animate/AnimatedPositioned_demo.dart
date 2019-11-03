import 'package:flutter/material.dart';
import 'dart:ui';
class AnimatedPositionedRoute extends StatefulWidget {
  @override
  _AnimatedPositionedRouteState createState() {
    // TODO: implement createState
    return _AnimatedPositionedRouteState();
  }
}

class _AnimatedPositionedRouteState extends State<AnimatedPositionedRoute> {
  GlobalKey _key = GlobalKey();
  double _top = 0;
  double _left = 0;
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        key: _key,
        title: Text('AnimatedPositioned'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
                top: _top,
                left: _left,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                curve: Curves.bounceOut,
                duration: Duration(seconds: 1)
            ),
            Center(
              child: RaisedButton(
                child: Text('start animate'),
                onPressed: () {
                  setState(() {
                    print(window.padding);
                    _animate = !_animate;
                    if (_animate) {
                      _left = MediaQuery.of(context).size.width - 200;
                      _top = MediaQuery.of(context).size.height - 200 - _key.currentContext.size.height;
                    } else {
                      _left = 0;
                      _top = 0;
                    }
                  });
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
