import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionedTransitionRoute extends StatefulWidget {
  @override
  _PositionedTransitionRouteState createState() {
    // TODO: implement createState
    return _PositionedTransitionRouteState();
  }
}

class _PositionedTransitionRouteState extends State<PositionedTransitionRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _animate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PositionTranstion'),
      ),
      body: Stack(
        children: <Widget>[
          PositionedTransition(
            rect: RelativeRectTween(
                    begin: RelativeRect.fromLTRB(200.0, 200.0, 200.0, 200.0),
                    end: RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0))
                .animate(_controller),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Center(
              child: RaisedButton(
                child: Text('start animate'),
                onPressed: () {
                  _animate ? _controller.reverse() : _controller.forward();
                  setState(() {
                    _animate = !_animate;
                  });
                },
              ),
            )
          ),
        ],
      ),
    );
  }
}
