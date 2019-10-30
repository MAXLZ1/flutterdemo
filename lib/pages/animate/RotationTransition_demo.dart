import 'package:flutter/material.dart';

class RotationTransitionRoute extends StatefulWidget{
  @override
  _RotationTransitionRouteState createState() {
    // TODO: implement createState
    return _RotationTransitionRouteState();
  }
}

class _RotationTransitionRouteState extends State<RotationTransitionRoute> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  bool _animate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('RatationTransition'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(curve: Curves.easeIn, parent: _controller)),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                margin: EdgeInsets.all(100.0),
              ),
            ),
            RaisedButton(
              child: Text('start animate'),
              onPressed: () {
                _animate ? _controller.reverse() : _controller.forward();
                setState(() {
                  _animate = !_animate;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}