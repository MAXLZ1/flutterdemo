import 'package:flutter/material.dart';

class AlignTransitionRoute extends StatefulWidget{
  @override
  _AlignTransitionRouteState createState() {
    // TODO: implement createState
    return _AlignTransitionRouteState();
  }
}

class _AlignTransitionRouteState extends State<AlignTransitionRoute> with SingleTickerProviderStateMixin{
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
        title: Text('AlignTransition'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              color: Colors.blue,
              child: AlignTransition(
                alignment: Tween(begin: Alignment(-1, -1), end: Alignment(1,1)).animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller)),
                child: Container(
                  constraints: BoxConstraints.tight(Size(200,200)),
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