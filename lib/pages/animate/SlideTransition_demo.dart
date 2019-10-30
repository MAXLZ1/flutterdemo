import 'package:flutter/material.dart';

class SlideTransitionRoute extends StatefulWidget{
  @override
  _SlideTransitionRouteState createState() {
    // TODO: implement createState
    return _SlideTransitionRouteState();
  }
}

class _SlideTransitionRouteState extends State<SlideTransitionRoute> with SingleTickerProviderStateMixin{
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
        title: Text('SlideTransition'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              width: double.infinity,
              alignment: Alignment.center,
              child: SlideTransition(
                position: Tween(begin: Offset(0, 0),end: Offset(1.5,0)).animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller)),
                child: Container(
                  constraints: BoxConstraints.tight(Size(300,300)),
                  color: Colors.red,
                ),
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