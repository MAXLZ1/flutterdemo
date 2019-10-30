import 'package:flutter/material.dart';

class DecoratedBoxTransitionRoute extends StatefulWidget {
  @override
  _DecoratedBoxTransitionRouteState createState() {
    // TODO: implement createState
    return _DecoratedBoxTransitionRouteState();
  }
}

class _DecoratedBoxTransitionRouteState
    extends State<DecoratedBoxTransitionRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _animated = false;

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
        title: Text('DecoratedBoxTransition'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(height: 30.0,),
          DecoratedBoxTransition(
            decoration: DecorationTween(
                    begin: BoxDecoration(color: Colors.red),
                    end: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(300.0)))
                .animate(_controller),
            child: Container(
              constraints: BoxConstraints.tight(Size(300, 300)),
            ),
          ),
          SizedBox(height:30.0),
          RaisedButton(
            child: Text('start animate'),
            onPressed: () {
              _animated ? _controller.reverse() : _controller.forward();
              setState(() {
                _animated = !_animated;
              });
            },
          )
        ],
      )),
    );
  }
}
