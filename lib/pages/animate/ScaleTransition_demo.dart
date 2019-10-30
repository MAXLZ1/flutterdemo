import 'package:flutter/material.dart';

class ScaleTransitionRoute extends StatefulWidget{
  @override
  _ScaleTransitionRouteState createState() {
    // TODO: implement createState
    return _ScaleTransitionRouteState();
  }
}

class _ScaleTransitionRouteState extends State<ScaleTransitionRoute> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  bool _animate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaleTransition'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ScaleTransition(
              scale: Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(curve: Curves.bounceIn, parent: _controller)),
              child: Container(
                constraints: BoxConstraints.tight(Size(300, 300)),
                color: Colors.red,
                margin: EdgeInsets.symmetric(vertical: 30.0),
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
      )
    );
  }
}