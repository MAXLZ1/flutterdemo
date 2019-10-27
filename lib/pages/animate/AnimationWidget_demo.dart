import 'package:flutter/material.dart';

class AnimationWidgetDemo extends AnimatedWidget{
  AnimationWidgetDemo({Key key, Animation<Size> animation}): super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<Size> animation = listenable;
    // TODO: implement build
    return Image.asset(
      'assets/images/lake.jpg',
      width: animation.value.width,
      height: animation.value.height,
    );
  }

}

class AnimatinoWidgetRoute extends StatefulWidget{
  @override
  _AnimatinoWidgetRouteState createState() {
    // TODO: implement createState
    return _AnimatinoWidgetRouteState();
  }
}

class _AnimatinoWidgetRouteState extends State<AnimatinoWidgetRoute> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<Size> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: Size(0, 0), end: Size(300, 200)).animate(controller);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.0),
            height: 200,
            child: AnimationWidgetDemo(animation: animation,)
          ),
          RaisedButton(
            child: Text('start animation'),
            onPressed: () {
              controller.forward();
            },
          )
        ],
      ),
    );
  }
}