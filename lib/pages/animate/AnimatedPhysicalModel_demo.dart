import 'package:flutter/material.dart';

class AnimatedPhysicalModelRoute extends StatefulWidget{
  @override
  _AnimatedPhysicalModelRouteState createState() {
    // TODO: implement createState
    return _AnimatedPhysicalModelRouteState();
  }
}

class _AnimatedPhysicalModelRouteState extends State<AnimatedPhysicalModelRoute>{
  BorderRadius _radius = BorderRadius.circular(10.0);
  Color _color = Colors.red;
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PhysicalModel'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedPhysicalModel(child:
                Container(
                  constraints: BoxConstraints.tight(Size(300, 300)),
                ),
                shape: BoxShape.rectangle,
                borderRadius: _radius,
                elevation: 4.0,
                color: _color,
                shadowColor: _color,
                duration: Duration(seconds: 1)
            ),
            RaisedButton(
              child: Text('start animate'),
              onPressed: (){
                setState(() {
                  _animate = !_animate;
                  _radius = (_animate ? BorderRadius.circular(300.0) : BorderRadius.circular(10.0));
                  _color = (_animate ? Colors.blue : Colors.red);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}