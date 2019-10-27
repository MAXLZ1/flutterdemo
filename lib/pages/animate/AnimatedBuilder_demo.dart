import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget{
  @override
  _AnimatedBuilderDemoState createState() {
    // TODO: implement createState
    return _AnimatedBuilderDemoState();
  }
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: Size(0, 0), end: Size(300, 200))
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn))
        ..addStatusListener((status){
          print(status);
        });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child){
        return Center(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(vertical: 40.0),
                  height: 200,
                  child: Image.asset(
                    'assets/images/lake.jpg',
                    width: animation.value.width,
                    height: animation.value.height,
                  )
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
      },
    );
  }
}